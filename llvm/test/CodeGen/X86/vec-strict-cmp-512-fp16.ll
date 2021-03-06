; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown-unknown -mattr=+avx512fp16 -O3 | FileCheck %s --check-prefixes=X86
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx512fp16 -O3 | FileCheck %s --check-prefixes=X64

define <32 x i16> @test_v32f16_oeq_q(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_oeq_q:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpeqph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_oeq_q:
; X64:       # %bb.0:
; X64-NEXT:    vcmpeqph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"oeq",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_ogt_q(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_ogt_q:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpgt_oqph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_ogt_q:
; X64:       # %bb.0:
; X64-NEXT:    vcmplt_oqph %zmm2, %zmm3, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"ogt",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_oge_q(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_oge_q:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpge_oqph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_oge_q:
; X64:       # %bb.0:
; X64-NEXT:    vcmple_oqph %zmm2, %zmm3, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"oge",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_olt_q(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_olt_q:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmplt_oqph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_olt_q:
; X64:       # %bb.0:
; X64-NEXT:    vcmplt_oqph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"olt",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_ole_q(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_ole_q:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmple_oqph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_ole_q:
; X64:       # %bb.0:
; X64-NEXT:    vcmple_oqph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"ole",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_one_q(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_one_q:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpneq_oqph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_one_q:
; X64:       # %bb.0:
; X64-NEXT:    vcmpneq_oqph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"one",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_ord_q(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_ord_q:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpordph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_ord_q:
; X64:       # %bb.0:
; X64-NEXT:    vcmpordph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"ord",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_ueq_q(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_ueq_q:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpeq_uqph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_ueq_q:
; X64:       # %bb.0:
; X64-NEXT:    vcmpeq_uqph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"ueq",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_ugt_q(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_ugt_q:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpnle_uqph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_ugt_q:
; X64:       # %bb.0:
; X64-NEXT:    vcmpnle_uqph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"ugt",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_uge_q(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_uge_q:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpnlt_uqph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_uge_q:
; X64:       # %bb.0:
; X64-NEXT:    vcmpnlt_uqph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"uge",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_ult_q(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_ult_q:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpnge_uqph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_ult_q:
; X64:       # %bb.0:
; X64-NEXT:    vcmpnle_uqph %zmm2, %zmm3, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"ult",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_ule_q(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_ule_q:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpngt_uqph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_ule_q:
; X64:       # %bb.0:
; X64-NEXT:    vcmpnlt_uqph %zmm2, %zmm3, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"ule",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_une_q(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_une_q:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpneqph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_une_q:
; X64:       # %bb.0:
; X64-NEXT:    vcmpneqph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"une",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_uno_q(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_uno_q:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpunordph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_uno_q:
; X64:       # %bb.0:
; X64-NEXT:    vcmpunordph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"uno",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_oeq_s(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_oeq_s:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpeq_osph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_oeq_s:
; X64:       # %bb.0:
; X64-NEXT:    vcmpeq_osph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"oeq",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_ogt_s(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_ogt_s:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpgtph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_ogt_s:
; X64:       # %bb.0:
; X64-NEXT:    vcmpltph %zmm2, %zmm3, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"ogt",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_oge_s(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_oge_s:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpgeph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_oge_s:
; X64:       # %bb.0:
; X64-NEXT:    vcmpleph %zmm2, %zmm3, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"oge",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_olt_s(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_olt_s:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpltph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_olt_s:
; X64:       # %bb.0:
; X64-NEXT:    vcmpltph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"olt",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_ole_s(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_ole_s:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpleph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_ole_s:
; X64:       # %bb.0:
; X64-NEXT:    vcmpleph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"ole",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_one_s(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_one_s:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpneq_osph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_one_s:
; X64:       # %bb.0:
; X64-NEXT:    vcmpneq_osph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"one",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_ord_s(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_ord_s:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpord_sph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_ord_s:
; X64:       # %bb.0:
; X64-NEXT:    vcmpord_sph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"ord",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_ueq_s(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_ueq_s:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpeq_usph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_ueq_s:
; X64:       # %bb.0:
; X64-NEXT:    vcmpeq_usph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"ueq",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_ugt_s(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_ugt_s:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpnleph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_ugt_s:
; X64:       # %bb.0:
; X64-NEXT:    vcmpnleph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"ugt",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_uge_s(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_uge_s:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpnltph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_uge_s:
; X64:       # %bb.0:
; X64-NEXT:    vcmpnltph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"uge",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_ult_s(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_ult_s:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpngeph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_ult_s:
; X64:       # %bb.0:
; X64-NEXT:    vcmpnleph %zmm2, %zmm3, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"ult",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_ule_s(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_ule_s:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpngtph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_ule_s:
; X64:       # %bb.0:
; X64-NEXT:    vcmpnltph %zmm2, %zmm3, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"ule",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_une_s(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_une_s:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpneq_usph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_une_s:
; X64:       # %bb.0:
; X64-NEXT:    vcmpneq_usph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"une",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

define <32 x i16> @test_v32f16_uno_s(<32 x i16> %a, <32 x i16> %b, <32 x half> %f1, <32 x half> %f2) #0 {
; X86-LABEL: test_v32f16_uno_s:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-64, %esp
; X86-NEXT:    subl $64, %esp
; X86-NEXT:    vcmpunord_sph 8(%ebp), %zmm2, %k1
; X86-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: test_v32f16_uno_s:
; X64:       # %bb.0:
; X64-NEXT:    vcmpunord_sph %zmm3, %zmm2, %k1
; X64-NEXT:    vpblendmw %zmm0, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
  %cond = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(
                                               <32 x half> %f1, <32 x half> %f2, metadata !"uno",
                                               metadata !"fpexcept.strict") #0
  %res = select <32 x i1> %cond, <32 x i16> %a, <32 x i16> %b
  ret <32 x i16> %res
}

attributes #0 = { strictfp nounwind }

declare <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(<32 x half>, <32 x half>, metadata, metadata)
declare <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(<32 x half>, <32 x half>, metadata, metadata)
