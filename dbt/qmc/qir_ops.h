#pragma once

#define QIR_DEF_APPLY_CLASS2BASE(name, cls, flags) CLASS(cls, name, name)

#define QIR_DEF_LIST(LEAF, BASE, CLASS)                                                                      \
	BASE(hcall, InstHcall, Flags::SIDEEFF | Flags::HAS_CALLS)                                            \
	BASE(br, InstBr, 0)                                                                                  \
	BASE(brcc, InstBrcc, 0)                                                                              \
	BASE(gbr, InstGBr, Flags::REXIT)                                                                     \
	BASE(gbrind, InstGBrind, Flags::REXIT)                                                               \
	BASE(vmload, InstVMLoad, Flags::SIDEEFF)                                         					 \
	BASE(vmload2, InstVMLoad2, Flags::SIDEEFF)										                     \
	BASE(vmload4, InstVMLoad4, Flags::SIDEEFF)										                     \
	BASE(vmstore, InstVMStore, Flags::SIDEEFF)                                       					 \
	BASE(vmstore2, InstVMStore2, Flags::SIDEEFF)										                     \
	BASE(vmstore4, InstVMStore4, Flags::SIDEEFF)										                     \
	BASE(setcc, InstSetcc, 0)                                                                            \
	/* unary */                                                                                          \
	LEAF(mov, InstUnop, 0)                                                                               \
	CLASS(InstUnop, mov, mov)                                                                            \
	/* binary */                                                                                         \
	LEAF(add, InstBinop, 0)                                                                              \
	LEAF(sub, InstBinop, 0)                                                                              \
	LEAF(and, InstBinop, 0)                                                                              \
	LEAF(or, InstBinop, 0)                                                                               \
	LEAF(xor, InstBinop, 0)                                                                              \
	LEAF(sra, InstBinop, 0)                                                                              \
	LEAF(srl, InstBinop, 0)                                                                              \
	LEAF(sll, InstBinop, 0)                                                                              \
	LEAF(mul, InstBinop, 0)                                                                              \
	LEAF(mulh, InstBinop, 0)                                                                             \
	LEAF(mulhsu, InstBinop, 0)                                                                           \
	LEAF(mulhu, InstBinop, 0)                                                                            \
	LEAF(div, InstBinop, 0)                                                                              \
	LEAF(divu, InstBinop, 0)                                                                             \
	LEAF(rem, InstBinop, 0)                                                                              \
	LEAF(remu, InstBinop, 0)                                                                             \
	CLASS(InstBinop, add, remu)																			 

#define QIR_OPS_LIST(OP) QIR_DEF_LIST(OP, OP, EMPTY_MACRO)
#define QIR_LEAF_OPS_LIST(LEAF) QIR_DEF_LIST(LEAF, EMPTY_MACRO, EMPTY_MACRO)
#define QIR_BASE_OPS_LIST(BASE) QIR_DEF_LIST(EMPTY_MACRO, BASE, EMPTY_MACRO)
#define QIR_CLASS_LIST(CLASS) QIR_DEF_LIST(EMPTY_MACRO, QIR_DEF_APPLY_CLASS2BASE, CLASS)
