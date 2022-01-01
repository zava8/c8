; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+d -verify-machineinstrs < %s \
; RUN:   -disable-strictnode-mutation | FileCheck -check-prefix=RV32IFD %s
; RUN: llc -mtriple=riscv64 -mattr=+d -verify-machineinstrs < %s \
; RUN:   -disable-strictnode-mutation | FileCheck -check-prefix=RV64IFD %s
; RUN: llc -mtriple=riscv32 -verify-machineinstrs < %s \
; RUN:   -disable-strictnode-mutation | FileCheck -check-prefix=RV32I %s
; RUN: llc -mtriple=riscv64 -verify-machineinstrs < %s \
; RUN:   -disable-strictnode-mutation | FileCheck -check-prefix=RV64I %s

define double @fadd_d(double %a, double %b) nounwind strictfp {
; RV32IFD-LABEL: fadd_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a2, 8(sp)
; RV32IFD-NEXT:    sw a3, 12(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    fadd.d ft0, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: fadd_d:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fmv.d.x ft0, a1
; RV64IFD-NEXT:    fmv.d.x ft1, a0
; RV64IFD-NEXT:    fadd.d ft0, ft1, ft0
; RV64IFD-NEXT:    fmv.x.d a0, ft0
; RV64IFD-NEXT:    ret
;
; RV32I-LABEL: fadd_d:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __adddf3@plt
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fadd_d:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __adddf3@plt
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = call double @llvm.experimental.constrained.fadd.f64(double %a, double %b, metadata !"round.dynamic", metadata !"fpexcept.strict") strictfp
  ret double %1
}
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata)

define double @fsub_d(double %a, double %b) nounwind strictfp {
; RV32IFD-LABEL: fsub_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a2, 8(sp)
; RV32IFD-NEXT:    sw a3, 12(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    fsub.d ft0, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: fsub_d:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fmv.d.x ft0, a1
; RV64IFD-NEXT:    fmv.d.x ft1, a0
; RV64IFD-NEXT:    fsub.d ft0, ft1, ft0
; RV64IFD-NEXT:    fmv.x.d a0, ft0
; RV64IFD-NEXT:    ret
;
; RV32I-LABEL: fsub_d:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __subdf3@plt
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fsub_d:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __subdf3@plt
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = call double @llvm.experimental.constrained.fsub.f64(double %a, double %b, metadata !"round.dynamic", metadata !"fpexcept.strict") strictfp
  ret double %1
}
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata)

define double @fmul_d(double %a, double %b) nounwind strictfp {
; RV32IFD-LABEL: fmul_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a2, 8(sp)
; RV32IFD-NEXT:    sw a3, 12(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    fmul.d ft0, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: fmul_d:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fmv.d.x ft0, a1
; RV64IFD-NEXT:    fmv.d.x ft1, a0
; RV64IFD-NEXT:    fmul.d ft0, ft1, ft0
; RV64IFD-NEXT:    fmv.x.d a0, ft0
; RV64IFD-NEXT:    ret
;
; RV32I-LABEL: fmul_d:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __muldf3@plt
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fmul_d:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __muldf3@plt
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = call double @llvm.experimental.constrained.fmul.f64(double %a, double %b, metadata !"round.dynamic", metadata !"fpexcept.strict") strictfp
  ret double %1
}
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata)

define double @fdiv_d(double %a, double %b) nounwind strictfp {
; RV32IFD-LABEL: fdiv_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a2, 8(sp)
; RV32IFD-NEXT:    sw a3, 12(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    fdiv.d ft0, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: fdiv_d:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fmv.d.x ft0, a1
; RV64IFD-NEXT:    fmv.d.x ft1, a0
; RV64IFD-NEXT:    fdiv.d ft0, ft1, ft0
; RV64IFD-NEXT:    fmv.x.d a0, ft0
; RV64IFD-NEXT:    ret
;
; RV32I-LABEL: fdiv_d:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __divdf3@plt
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fdiv_d:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __divdf3@plt
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = call double @llvm.experimental.constrained.fdiv.f64(double %a, double %b, metadata !"round.dynamic", metadata !"fpexcept.strict") strictfp
  ret double %1
}
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata)

