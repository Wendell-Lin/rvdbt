#include "dbt/tcache/objprof.h"
#include "dbt/aot/aot.h"
#include "dbt/util/fsmanager.h"
#include <fcntl.h>

namespace dbt
{

static std::string g_dbt_cache_dir;

FileChecksum FileChecksum::FromFile(int fd)
{
	struct stat st;
	int res;
	if (res = fstat(fd, &st); res < 0) {
		Panic();
	}

	void *fmap;
	if (fmap = dbt::host_mmap(NULL, st.st_size, PROT_READ, MAP_SHARED, fd, 0); fmap == MAP_FAILED) {
		Panic();
	}

	FileChecksum sum;

	EVP_MD_CTX *mdctx;
	mdctx = EVP_MD_CTX_new();
	if (!EVP_DigestInit_ex(mdctx, EVP_md5(), NULL)) {
		Panic();
	}
	if (!EVP_DigestUpdate(mdctx, (uint8_t const *)fmap, st.st_size)) {
		Panic();
	}
	if (!EVP_DigestFinal_ex(mdctx, sum.data, NULL)) {
		Panic();
	}
	EVP_MD_CTX_free(mdctx);
	return sum;
}

void objprof::Init(char const *path, bool use_aot_)
{
	char buf[PATH_MAX];
	if (!realpath(path, buf)) {
		Panic(std::string("failed to resolve ") + path);
	}
	g_dbt_cache_dir = std::string(buf) + "/";
	use_aot_files = use_aot_;
}

static std::string MakeCachePath(FileChecksum const &csum, char const *extension)
{
	return g_dbt_cache_dir + csum.ToString() + extension;
}

std::string objprof::GetCachePath(char const *extension)
{
	assert(HasProfile());
	return MakeCachePath(elf_prof.fmap->csum, extension);
}

objprof::ElfProfile objprof::elf_prof{};
bool objprof::use_aot_files = false;

void objprof::Announce(int elf_fd, bool jit_mode)
{
	auto csum = FileChecksum::FromFile(elf_fd);
	auto path = MakeCachePath(csum, ".prof");

	auto &pfile = elf_prof;
	pfile.fsize = 64_MB;

	log_prof("Lookup profile at %s", path.c_str());
	auto [fmap, file_state] = dbt::fsmanager::OpenCacheFile(path.c_str(), pfile.fsize, jit_mode);

	if (file_state == fsmanager::CacheState::NO_FILE) {
		log_prof("No profile available at %s", path.c_str());
		return;
	}

	pfile.fmap = (FileHeader *)fmap;

	if (file_state == fsmanager::CacheState::RDWR_NEW) {
		pfile.fmap->csum = csum;
		pfile.fmap->n_pages = 0;
	} else {
		if (pfile.fmap->csum != csum) {
			Panic("bad checksum " + path);
		}
		for (u32 idx = 0; idx < pfile.fmap->n_pages; ++idx) {
			auto pageno = pfile.fmap->pages[idx].pageno;
			log_prof("Found PageData for pageno=%u", pageno);
			pfile.page2idx.insert({pageno, idx});
		}
		if (use_aot_files) {
			BootAOTFile();
		}
	}
}

void objprof::Destroy()
{
	auto &pfile = elf_prof;
	int rc;

	if (!elf_prof.fmap) {
		return;
	}
	if (rc = munmap(pfile.fmap, pfile.fsize); rc != 0) {
		Panic();
	}
}

u32 objprof::AllocatePageData(u32 pageno)
{
	log_prof("Allocate PageData for pageno=%u", pageno);
	auto &pfile = elf_prof;
	auto fmap = pfile.fmap;
	auto idx = fmap->n_pages++;
	if ((uptr)&fmap->pages[fmap->n_pages] - (uptr)fmap > pfile.fsize) {
		Panic();
	}
	auto page_data = &fmap->pages[idx];
	page_data->pageno = pageno;
	return idx;
}

objprof::PageData *objprof::GetOrCreatePageData(u32 pageno)
{
	auto &pfile = elf_prof;
	auto it = pfile.page2idx.insert({pageno, 0});
	if (it.second) {
		it.first->second = AllocatePageData(pageno);
	}
	return &pfile.fmap->pages[it.first->second];
}

void objprof::UpdateProfile()
{
	auto &tmap = tcache::tcache_map;

	for (auto it = tmap.begin(); it != tmap.end();) {
		it = UpdatePageProfile(it);
	}
}

tcache::MapType::iterator objprof::UpdatePageProfile(tcache::MapType::iterator it)
{
	u32 const pageno = it->first >> mmu::PAGE_BITS;
	auto *const page_data = GetOrCreatePageData(pageno);
	assert(page_data->pageno == pageno);
	log_prof("Update PageData for pageno=%u", pageno);

	for (; (it->first >> mmu::PAGE_BITS) == pageno; ++it) {
		auto tb = it->second;
		auto po_idx = PageData::po2idx(it->first & ~mmu::PAGE_MASK);
		if (page_data->executed.test(po_idx) != true) {
			log_prof("new tb: %08x", it->first);
		}

		auto upd_observed = [&](PageData::PageBitset &bits, bool val) {
			if (val) {
				bits.set(po_idx);
			}
		};

		page_data->exec_instr_count[po_idx] = tb->flags.exec_instr_count;
		page_data->exec_count[po_idx] = tb->flags.exec_count;
		log_prof("Update PageData for pageno=%u, po_idx=%u, exec_instr_count=%llu, exec_count=%llu", pageno, po_idx, page_data->exec_instr_count[po_idx], page_data->exec_count[po_idx]);
		upd_observed(page_data->executed, true);
		upd_observed(page_data->brind_target, tb->flags.is_brind_target);
		upd_observed(page_data->segment_entry, tb->flags.is_segment_entry);
	}
	return it;
}

bool objprof::HasProfile()
{
	return elf_prof.fmap != nullptr;
}

std::span<const objprof::PageData> const objprof::GetProfile()
{
	assert(HasProfile());
	auto const *fmap = elf_prof.fmap;
	return {fmap->pages, fmap->n_pages};
}

} // namespace dbt
