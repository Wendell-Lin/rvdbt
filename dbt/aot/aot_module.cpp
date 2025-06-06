#include "dbt/aot/aot_module.h"
#include <iomanip>
#include <list>
#include <set>
#include <sstream>
#include <vector>

namespace dbt
{
LOG_STREAM(aot)

static FILE *g_modulegraph_dump = nullptr;

// Add this global structure to store cross-segment branch information
struct CrossSegmentBranch {
	u32 src_ip;
	u32 target_ip;
};
static std::vector<CrossSegmentBranch> g_cross_segment_branches;
static std::set<u32> g_ip_set;

void InitModuleGraphDump(char const *dir)
{
	auto fpath = std::string(dir) + "/modulegraph.gv";
	FILE *f = fopen(fpath.c_str(), "w");
	if (f == nullptr) {
		Panic();
	}
	g_modulegraph_dump = f;
	fprintf(f, "digraph rvdbt_modulegraph{\nnode[style=\"rounded,filled\",shape=rect]\n");
	atexit([]() {
		// Add all cross-segment branch edges
		// if (dbt::config::cross_segment_branch) {
		// 	for (const auto& branch : g_cross_segment_branches) {
		// 		if (g_ip_set.find(branch.target_ip) != g_ip_set.end()) {
		// 			fprintf(g_modulegraph_dump, 
		// 				"B%08x->B%08x[color=magenta,penwidth=2,style=dashed]\n", 
		// 				branch.src_ip, branch.target_ip);
		// 		}
		// 	}
		// }
		
		fprintf(g_modulegraph_dump, "}\n");
		fclose(g_modulegraph_dump);
	});
}

static void DumpModuleGraph(ModuleGraph *mg, std::vector<std::vector<ModuleGraphNode *>> const *regions)
{
	mg->Dump(g_modulegraph_dump, regions);
}

void ModuleGraph::Dump(FILE *f, std::vector<std::vector<ModuleGraphNode *>> const *regions)
{
	auto const add_node = [f](u32 ip, u64 exec_count, u32 exec_instr_count, char const *color) {
		fprintf(f, "B%08x[fillcolor=%s,label=\"%08x\\n%lu\\n%u\"]\n", ip, color, ip, exec_count, exec_instr_count);
	};

	auto const add_edge = [f](u32 src, u32 tgt, char const *opts) {
		fprintf(f, "B%08x->B%08x[%s]\n", src, tgt, opts);
	};

	auto dump_node = [&](ModuleGraphNode const &n) {
		auto flags = n.flags;
		g_ip_set.insert(n.ip);

		add_node(n.ip, n.flags.exec_count, n.flags.exec_instr_count,
			(dbt::config::threshold && flags.exec_count >= dbt::config::threshold) ? "red" 
					: flags.is_segment_entry  ? "green"
			       : flags.is_brind_target ? "orange"
			       : flags.region_entry    ? "purple"
						       : "cyan");
	};

	auto dump_edge = [&](ModuleGraphNode const &n, ModuleGraphNode const &t) {
		if (n.ip >= t.ip) {
			add_edge(t.ip, n.ip, "color=red,penwidth=2,dir=back");
		} else {
			add_edge(n.ip, t.ip, "");
		}
	};

	auto dump_link = [&](ModuleGraphNode const &n, ModuleGraphNode const &t) {
		add_edge(n.ip, t.ip, "color=darkgreen,style=dashed");
	};

	auto dump_crosssegment_branch = [&](ModuleGraphNode const &n, u32 target_ip) {
		// Create a virtual node for the external target with special styling
		fprintf(f, "B%08x_ext[fillcolor=yellow,style=dashed,label=\"%08x\\nExternal\"]\n", 
				target_ip, target_ip);
		
		// Add an edge from the source to the virtual target
		fprintf(f, "B%08x->B%08x_ext[color=magenta,penwidth=2,style=dashed]\n", 
				n.ip, target_ip);
	};

	// Dump all nodes and regular edges
	for (auto const &it : ip_map) {
		auto const &n = *it.second;
		dump_node(n);
		for (auto const &s : n.succs) {
			dump_edge(n, *s);
		}
		if (n.link) {
			dump_link(n, *n.link);
		}
		// Visualize cross-segment branches
		if (dbt::config::cross_segment_branch) {
			for (auto const &target_ip : n.cross_succs) {
				dump_crosssegment_branch(n, target_ip);
				// g_cross_segment_branches.push_back({n.ip, target_ip});
			}
		}
	}

	if (regions) {
		for (auto const &r : *regions) {
			fprintf(f, "subgraph cluster_R%08x{style=filled;color=lightgrey;\n", r[0]->ip);
			for (auto const &n : r) {
				fprintf(f, " B%08x", n->ip);
			}
			fprintf(f, "}\n");
		}
	}
}

struct RPOTraversal {
	using OrderVec = std::vector<ModuleGraphNode *>;

	using rpo_iterator = OrderVec::reverse_iterator;
	using const_rpo_iterator = OrderVec::const_reverse_iterator;

	RPOTraversal(ModuleGraph &graph)
	{
		Compute(graph);
	}

	rpo_iterator begin()
	{
		return po_nodes.rbegin();
	}
	const_rpo_iterator begin() const
	{
		return po_nodes.crbegin();
	}
	rpo_iterator end()
	{
		return po_nodes.rend();
	}
	const_rpo_iterator end() const
	{
		return po_nodes.crend();
	}

private:
	void Compute(ModuleGraph &graph);

