#include "dbt/aot/aot.h"
#include "dbt/guest/rv32_cpu.h"
#include "dbt/tcache/objprof.h"
#include "dbt/tcache/tcache.h"
#include "dbt/ukernel.h"
#include "dbt/util/fsmanager.h"
#include <boost/any.hpp>
#include <boost/program_options.hpp>
#include <boost/tokenizer.hpp>
#include <iostream>

namespace bpo = boost::program_options;

struct ElfAotOptions {
	std::string elf{};
	std::string cache{};
	bool use_llvm{};
	std::string logs{};
	std::string mgdump{};
	u64 threshold{};
	bool llvmopt{};
};

static void PrintHelp(bpo::options_description &adesc)
{
	std::cout << "usage: [options]\n";
	std::cout << adesc << "\n";
}

static bool ParseOptions(ElfAotOptions &o, int argc, char **argv)
{
	bpo::options_description adesc("options");
	// clang-format off
	adesc.add_options()
	    ("help",   "help")
	    ("logs",   bpo::value(&o.logs)->default_value(""), "enabled log streams separated by :")
	    ("elf", bpo::value(&o.elf)->required(), "elf file to translate")
	    ("cache",  bpo::value(&o.cache)->required(), "dbt cache path")
	    ("llvm",    bpo::value(&o.use_llvm)->default_value(true), "use llvm backend")
	    ("mgdump", bpo::value(&o.mgdump)->default_value(""), "module graphs dump dir, specify to enable")
	    ("threshold", bpo::value(&o.threshold)->default_value(0), "threshold of execution count to compile")
		("llvmopt", bpo::value(&o.llvmopt)->default_value(false), "enable llvm optimization");
	// clang-format on

	try {
		bpo::variables_map vmap;
		bpo::store(bpo::parse_command_line(argc, argv, adesc), vmap);
		if (vmap.count("help")) {
			PrintHelp(adesc);
			return false;
		}
		bpo::notify(vmap);
	} catch (std::exception &e) {
		std::cerr << "Bad options: " << e.what() << "\n";
		PrintHelp(adesc);
		return false;
	}
	return true;
}

static void SetupLogger(std::string const &logopt)
{
	boost::char_separator sep(":");
	boost::tokenizer tok(logopt, sep);
	for (auto const &e : tok) {
		dbt::Logger::enable(e.c_str());
	}
}

int main(int argc, char **argv)
{
	ElfAotOptions opts;
	if (!ParseOptions(opts, argc, argv)) {
		return 1;
	}
	dbt::config::threshold = opts.threshold;
	dbt::config::llvmopt = opts.llvmopt;

	SetupLogger(opts.logs);
	if (!opts.mgdump.empty()) {
		dbt::InitModuleGraphDump(opts.mgdump.c_str());
	}

	dbt::fsmanager::Init(opts.cache.c_str());
	dbt::objprof::Init(opts.cache.c_str(), false);
	dbt::mmu::Init();

	dbt::ukernel::ReproduceElfMappings(opts.elf.c_str());

	if (opts.use_llvm) {
		dbt::LLVMAOTCompileELF();
	} else {
		dbt::AOTCompileELF();
	}

	dbt::fsmanager::Destroy();
	if constexpr (dbt::config::debug) {
		dbt::objprof::Destroy();
		dbt::mmu::Destroy();
	}
	return 0;
}