define double @fsqrt_d(double %a) nounwind strictfp {
; RV32IFD-LABEL: fsqrt_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    fsqrt.d ft0, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: fsqrt_d:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fmv.d.x ft0, a0
; RV64IFD-NEXT:    fsqrt.d ft0, ft0
; RV64IFD-NEXT:    fmv.x.d a0, ft0
; RV64IFD-NEXT:    ret
;
; RV32I-LABEL: fsqrt_d:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call sqrt@plt
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fsqrt_d:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call sqrt@plt
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = call double @llvm.experimental.constrained.sqrt.f64(double %a, metadata !"round.dynamic", metadata !"fpexcept.strict") strictfp
  ret double %1
}
declare double @llvm.experimental.constrained.sqrt.f64(double, metadata, metadata)

define double @fmin_d(double %a, double %b) nounwind strictfp {
; RV32IFD-LABEL: fmin_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call fmin@plt
; RV32IFD-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: fmin_d:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call fmin@plt
; RV64IFD-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64IFD-NEXT:    addi sp, sp, 16
; RV64IFD-NEXT:    ret
;
; RV32I-LABEL: fmin_d:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call fmin@plt
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fmin_d:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call fmin@plt
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = call double @llvm.experimental.constrained.minnum.f64(double %a, double %b, metadata !"fpexcept.strict") strictfp
  ret double %1
}
declare double @llvm.experimental.constrained.minnum.f64(double, double, metadata) strictfp

define double @fmax_d(double %a, double %b) nounwind strictfp {
; RV32IFD-LABEL: fmax_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call fmax@plt
; RV32IFD-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: fmax_d:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call fmax@plt
; RV64IFD-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64IFD-NEXT:    addi sp, sp, 16
; RV64IFD-NEXT:    ret
;
; RV32I-LABEL: fmax_d:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call fmax@plt
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fmax_d:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call fmax@plt
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = call double @llvm.experimental.constrained.maxnum.f64(double %a, double %b, metadata !"fpexcept.strict") strictfp
  ret double %1
}
declare double @llvm.experimental.constrained.maxnum.f64(double, double, metadata) strictfp