	std::vector<ModuleGraphNode *> po_nodes;
};

void RPOTraversal::Compute(ModuleGraph &graph)
{
	auto n_nodes = graph.ip_map.size() + 1;
	po_nodes.reserve(n_nodes);

	using ChildIt = std::vector<ModuleGraphNode *>::iterator;
	std::vector<std::pair<ModuleGraphNode *, ChildIt>> stk;

	qir::Marker<ModuleGraphNode, bool> marker(&graph.markers, 2);

	auto push_node = [&](ModuleGraphNode *node) {
		if (!marker.Get(node)) {
			stk.push_back(std::make_pair(node, node->succs.begin()));
			marker.Set(node, true);
		}
	};

	push_node(graph.root.get());

	while (!stk.empty()) {
		auto &p = stk.back();
		if (p.second == p.first->succs.end()) {
			po_nodes.push_back(p.first);
			stk.pop_back();
		} else {
			push_node(*p.second++);
		}
	}
}

void ModuleGraph::ComputeDomTree()
{
	using Node = ModuleGraphNode;
	auto const rpot = RPOTraversal(*this);

	auto n_nodes = ip_map.size() + 1;
	assert(n_nodes <= std::numeric_limits<u16>::max()); // TODO: use u32 or even u64 if the region is too large.
	qir::Marker<ModuleGraphNode, u16> rpon(&markers, n_nodes);
	{
		u16 rpo_no = 0;
		for (auto n : rpot) {
			rpon.Set(n, rpo_no++);
		}
		if (rpo_no != n_nodes) {
			log_analyse("%lu v.s. %u", rpo_no, n_nodes);
			Panic("unreachable regions in modulegraph");
		}
	}

	auto *start = root.get();
	start->dominator = start;

	auto intersect = [&](Node *b1, Node *b2) {
		while (b1 != b2) {
			while (rpon.Get(b1) > rpon.Get(b2)) {
				b1 = b1->dominator;
			}
			while (rpon.Get(b2) > rpon.Get(b1)) {
				b2 = b2->dominator;
			}
		}
		return b1;
	};

	bool changed = true;
	while (changed) {
		changed = false;
		for (auto b : rpot) {
			if (b == start) {
				continue;
			}
			Node *new_idom = nullptr;
			for (auto p : b->preds) {
				if (p->dominator) {
					new_idom = new_idom ? intersect(p, new_idom) : p;
				}
			}
			assert(new_idom);
			if (b->dominator != new_idom) {
				b->dominator = new_idom;
				changed = true;
			}
		}
	}
}

void ModuleGraph::ComputeDomFrontier()
{
	for (auto const &e : ip_map) {
		auto b = e.second.get();
		if (b->preds.size() > 1) {
			for (auto runner : b->preds) {
				while (runner != b->dominator) {
					runner->domfrontier.insert(b);
					runner = runner->dominator;
				}
			}
		}
	}
}

void ModuleGraph::ComputeRegionIDF()
{
	std::vector<ModuleGraphNode *> wlist;

	for (auto const &e : ip_map) {
		auto n = e.second.get();
		if (n->flags.is_brind_target || n->flags.is_segment_entry) {
			n->flags.region_entry = true;
			wlist.push_back(n);
		}
	}

	while (!wlist.empty()) {
		auto x = wlist.back();
		wlist.pop_back();

		for (auto y : x->domfrontier) {
			if (!y->flags.region_entry) {
				wlist.push_back(y);
			}
		}

		x->flags.region_entry = true;
	}
}

std::vector<std::vector<ModuleGraphNode *>> ModuleGraph::ComputeRegionDomSets()
{
	std::vector<std::vector<ModuleGraphNode *>> regions;

	auto compute_region = [this](ModuleGraphNode *entry) {
		qir::Marker<ModuleGraphNode, bool> marker(&markers, 2);

		std::vector<ModuleGraphNode *> region_nodes{};

		using ChildIt = std::vector<ModuleGraphNode *>::iterator;
		std::vector<std::pair<ModuleGraphNode *, ChildIt>> stk;

		auto push_node = [&](ModuleGraphNode *node, bool force = false) {
			if (force || (!marker.Get(node) && !node->flags.region_entry)) {
				stk.push_back(std::make_pair(node, node->succs.begin()));
				marker.Set(node, true);
				region_nodes.push_back(node);
			}
		};

		push_node(entry, true);

		while (!stk.empty()) {
			auto &p = stk.back();
			if (p.second == p.first->succs.end()) {
				stk.pop_back();
			} else {
				push_node(*p.second++);
			}
		}

		return region_nodes;
	};

	for (auto const &e : ip_map) {
		auto n = e.second.get();
		if (n->flags.region_entry) {
			regions.push_back(compute_region(n));
		}
	}

	return regions;
}

std::vector<std::vector<ModuleGraphNode *>> ModuleGraph::ComputeRegions()
{
	ComputeDomTree();
	ComputeDomFrontier();
	ComputeRegionIDF();
	auto regions = ComputeRegionDomSets();

	if (g_modulegraph_dump) {
		DumpModuleGraph(this, &regions);
	}
	return regions;
}

} // namespace dbt
