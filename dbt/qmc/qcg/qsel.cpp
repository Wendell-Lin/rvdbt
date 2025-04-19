#include "dbt/qmc/qcg/arch_traits.h"
#include "dbt/qmc/qcg/qcg.h"
#include "dbt/qmc/qir_builder.h"
#include "dbt/execute.h"

namespace dbt::qcg
{

struct QSel {
	QSel(qir::Region *region_, MachineRegionInfo *region_info_)
	    : region(region_), region_info(region_info_)
	{
	}

	void Run();

	void SelectOperands(qir::Inst *ins);

	void merge_vmload2(qir::Block& bb);
	void merge_vmload4(qir::Block& bb);
	void merge_vmstore2(qir::Block& bb);
	void merge_vmstore4(qir::Block& bb);
	void merge_mov_store_mov_add_store(qir::Block& bb);

	qir::Region *region{};
	qir::Builder qb{nullptr};
	MachineRegionInfo *region_info{};
};

void QSel::SelectOperands(qir::Inst *ins)
{
	auto *op_ct = GetOpInfo(ins->GetOpcode()).ra_ct;
	assert(op_ct);
	auto srcl = ins->inputs();
	auto dstl = ins->outputs();
	auto src_n = srcl.size();
	auto dst_n = dstl.size();
	// satisfy aliases
	for (u8 i = 0; i < src_n; ++i) {
		auto &ct = op_ct[dst_n + i];
		if (!ct.has_alias) {
			continue;
		}
		auto *src = &srcl[i];
		auto *dst = &dstl[ct.alias];
		assert(dst->IsVGPR());
		if (src->IsVGPR() && src->GetVGPR() == dst->GetVGPR()) {
			continue;
		}

		bool live_input = false;
		for (u8 k = 0; k < src_n; ++k) {
			auto *src2 = &srcl[k];
			if (k != i && src2->IsVGPR() && src2->GetVGPR() == dst->GetVGPR()) {
				live_input = true;
				break;
			}
		}
		if (live_input) {
			auto tmp = qir::VOperand::MakeVGPR(dst->GetType(), qb.CreateVGPR(dst->GetType()));
			qb.Create_mov(tmp, *dst);
			for (u8 k = 0; k < src_n; ++k) {
				auto *src2 = &srcl[k];
				if (k != i && src2->IsVGPR() && src2->GetVGPR() == dst->GetVGPR()) {
					*src2 = tmp;
				}
			}
		}
		qb.Create_mov(*dst, *src);
		*src = *dst;
	}
	// lower constants
	for (u8 i = 0; i < src_n; ++i) {
		auto &ct = op_ct[dst_n + i];
		auto *src = &srcl[i];
		if (!src->IsConst()) {
			continue;
		}
		auto type = src->GetType();
		auto val = src->GetConst();
		if (ct.ci != RACtImm::NO && ArchTraits::match_gp_const(type, val, ct.ci)) {
			continue;
		}
		auto tmp = qir::VOperand::MakeVGPR(type, qb.CreateVGPR(type));
		qb.Create_mov(tmp, *src);
		*src = tmp;
	}
}

struct QSelVisitor : qir::InstVisitor<QSelVisitor, void> {
	using Base = qir::InstVisitor<QSelVisitor, void>;

public:
	QSelVisitor(QSel *sel_) : sel(sel_) {}

	void visitInst(qir::Inst *ins)
	{
		unreachable("");
	}

	void visitInstUnop(qir::InstUnop *ins)
	{
		sel->SelectOperands(ins);
	}

	void visitInstBinop(qir::InstBinop *ins)
	{
		sel->SelectOperands(ins);
	}

	void visitInstSetcc(qir::InstSetcc *ins)
	{
		sel->SelectOperands(ins);
	}

	void visitInstBr(qir::InstBr *ins) {}

	void visitInstBrcc(qir::InstBrcc *ins)
	{
		sel->SelectOperands(ins);
	}

	void visitInstGBr(qir::InstGBr *ins) {}

	void visitInstGBrind(qir::InstGBrind *ins)
	{
		sel->SelectOperands(ins);
	}

	void visitInstVMLoad(qir::InstVMLoad *ins)
	{
		sel->SelectOperands(ins);
	}

	void visitInstVMStore(qir::InstVMStore *ins)
	{
		sel->SelectOperands(ins);
	}
	
	void visitInstVMLoad2(qir::InstVMLoad2 *ins)
	{
		sel->SelectOperands(ins);
	}

