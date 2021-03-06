; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=riscv64 -mattr=+experimental-zfh \
; RUN:   -verify-machineinstrs -target-abi lp64f -disable-strictnode-mutation \
; RUN:   | FileCheck -check-prefix=RV64IZFH %s
; RUN: llc < %s -mtriple=riscv64 -mattr=+d \
; RUN:   -mattr=+experimental-zfh -verify-machineinstrs -target-abi lp64d \
; RUN:   -disable-strictnode-mutation | FileCheck -check-prefix=RV64IDZFH %s

; These intrinsics require half and i64 to be legal types.

declare i64 @llvm.experimental.constrained.llrint.i64.f16(half, metadata, metadata)

define i64 @llrint_f16(half %a) nounwind strictfp {
; RV64IZFH-LABEL: llrint_f16:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.l.h a0, fa0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: llrint_f16:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.l.h a0, fa0
; RV64IDZFH-NEXT:    ret
  %1 = call i64 @llvm.experimental.constrained.llrint.i64.f16(half %a, metadata !"round.dynamic", metadata !"fpexcept.strict") strictfp
  ret i64 %1
}

declare i64 @llvm.experimental.constrained.llround.i64.f16(half, metadata)

define i64 @llround_f16(half %a) nounwind strictfp {
; RV64IZFH-LABEL: llround_f16:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.l.h a0, fa0, rmm
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: llround_f16:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.l.h a0, fa0, rmm
; RV64IDZFH-NEXT:    ret
  %1 = call i64 @llvm.experimental.constrained.llround.i64.f16(half %a, metadata !"fpexcept.strict") strictfp
  ret i64 %1
}
