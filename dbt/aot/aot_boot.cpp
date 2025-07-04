#include "dbt/aot/aot.h"
#include "dbt/qmc/compile.h"
#include "dbt/tcache/objprof.h"
#include "dbt/util/fsmanager.h"
#include "dbt/execute.h"

#include <sstream>
#include <fstream>
#include <string>
extern "C" {
#include <dlfcn.h>
#include <fcntl.h>
#include <link.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
}

namespace dbt
{
LOG_STREAM(aot)

static size_t get_vm_size() {
    std::ifstream status("/proc/self/status");
    std::string line;
    while (std::getline(status, line)) {
        if (line.rfind("VmSize:", 0) == 0) {
            std::istringstream iss(line.substr(7)); // skip "VmSize:"
            size_t vm_kb;
            std::string unit;
            iss >> vm_kb >> unit;
            if (unit == "kB")
                return vm_kb;
        }
    }
    return 0;
}


void BootAOTFile()
{
	size_t vm_size_before = get_vm_size();
	void *so_handle;
	link_map *lmap;
	{
		DBT_FS_LOCK();
		auto aot_path = objprof::GetCachePath(AOT_SO_EXTENSION);
		log_dbt("profile name: %s", aot_path.c_str());

		if (so_handle = dlopen(aot_path.c_str(), RTLD_NOW); !so_handle) {
			log_dbt("failed to open %s: %s, skip aot boot", aot_path.c_str(), dlerror());
		}
		if (dlinfo(so_handle, RTLD_DI_LINKMAP, (void *)&lmap) < 0) {
			Panic();
		}
	}

	auto l_addr = (u8 *)lmap->l_addr;

	auto aottab = (AOTTabHeader const *)dlsym(so_handle, AOT_SYM_AOTTAB);
	assert(aottab);

	auto announce = [l_addr](AOTSymbol const *sym) {
		auto tb = tcache::AllocateTBlock();
		if (tb == nullptr) {
			Panic();
		}
		tb->ip = sym->gip;
		tb->tcode = TBlock::TCode{l_addr + sym->aot_vaddr, 0};
		tcache::Insert(tb);
		tcache::CacheBr(tb); // todo: validate this if a brcc to llvm aot occurs.
		tcache::CacheBrind(tb);
		log_dbt("announce ip: %x", tb->ip);
	};

	for (u64 idx = 0; idx < aottab->n_sym; ++idx) {
		announce(&aottab->sym[idx]);
	}
	size_t vm_size = get_vm_size();
	log_dbt("aot size: %zu KB", vm_size - vm_size_before);
}

} // namespace dbt