	void visitInstVMLoad4(qir::InstVMLoad4 *ins)
	{
		sel->SelectOperands(ins);
	}

	void visitInstVMStore2(qir::InstVMStore2 *ins)
	{
		sel->SelectOperands(ins);
	}

	void visitInstVMStore4(qir::InstVMStore4 *ins)
	{
		sel->SelectOperands(ins);
	}

	void visitInstHcall(qir::InstHcall *ins) {}

	void visit_sll(qir::InstBinop *ins)
	{
		sel->SelectOperands(ins);
	}

	void visit_srl(qir::InstBinop *ins)
	{
		sel->SelectOperands(ins);
	}

	void visit_sra(qir::InstBinop *ins)
	{
		sel->SelectOperands(ins);
	}
	// TODO: maybe remove these?
	void visit_mul(qir::InstBinop *ins)
	{
		sel->SelectOperands(ins);
	}

	void visit_mulh(qir::InstBinop *ins)
	{
		sel->SelectOperands(ins);
	}

	void visit_mulhsu(qir::InstBinop *ins)
	{
		sel->SelectOperands(ins);
	}

	void visit_mulhu(qir::InstBinop *ins)
	{
		sel->SelectOperands(ins);
	}
	
	void visit_div(qir::InstBinop *ins)
	{
		sel->SelectOperands(ins);
	}
	
	void visit_divu(qir::InstBinop *ins)
	{
		sel->SelectOperands(ins);
	}

	void visit_rem(qir::InstBinop *ins)
	{
		sel->SelectOperands(ins);
	}