define double @fmadd_d(double %a, double %b, double %c) nounwind strictfp {
; RV32IFD-LABEL: fmadd_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a4, 8(sp)
; RV32IFD-NEXT:    sw a5, 12(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    sw a2, 8(sp)
; RV32IFD-NEXT:    sw a3, 12(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    fld ft2, 8(sp)
; RV32IFD-NEXT:    fmadd.d ft0, ft2, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: fmadd_d:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fmv.d.x ft0, a2
; RV64IFD-NEXT:    fmv.d.x ft1, a1
; RV64IFD-NEXT:    fmv.d.x ft2, a0
; RV64IFD-NEXT:    fmadd.d ft0, ft2, ft1, ft0
; RV64IFD-NEXT:    fmv.x.d a0, ft0
; RV64IFD-NEXT:    ret
;
; RV32I-LABEL: fmadd_d:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call fma@plt
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fmadd_d:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call fma@plt
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = call double @llvm.experimental.constrained.fma.f64(double %a, double %b, double %c, metadata !"round.dynamic", metadata !"fpexcept.strict") strictfp
  ret double %1
}
declare double @llvm.experimental.constrained.fma.f64(double, double, double, metadata, metadata) strictfp

define double @fmsub_d(double %a, double %b, double %c) nounwind strictfp {
; RV32IFD-LABEL: fmsub_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a2, 8(sp)
; RV32IFD-NEXT:    sw a3, 12(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    sw a4, 8(sp)
; RV32IFD-NEXT:    sw a5, 12(sp)
; RV32IFD-NEXT:    fld ft2, 8(sp)
; RV32IFD-NEXT:    fcvt.d.w ft3, zero
; RV32IFD-NEXT:    fadd.d ft2, ft2, ft3
; RV32IFD-NEXT:    fmsub.d ft0, ft1, ft0, ft2
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: fmsub_d:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fmv.d.x ft0, a1
; RV64IFD-NEXT:    fmv.d.x ft1, a0
; RV64IFD-NEXT:    fmv.d.x ft2, a2
; RV64IFD-NEXT:    fmv.d.x ft3, zero
; RV64IFD-NEXT:    fadd.d ft2, ft2, ft3
; RV64IFD-NEXT:    fmsub.d ft0, ft1, ft0, ft2
; RV64IFD-NEXT:    fmv.x.d a0, ft0
; RV64IFD-NEXT:    ret
;
; RV32I-LABEL: fmsub_d:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -32
; RV32I-NEXT:    sw ra, 28(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s0, 24(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s1, 20(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s2, 16(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s3, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    mv s2, a3
; RV32I-NEXT:    mv s3, a2
; RV32I-NEXT:    mv s0, a1
; RV32I-NEXT:    mv s1, a0
; RV32I-NEXT:    mv a0, a4
; RV32I-NEXT:    mv a1, a5
; RV32I-NEXT:    li a2, 0
; RV32I-NEXT:    li a3, 0
; RV32I-NEXT:    call __adddf3@plt
; RV32I-NEXT:    mv a4, a0
; RV32I-NEXT:    lui a0, 524288
; RV32I-NEXT:    xor a5, a1, a0
; RV32I-NEXT:    mv a0, s1
; RV32I-NEXT:    mv a1, s0
; RV32I-NEXT:    mv a2, s3
; RV32I-NEXT:    mv a3, s2
; RV32I-NEXT:    call fma@plt
; RV32I-NEXT:    lw ra, 28(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s0, 24(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s1, 20(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s2, 16(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s3, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 32
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fmsub_d:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -32
; RV64I-NEXT:    sd ra, 24(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s0, 16(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s1, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    mv s0, a1
; RV64I-NEXT:    mv s1, a0
; RV64I-NEXT:    mv a0, a2
; RV64I-NEXT:    li a1, 0
; RV64I-NEXT:    call __adddf3@plt
; RV64I-NEXT:    li a1, -1
; RV64I-NEXT:    slli a1, a1, 63
; RV64I-NEXT:    xor a2, a0, a1
; RV64I-NEXT:    mv a0, s1
; RV64I-NEXT:    mv a1, s0
; RV64I-NEXT:    call fma@plt
; RV64I-NEXT:    ld ra, 24(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s0, 16(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s1, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 32
; RV64I-NEXT:    ret
  %c_ = fadd double 0.0, %c ; avoid negation using xor
  %negc = fneg double %c_
  %1 = call double @llvm.experimental.constrained.fma.f64(double %a, double %b, double %negc, metadata !"round.dynamic", metadata !"fpexcept.strict") strictfp
  ret double %1
}

define double @fnmadd_d(double %a, double %b, double %c) nounwind strictfp {
; RV32IFD-LABEL: fnmadd_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a2, 8(sp)
; RV32IFD-NEXT:    sw a3, 12(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    sw a4, 8(sp)
; RV32IFD-NEXT:    sw a5, 12(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    fld ft2, 8(sp)
; RV32IFD-NEXT:    fcvt.d.w ft3, zero
; RV32IFD-NEXT:    fadd.d ft2, ft2, ft3
; RV32IFD-NEXT:    fadd.d ft1, ft1, ft3
; RV32IFD-NEXT:    fnmadd.d ft0, ft2, ft0, ft1
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: fnmadd_d:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fmv.d.x ft0, a1
; RV64IFD-NEXT:    fmv.d.x ft1, a2
; RV64IFD-NEXT:    fmv.d.x ft2, a0
; RV64IFD-NEXT:    fmv.d.x ft3, zero
; RV64IFD-NEXT:    fadd.d ft2, ft2, ft3
; RV64IFD-NEXT:    fadd.d ft1, ft1, ft3
; RV64IFD-NEXT:    fnmadd.d ft0, ft2, ft0, ft1
; RV64IFD-NEXT:    fmv.x.d a0, ft0
; RV64IFD-NEXT:    ret
;
; RV32I-LABEL: fnmadd_d:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -32
; RV32I-NEXT:    sw ra, 28(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s0, 24(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s1, 20(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s2, 16(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s3, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s4, 8(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s5, 4(sp) # 4-byte Folded Spill
; RV32I-NEXT:    mv s4, a5
; RV32I-NEXT:    mv s5, a4
; RV32I-NEXT:    mv s2, a3
; RV32I-NEXT:    mv s3, a2
; RV32I-NEXT:    li a2, 0
; RV32I-NEXT:    li a3, 0
; RV32I-NEXT:    call __adddf3@plt
; RV32I-NEXT:    mv s0, a0
; RV32I-NEXT:    mv s1, a1
; RV32I-NEXT:    mv a0, s5
; RV32I-NEXT:    mv a1, s4
; RV32I-NEXT:    li a2, 0
; RV32I-NEXT:    li a3, 0
; RV32I-NEXT:    call __adddf3@plt
; RV32I-NEXT:    mv a4, a0
; RV32I-NEXT:    lui a0, 524288
; RV32I-NEXT:    xor a2, s1, a0
; RV32I-NEXT:    xor a5, a1, a0
; RV32I-NEXT:    mv a0, s0
; RV32I-NEXT:    mv a1, a2
; RV32I-NEXT:    mv a2, s3
; RV32I-NEXT:    mv a3, s2
; RV32I-NEXT:    call fma@plt
; RV32I-NEXT:    lw ra, 28(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s0, 24(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s1, 20(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s2, 16(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s3, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s4, 8(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s5, 4(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 32
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fnmadd_d:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -32
; RV64I-NEXT:    sd ra, 24(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s0, 16(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s1, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s2, 0(sp) # 8-byte Folded Spill
; RV64I-NEXT:    mv s0, a2
; RV64I-NEXT:    mv s2, a1
; RV64I-NEXT:    li a1, 0
; RV64I-NEXT:    call __adddf3@plt
; RV64I-NEXT:    mv s1, a0
; RV64I-NEXT:    mv a0, s0
; RV64I-NEXT:    li a1, 0
; RV64I-NEXT:    call __adddf3@plt
; RV64I-NEXT:    li a1, -1
; RV64I-NEXT:    slli a2, a1, 63
; RV64I-NEXT:    xor a1, s1, a2
; RV64I-NEXT:    xor a2, a0, a2
; RV64I-NEXT:    mv a0, a1
; RV64I-NEXT:    mv a1, s2
; RV64I-NEXT:    call fma@plt
; RV64I-NEXT:    ld ra, 24(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s0, 16(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s1, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s2, 0(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 32
; RV64I-NEXT:    ret
  %a_ = fadd double 0.0, %a
  %c_ = fadd double 0.0, %c
  %nega = fneg double %a_
  %negc = fneg double %c_
  %1 = call double @llvm.experimental.constrained.fma.f64(double %nega, double %b, double %negc, metadata !"round.dynamic", metadata !"fpexcept.strict") strictfp
  ret double %1
}

define double @fnmadd_d_2(double %a, double %b, double %c) nounwind strictfp {
; RV32IFD-LABEL: fnmadd_d_2:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    sw a4, 8(sp)
; RV32IFD-NEXT:    sw a5, 12(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    sw a2, 8(sp)
; RV32IFD-NEXT:    sw a3, 12(sp)
; RV32IFD-NEXT:    fld ft2, 8(sp)
; RV32IFD-NEXT:    fcvt.d.w ft3, zero
; RV32IFD-NEXT:    fadd.d ft2, ft2, ft3
; RV32IFD-NEXT:    fadd.d ft1, ft1, ft3
; RV32IFD-NEXT:    fnmadd.d ft0, ft2, ft0, ft1
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: fnmadd_d_2:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fmv.d.x ft0, a0
; RV64IFD-NEXT:    fmv.d.x ft1, a2
; RV64IFD-NEXT:    fmv.d.x ft2, a1
; RV64IFD-NEXT:    fmv.d.x ft3, zero
; RV64IFD-NEXT:    fadd.d ft2, ft2, ft3
; RV64IFD-NEXT:    fadd.d ft1, ft1, ft3
; RV64IFD-NEXT:    fnmadd.d ft0, ft2, ft0, ft1
; RV64IFD-NEXT:    fmv.x.d a0, ft0
; RV64IFD-NEXT:    ret
;
; RV32I-LABEL: fnmadd_d_2:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -32
; RV32I-NEXT:    sw ra, 28(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s0, 24(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s1, 20(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s2, 16(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s3, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s4, 8(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s5, 4(sp) # 4-byte Folded Spill
; RV32I-NEXT:    mv s4, a5
; RV32I-NEXT:    mv s1, a4
; RV32I-NEXT:    mv s2, a1
; RV32I-NEXT:    mv s3, a0
; RV32I-NEXT:    mv a0, a2
; RV32I-NEXT:    mv a1, a3
; RV32I-NEXT:    li a2, 0
; RV32I-NEXT:    li a3, 0
; RV32I-NEXT:    call __adddf3@plt
; RV32I-NEXT:    mv s5, a0
; RV32I-NEXT:    mv s0, a1
; RV32I-NEXT:    mv a0, s1
; RV32I-NEXT:    mv a1, s4
; RV32I-NEXT:    li a2, 0
; RV32I-NEXT:    li a3, 0
; RV32I-NEXT:    call __adddf3@plt
; RV32I-NEXT:    mv a4, a0
; RV32I-NEXT:    lui a0, 524288
; RV32I-NEXT:    xor a3, s0, a0
; RV32I-NEXT:    xor a5, a1, a0
; RV32I-NEXT:    mv a0, s3
; RV32I-NEXT:    mv a1, s2
; RV32I-NEXT:    mv a2, s5
; RV32I-NEXT:    call fma@plt
; RV32I-NEXT:    lw ra, 28(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s0, 24(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s1, 20(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s2, 16(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s3, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s4, 8(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s5, 4(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 32
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fnmadd_d_2:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -32
; RV64I-NEXT:    sd ra, 24(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s0, 16(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s1, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s2, 0(sp) # 8-byte Folded Spill
; RV64I-NEXT:    mv s0, a2
; RV64I-NEXT:    mv s2, a0
; RV64I-NEXT:    mv a0, a1
; RV64I-NEXT:    li a1, 0
; RV64I-NEXT:    call __adddf3@plt
; RV64I-NEXT:    mv s1, a0
; RV64I-NEXT:    mv a0, s0
; RV64I-NEXT:    li a1, 0
; RV64I-NEXT:    call __adddf3@plt
; RV64I-NEXT:    li a1, -1
; RV64I-NEXT:    slli a2, a1, 63
; RV64I-NEXT:    xor a1, s1, a2
; RV64I-NEXT:    xor a2, a0, a2
; RV64I-NEXT:    mv a0, s2
; RV64I-NEXT:    call fma@plt
; RV64I-NEXT:    ld ra, 24(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s0, 16(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s1, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s2, 0(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 32
; RV64I-NEXT:    ret
  %b_ = fadd double 0.0, %b
  %c_ = fadd double 0.0, %c
  %negb = fneg double %b_
  %negc = fneg double %c_
  %1 = call double @llvm.experimental.constrained.fma.f64(double %a, double %negb, double %negc, metadata !"round.dynamic", metadata !"fpexcept.strict") strictfp
  ret double %1
}

define double @fnmsub_d(double %a, double %b, double %c) nounwind strictfp {
; RV32IFD-LABEL: fnmsub_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a4, 8(sp)
; RV32IFD-NEXT:    sw a5, 12(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    sw a2, 8(sp)
; RV32IFD-NEXT:    sw a3, 12(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    fld ft2, 8(sp)
; RV32IFD-NEXT:    fcvt.d.w ft3, zero
; RV32IFD-NEXT:    fadd.d ft2, ft2, ft3
; RV32IFD-NEXT:    fnmsub.d ft0, ft2, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: fnmsub_d:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fmv.d.x ft0, a2
; RV64IFD-NEXT:    fmv.d.x ft1, a1
; RV64IFD-NEXT:    fmv.d.x ft2, a0
; RV64IFD-NEXT:    fmv.d.x ft3, zero
; RV64IFD-NEXT:    fadd.d ft2, ft2, ft3
; RV64IFD-NEXT:    fnmsub.d ft0, ft2, ft1, ft0
; RV64IFD-NEXT:    fmv.x.d a0, ft0
; RV64IFD-NEXT:    ret
;
; RV32I-LABEL: fnmsub_d:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -32
; RV32I-NEXT:    sw ra, 28(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s0, 24(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s1, 20(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s2, 16(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s3, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    mv s2, a5
; RV32I-NEXT:    mv s3, a4
; RV32I-NEXT:    mv s0, a3
; RV32I-NEXT:    mv s1, a2
; RV32I-NEXT:    li a2, 0
; RV32I-NEXT:    li a3, 0
; RV32I-NEXT:    call __adddf3@plt
; RV32I-NEXT:    lui a2, 524288
; RV32I-NEXT:    xor a1, a1, a2
; RV32I-NEXT:    mv a2, s1
; RV32I-NEXT:    mv a3, s0
; RV32I-NEXT:    mv a4, s3
; RV32I-NEXT:    mv a5, s2
; RV32I-NEXT:    call fma@plt
; RV32I-NEXT:    lw ra, 28(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s0, 24(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s1, 20(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s2, 16(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s3, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 32
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fnmsub_d:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -32
; RV64I-NEXT:    sd ra, 24(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s0, 16(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s1, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    mv s0, a2
; RV64I-NEXT:    mv s1, a1
; RV64I-NEXT:    li a1, 0
; RV64I-NEXT:    call __adddf3@plt
; RV64I-NEXT:    li a1, -1
; RV64I-NEXT:    slli a1, a1, 63
; RV64I-NEXT:    xor a0, a0, a1
; RV64I-NEXT:    mv a1, s1
; RV64I-NEXT:    mv a2, s0
; RV64I-NEXT:    call fma@plt
; RV64I-NEXT:    ld ra, 24(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s0, 16(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s1, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 32
; RV64I-NEXT:    ret
  %a_ = fadd double 0.0, %a
  %nega = fneg double %a_
  %1 = call double @llvm.experimental.constrained.fma.f64(double %nega, double %b, double %c, metadata !"round.dynamic", metadata !"fpexcept.strict") strictfp
  ret double %1
}

define double @fnmsub_d_2(double %a, double %b, double %c) nounwind strictfp {
; RV32IFD-LABEL: fnmsub_d_2:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a4, 8(sp)
; RV32IFD-NEXT:    sw a5, 12(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    sw a2, 8(sp)
; RV32IFD-NEXT:    sw a3, 12(sp)
; RV32IFD-NEXT:    fld ft2, 8(sp)
; RV32IFD-NEXT:    fcvt.d.w ft3, zero
; RV32IFD-NEXT:    fadd.d ft2, ft2, ft3
; RV32IFD-NEXT:    fnmsub.d ft0, ft2, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: fnmsub_d_2:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fmv.d.x ft0, a2
; RV64IFD-NEXT:    fmv.d.x ft1, a0
; RV64IFD-NEXT:    fmv.d.x ft2, a1
; RV64IFD-NEXT:    fmv.d.x ft3, zero
; RV64IFD-NEXT:    fadd.d ft2, ft2, ft3
; RV64IFD-NEXT:    fnmsub.d ft0, ft2, ft1, ft0
; RV64IFD-NEXT:    fmv.x.d a0, ft0
; RV64IFD-NEXT:    ret
;
; RV32I-LABEL: fnmsub_d_2:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -32
; RV32I-NEXT:    sw ra, 28(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s0, 24(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s1, 20(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s2, 16(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s3, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    mv s2, a5
; RV32I-NEXT:    mv s3, a4
; RV32I-NEXT:    mv s0, a1
; RV32I-NEXT:    mv s1, a0
; RV32I-NEXT:    mv a0, a2
; RV32I-NEXT:    mv a1, a3
; RV32I-NEXT:    li a2, 0
; RV32I-NEXT:    li a3, 0
; RV32I-NEXT:    call __adddf3@plt
; RV32I-NEXT:    mv a2, a0
; RV32I-NEXT:    lui a0, 524288
; RV32I-NEXT:    xor a3, a1, a0
; RV32I-NEXT:    mv a0, s1
; RV32I-NEXT:    mv a1, s0
; RV32I-NEXT:    mv a4, s3
; RV32I-NEXT:    mv a5, s2
; RV32I-NEXT:    call fma@plt
; RV32I-NEXT:    lw ra, 28(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s0, 24(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s1, 20(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s2, 16(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s3, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 32
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fnmsub_d_2:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -32
; RV64I-NEXT:    sd ra, 24(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s0, 16(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s1, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    mv s0, a2
; RV64I-NEXT:    mv s1, a0
; RV64I-NEXT:    mv a0, a1
; RV64I-NEXT:    li a1, 0
; RV64I-NEXT:    call __adddf3@plt
; RV64I-NEXT:    li a1, -1
; RV64I-NEXT:    slli a1, a1, 63
; RV64I-NEXT:    xor a1, a0, a1
; RV64I-NEXT:    mv a0, s1
; RV64I-NEXT:    mv a2, s0
; RV64I-NEXT:    call fma@plt
; RV64I-NEXT:    ld ra, 24(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s0, 16(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s1, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 32
; RV64I-NEXT:    ret
  %b_ = fadd double 0.0, %b
  %negb = fneg double %b_
  %1 = call double @llvm.experimental.constrained.fma.f64(double %a, double %negb, double %c, metadata !"round.dynamic", metadata !"fpexcept.strict") strictfp
  ret double %1
}