	void visit_remu(qir::InstBinop *ins)
	{
		sel->SelectOperands(ins);
	}

private:
	QSel *sel{};
};

void QSel::Run()
{
	for (auto &bb : region->GetBlocks()) {
		// TODO: refactor below functions and impl them in llvm emit_vmload2, ..., etc.
		// 		However, below code is correct and works in jit mode
		// merge_vmload4(bb);
		// merge_vmload2(bb);
		// merge_vmstore4(bb);
		// merge_vmstore2(bb); 
		// merge_mov_store_mov_add_store(bb);
		
		// Then proceed with normal instruction selection
		auto &ilist = bb.ilist;
		for (auto iit = ilist.begin(); iit != ilist.end(); ++iit) {
			qb = qir::Builder(&bb, iit);
			QSelVisitor(this).visit(&*iit);
			
			if (iit->GetFlags() & qir::Inst::HAS_CALLS) {
				region_info->has_calls = true;
			}
		}
	}
}
void QSel::merge_vmload4(qir::Block& bb) {
	log_qcg("merge_vmload4");
	for (auto iit = bb.ilist.begin(); iit != bb.ilist.end(); ++iit) {
		auto curr = iit;
		if (curr->GetOpcode() != qir::Op::_mov)
			continue;
		auto next = std::next(iit);
		if (next == bb.ilist.end() || next->GetOpcode() != qir::Op::_add)
			continue;
		auto next2 = std::next(next);
		if (next2 == bb.ilist.end() || next2->GetOpcode() != qir::Op::_vmload)
			continue;
		auto next3 = std::next(next2);
		if (next3 == bb.ilist.end() || next3->GetOpcode() != qir::Op::_mov)
			continue;
		auto next4 = std::next(next3);
		if (next4 == bb.ilist.end() || next4->GetOpcode() != qir::Op::_add)
			continue;
		auto next5 = std::next(next4);
		if (next5 == bb.ilist.end() || next5->GetOpcode() != qir::Op::_vmload)
			continue;
		auto next6 = std::next(next5);
		if (next6 == bb.ilist.end() || next6->GetOpcode() != qir::Op::_mov)
			continue;
		auto next7 = std::next(next6);
		if (next7 == bb.ilist.end() || next7->GetOpcode() != qir::Op::_add)
			continue;
		auto next8 = std::next(next7);
		if (next8 == bb.ilist.end() || next8->GetOpcode() != qir::Op::_vmload)
			continue;
		auto next9 = std::next(next8);
		if (next9 == bb.ilist.end() || next9->GetOpcode() != qir::Op::_mov)
			continue;
		auto next10 = std::next(next9);
		if (next10 == bb.ilist.end() || next10->GetOpcode() != qir::Op::_add)
			continue;
		auto next11 = std::next(next10);
		if (next11 == bb.ilist.end() || next11->GetOpcode() != qir::Op::_vmload)
			continue;
			
		// Check for mov+add+vmstore pattern
		auto* add1 = static_cast<qir::InstBinop*>(&*next);
		auto* load1 = static_cast<qir::InstVMLoad*>(&*next2);
		auto* mov2 = static_cast<qir::InstUnop*>(&*next3);
		auto* add2 = static_cast<qir::InstBinop*>(&*next4);
		auto* load2 = static_cast<qir::InstVMLoad*>(&*next5);
		auto* mov3 = static_cast<qir::InstUnop*>(&*next6);
		auto* add3 = static_cast<qir::InstBinop*>(&*next7);
		auto* load3 = static_cast<qir::InstVMLoad*>(&*next8);
		auto* mov4 = static_cast<qir::InstUnop*>(&*next9);
		auto* add4 = static_cast<qir::InstBinop*>(&*next10);
		auto* load4 = static_cast<qir::InstVMLoad*>(&*next11);
		// Verify patterns match and are consecutive stores
		if (add1->i(0).GetVGPR() == add2->i(0).GetVGPR() &&  // Same base register
			add2->i(0).GetVGPR() == add3->i(0).GetVGPR() &&
			add3->i(0).GetVGPR() == add4->i(0).GetVGPR() &&
			add1->i(1).IsConst() && add2->i(1).IsConst() && add3->i(1).IsConst() && add4->i(1).IsConst() &&
			add2->i(1).GetConst() == add1->i(1).GetConst() + 4 &&
			add3->i(1).GetConst() == add2->i(1).GetConst() + 4 &&
			add4->i(1).GetConst() == add3->i(1).GetConst() + 4) {  // Sequential offsets
			log_qcg("merge_vmload4: found pattern");
			// Remove original instructions
			qir::InstVMLoad4* vmload4 = bb.GetRegion()->Create<qir::InstVMLoad4>(
				qir::Inst::Flags(qir::Inst::SIDEEFF),  // First argument must be flags
				qir::VType::I32,      // Then the rest of the arguments
				qir::VSign::U,
				load1->o(0),
				load2->o(0),
				load3->o(0),
				load4->o(0),
				add1->o(0)
			);
			bb.ilist.insert(load4, vmload4);
			bb.ilist.erase(load1);
			bb.ilist.erase(load2);
			bb.ilist.erase(load3);
			bb.ilist.erase(load4);
			bb.ilist.erase(add2);
			bb.ilist.erase(add3);
			bb.ilist.erase(add4);
			bb.ilist.erase(mov2);
			bb.ilist.erase(mov3);
			bb.ilist.erase(mov4);
		}
	}
}

void QSel::merge_vmload2(qir::Block& bb) {
	log_qcg("merge_vmload2");
	for (auto iit = bb.ilist.begin(); iit != bb.ilist.end(); ++iit) {
		auto curr = iit;
		if (curr->GetOpcode() != qir::Op::_mov)
			continue;
		auto next = std::next(iit);
		if (next == bb.ilist.end() || next->GetOpcode() != qir::Op::_add)
			continue;
		auto next2 = std::next(next);
		if (next2 == bb.ilist.end() || next2->GetOpcode() != qir::Op::_vmload)
			continue;
		auto next3 = std::next(next2);
		if (next3 == bb.ilist.end() || next3->GetOpcode() != qir::Op::_mov)
			continue;
		auto next4 = std::next(next3);
		if (next4 == bb.ilist.end() || next4->GetOpcode() != qir::Op::_add)
			continue;
		auto next5 = std::next(next4);
		if (next5 == bb.ilist.end() || next5->GetOpcode() != qir::Op::_vmload)
			continue;
		// Check for mov+add+vmstore pattern
		auto* add1 = static_cast<qir::InstBinop*>(&*next);
		auto* load1 = static_cast<qir::InstVMLoad*>(&*next2);
		auto* mov2 = static_cast<qir::InstUnop*>(&*next3);
		auto* add2 = static_cast<qir::InstBinop*>(&*next4);
		auto* load2 = static_cast<qir::InstVMLoad*>(&*next5);
		// Verify patterns match and are consecutive stores
		if (add1->i(0).GetVGPR() == add2->i(0).GetVGPR() &&  // Same base register
			add1->i(1).IsConst() && add2->i(1).IsConst() &&
			add2->i(1).GetConst() == add1->i(1).GetConst() + 4) {  // Sequential offsets
			log_qcg("merge_vmload2: found pattern");
			// Remove original instructions
			qir::InstVMLoad2* vmload2 = bb.GetRegion()->Create<qir::InstVMLoad2>(
				qir::Inst::Flags(qir::Inst::SIDEEFF),  // First argument must be flags
				qir::VType::I32,      // Then the rest of the arguments
				qir::VSign::U,
				load1->o(0),
				load2->o(0),
				add1->o(0)
			);
			bb.ilist.insert(load2, vmload2);
			bb.ilist.erase(load1);
			bb.ilist.erase(load2);
			bb.ilist.erase(add2);
			bb.ilist.erase(mov2);
		}
	}
}

void QSel::merge_mov_store_mov_add_store(qir::Block& bb) {
	for (auto iit = bb.ilist.begin(); iit != bb.ilist.end(); ++iit) {
		auto curr = iit;
		if (curr->GetOpcode() != qir::Op::_mov)
			continue;
		auto next = std::next(iit);
		if (next == bb.ilist.end() || next->GetOpcode() != qir::Op::_vmstore)
			continue;
		auto next2 = std::next(next);
		if (next2 == bb.ilist.end() || next2->GetOpcode() != qir::Op::_mov)
			continue;
		auto next3 = std::next(next2);
		if (next3 == bb.ilist.end() || next3->GetOpcode() != qir::Op::_add)
			continue;
		auto next4 = std::next(next3);
		if (next4 == bb.ilist.end() || next4->GetOpcode() != qir::Op::_vmstore)
			continue;
		// Check for mov+add+vmstore pattern
		auto* store1 = static_cast<qir::InstVMStore*>(&*next);
		auto* mov2 = static_cast<qir::InstUnop*>(&*next2);
		auto* add2 = static_cast<qir::InstBinop*>(&*next3);
		auto* store2 = static_cast<qir::InstVMStore*>(&*next4);
		// Verify patterns match and are consecutive stores
		if (store1->sz == qir::VType::I32 && store2->sz == qir::VType::I32 &&
			store1->i(0).GetVGPR() == add2->i(0).GetVGPR() &&
			add2->i(1).IsConst() ){
			if (add2->i(1).GetConst() == -4) {  // Sequential offsets
				qir::InstVMStore2* vmstore2 = bb.GetRegion()->Create<qir::InstVMStore2>(
					qir::Inst::Flags(qir::Inst::SIDEEFF),  // First argument must be flags
					qir::VType::I32,      // Then the rest of the arguments
					qir::VSign::U,
					store1->i(0), 
					store2->i(1),
					store1->i(1)
				);
				bb.ilist.insert(store2, vmstore2);
				bb.ilist.erase(store1);
				bb.ilist.erase(store2);
				bb.ilist.erase(add2);
				bb.ilist.erase(mov2);
			} else if (add2->i(1).GetConst() == 4) {
				qir::InstVMStore2* vmstore2 = bb.GetRegion()->Create<qir::InstVMStore2>(
					qir::Inst::Flags(qir::Inst::SIDEEFF),  // First argument must be flags
					qir::VType::I32,      // Then the rest of the arguments
					qir::VSign::U,
					store1->i(0), 
					store1->i(1),
					store2->i(1)
				);
				bb.ilist.insert(store2, vmstore2);
				bb.ilist.erase(store1);
				bb.ilist.erase(store2);
				bb.ilist.erase(add2);
				bb.ilist.erase(mov2);
			}
		}
	}
}

void QSel::merge_vmstore2(qir::Block& bb) {
	for (auto iit = bb.ilist.begin(); iit != bb.ilist.end(); ++iit) {
		auto curr = iit;
		if (curr->GetOpcode() != qir::Op::_mov)
			continue;
		auto next = std::next(iit);
		if (next == bb.ilist.end() || next->GetOpcode() != qir::Op::_add)
			continue;
		auto next2 = std::next(next);
		if (next2 == bb.ilist.end() || next2->GetOpcode() != qir::Op::_vmstore)
			continue;
		auto next3 = std::next(next2);
		if (next3 == bb.ilist.end() || next3->GetOpcode() != qir::Op::_mov)
			continue;
		auto next4 = std::next(next3);
		if (next4 == bb.ilist.end() || next4->GetOpcode() != qir::Op::_add)
			continue;
		auto next5 = std::next(next4);
		if (next5 == bb.ilist.end() || next5->GetOpcode() != qir::Op::_vmstore)
			continue;
		// Check for mov+add+vmstore pattern
		auto* add1 = static_cast<qir::InstBinop*>(&*next);
		auto* store1 = static_cast<qir::InstVMStore*>(&*next2);
		auto* mov2 = static_cast<qir::InstUnop*>(&*next3);
		auto* add2 = static_cast<qir::InstBinop*>(&*next4);
		auto* store2 = static_cast<qir::InstVMStore*>(&*next5);
		// Verify patterns match and are consecutive stores
		if (store1->sz == qir::VType::I32 && store2->sz == qir::VType::I32 &&
			add1->i(0).GetVGPR() == add2->i(0).GetVGPR() &&  // Same base register
			add1->i(1).IsConst() && add2->i(1).IsConst() ){
			if (add2->i(1).GetConst() == add1->i(1).GetConst() - 4) {  // Sequential offsets
				qir::InstVMStore2* vmstore2 = bb.GetRegion()->Create<qir::InstVMStore2>(
					qir::Inst::Flags(qir::Inst::SIDEEFF),  // First argument must be flags
					qir::VType::I32,      // Then the rest of the arguments
					qir::VSign::U,
					add2->o(0), 
					store2->i(1),
					store1->i(1)
				);
				bb.ilist.insert(store2, vmstore2);
				bb.ilist.erase(store1);
				bb.ilist.erase(store2);
				bb.ilist.erase(add1);
				bb.ilist.erase(mov2);
			} else if (add2->i(1).GetConst() == add1->i(1).GetConst() + 4) {  // Sequential offsets
				qir::InstVMStore2* vmstore2 = bb.GetRegion()->Create<qir::InstVMStore2>(
					qir::Inst::Flags(qir::Inst::SIDEEFF),  // First argument must be flags
					qir::VType::I32,      // Then the rest of the arguments
					qir::VSign::U,
					add1->o(0), 
					store1->i(1),
					store2->i(1)
				);
				bb.ilist.insert(store2, vmstore2);
				bb.ilist.erase(store1);
				bb.ilist.erase(store2);
				bb.ilist.erase(add2);
				bb.ilist.erase(mov2);
			}
		}
	}
}

void QSel::merge_vmstore4(qir::Block& bb) {
	log_qcg("merge_vmstore4");
	for (auto iit = bb.ilist.begin(); iit != bb.ilist.end(); ++iit) {
		auto curr = iit;
		if (curr->GetOpcode() != qir::Op::_mov)
			continue;
		auto next = std::next(iit);
		if (next == bb.ilist.end() || next->GetOpcode() != qir::Op::_add)
			continue;
		auto next2 = std::next(next);
		if (next2 == bb.ilist.end() || next2->GetOpcode() != qir::Op::_vmstore)
			continue;
		auto next3 = std::next(next2);
		if (next3 == bb.ilist.end() || next3->GetOpcode() != qir::Op::_mov)
			continue;
		auto next4 = std::next(next3);
		if (next4 == bb.ilist.end() || next4->GetOpcode() != qir::Op::_add)
			continue;
		auto next5 = std::next(next4);
		if (next5 == bb.ilist.end() || next5->GetOpcode() != qir::Op::_vmstore)
			continue;
		auto next6 = std::next(next5);
		if (next6 == bb.ilist.end() || next6->GetOpcode() != qir::Op::_mov)
			continue;
		auto next7 = std::next(next6);
		if (next7 == bb.ilist.end() || next7->GetOpcode() != qir::Op::_add)
			continue;
		auto next8 = std::next(next7);
		if (next8 == bb.ilist.end() || next8->GetOpcode() != qir::Op::_vmstore)
			continue;
		auto next9 = std::next(next8);
		if (next9 != bb.ilist.end() && next9->GetOpcode() != qir::Op::_mov)
			continue;
		auto next10 = std::next(next9);
		if (next10 != bb.ilist.end() && next10->GetOpcode() != qir::Op::_add)
			continue;
		auto next11 = std::next(next10);
		if (next11 != bb.ilist.end() && next11->GetOpcode() != qir::Op::_vmstore)
			continue;
		// Check for mov+add+vmstore pattern
		auto* add1 = static_cast<qir::InstBinop*>(&*next);
		auto* store1 = static_cast<qir::InstVMStore*>(&*next2);
		auto* mov2 = static_cast<qir::InstUnop*>(&*next3);
		auto* add2 = static_cast<qir::InstBinop*>(&*next4);
		auto* store2 = static_cast<qir::InstVMStore*>(&*next5);
		auto* mov3 = static_cast<qir::InstUnop*>(&*next6);
		auto* add3 = static_cast<qir::InstBinop*>(&*next7);
		auto* store3 = static_cast<qir::InstVMStore*>(&*next8);
		auto* mov4 = static_cast<qir::InstUnop*>(&*next9);
		auto* add4 = static_cast<qir::InstBinop*>(&*next10);
		auto* store4 = static_cast<qir::InstVMStore*>(&*next11);
		// Verify patterns match and are consecutive stores
		if (store1->sz == qir::VType::I32 && store2->sz == qir::VType::I32 &&
			store2->sz == qir::VType::I32 && store3->sz == qir::VType::I32 &&
			add1->i(0).GetVGPR() == add2->i(0).GetVGPR() &&
			add2->i(0).GetVGPR() == add3->i(0).GetVGPR() &&
			add3->i(0).GetVGPR() == add4->i(0).GetVGPR() &&
			add1->i(1).IsConst() && add2->i(1).IsConst() && add3->i(1).IsConst() && add4->i(1).IsConst() &&
			add2->i(1).GetConst() == add1->i(1).GetConst() - 4 &&
			add3->i(1).GetConst() == add2->i(1).GetConst() - 4 &&
			add4->i(1).GetConst() == add3->i(1).GetConst() - 4) {
			log_qcg("merge_vmstore4: found negative pattern");
			// Remove original instructions
			qir::InstVMStore4* vmstore4 = bb.GetRegion()->Create<qir::InstVMStore4>(
				qir::Inst::Flags(qir::Inst::SIDEEFF),  // First argument must be flags
				qir::VType::I32,      // Then the rest of the arguments
				qir::VSign::U,
				add4->o(0), 
				store4->i(1),
				store3->i(1),
				store2->i(1),
				store1->i(1)
			);
			bb.ilist.insert(store4, vmstore4);
			bb.ilist.erase(store1);
			bb.ilist.erase(store2);
			bb.ilist.erase(store3);
			bb.ilist.erase(store4);
			bb.ilist.erase(add1);
			bb.ilist.erase(add2);
			bb.ilist.erase(add3);
			bb.ilist.erase(mov2);
			bb.ilist.erase(mov3);
			bb.ilist.erase(mov4);
		} else if (store1->sz == qir::VType::I32 && store2->sz == qir::VType::I32 &&
			store2->sz == qir::VType::I32 && store3->sz == qir::VType::I32 &&
			add1->i(0).GetVGPR() == add2->i(0).GetVGPR() &&
			add2->i(0).GetVGPR() == add3->i(0).GetVGPR() &&
			add3->i(0).GetVGPR() == add4->i(0).GetVGPR() &&
			add1->i(1).IsConst() && add2->i(1).IsConst() && add3->i(1).IsConst() && add4->i(1).IsConst() &&
			add2->i(1).GetConst() == add1->i(1).GetConst() + 4 &&
			add3->i(1).GetConst() == add2->i(1).GetConst() + 4 &&
			add4->i(1).GetConst() == add3->i(1).GetConst() + 4) {
			log_qcg("merge_vmstore4: found positive pattern");
			// Remove original instructions
			qir::InstVMStore4* vmstore4 = bb.GetRegion()->Create<qir::InstVMStore4>(
				qir::Inst::Flags(qir::Inst::SIDEEFF),  // First argument must be flags
				qir::VType::I32,      // Then the rest of the arguments
				qir::VSign::U,
				add1->o(0), 
				store1->i(1),
				store2->i(1),
				store3->i(1),
				store4->i(1)
			);
			bb.ilist.insert(store4, vmstore4);
			bb.ilist.erase(store1);
			bb.ilist.erase(store2);
			bb.ilist.erase(store3);
			bb.ilist.erase(store4);
			bb.ilist.erase(add4);
			bb.ilist.erase(add2);
			bb.ilist.erase(add3);
			bb.ilist.erase(mov2);
			bb.ilist.erase(mov3);
			bb.ilist.erase(mov4);
		}
	}
}

void QSelPass::run(qir::Region *region, MachineRegionInfo *region_info)
{
	QSel sel(region, region_info);
	sel.Run();
}

} // namespace dbt::qcg
