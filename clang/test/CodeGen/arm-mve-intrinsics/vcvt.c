// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// RUN: %clang_cc1 -triple thumbv8.1m.main-none-none-eabi -target-feature +mve.fp -mfloat-abi hard -fallow-half-arguments-and-returns -O0 -disable-O0-optnone -S -emit-llvm -o - %s | opt -S -mem2reg | FileCheck %s
// RUN: %clang_cc1 -DPOLYMORPHIC -triple thumbv8.1m.main-none-none-eabi -target-feature +mve.fp -mfloat-abi hard -fallow-half-arguments-and-returns -O0 -disable-O0-optnone -S -emit-llvm -o - %s | opt -S -mem2reg | FileCheck %s

// REQUIRES: aarch64-registered-target || arm-registered-target

#include <arm_mve.h>

// CHECK-LABEL: @test_vcvtq_f16_s16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = sitofp <8 x i16> [[A:%.*]] to <8 x half>
// CHECK-NEXT:    ret <8 x half> [[TMP0]]
//
float16x8_t test_vcvtq_f16_s16(int16x8_t a)
{
#ifdef POLYMORPHIC
    return vcvtq(a);
#else /* POLYMORPHIC */
    return vcvtq_f16_s16(a);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_f16_u16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = uitofp <8 x i16> [[A:%.*]] to <8 x half>
// CHECK-NEXT:    ret <8 x half> [[TMP0]]
//
float16x8_t test_vcvtq_f16_u16(uint16x8_t a)
{
#ifdef POLYMORPHIC
    return vcvtq(a);
#else /* POLYMORPHIC */
    return vcvtq_f16_u16(a);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_f32_s32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = sitofp <4 x i32> [[A:%.*]] to <4 x float>
// CHECK-NEXT:    ret <4 x float> [[TMP0]]
//
float32x4_t test_vcvtq_f32_s32(int32x4_t a)
{
#ifdef POLYMORPHIC
    return vcvtq(a);
#else /* POLYMORPHIC */
    return vcvtq_f32_s32(a);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_f32_u32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = uitofp <4 x i32> [[A:%.*]] to <4 x float>
// CHECK-NEXT:    ret <4 x float> [[TMP0]]
//
float32x4_t test_vcvtq_f32_u32(uint32x4_t a)
{
#ifdef POLYMORPHIC
    return vcvtq(a);
#else /* POLYMORPHIC */
    return vcvtq_f32_u32(a);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_s16_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = fptosi <8 x half> [[A:%.*]] to <8 x i16>
// CHECK-NEXT:    ret <8 x i16> [[TMP0]]
//
int16x8_t test_vcvtq_s16_f16(float16x8_t a)
{
    return vcvtq_s16_f16(a);
}

// CHECK-LABEL: @test_vcvtq_s32_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = fptosi <4 x float> [[A:%.*]] to <4 x i32>
// CHECK-NEXT:    ret <4 x i32> [[TMP0]]
//
int32x4_t test_vcvtq_s32_f32(float32x4_t a)
{
    return vcvtq_s32_f32(a);
}

// CHECK-LABEL: @test_vcvtq_u16_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = fptoui <8 x half> [[A:%.*]] to <8 x i16>
// CHECK-NEXT:    ret <8 x i16> [[TMP0]]
//
uint16x8_t test_vcvtq_u16_f16(float16x8_t a)
{
    return vcvtq_u16_f16(a);
}

// CHECK-LABEL: @test_vcvtq_u32_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = fptoui <4 x float> [[A:%.*]] to <4 x i32>
// CHECK-NEXT:    ret <4 x i32> [[TMP0]]
//
uint32x4_t test_vcvtq_u32_f32(float32x4_t a)
{
    return vcvtq_u32_f32(a);
}

// CHECK-LABEL: @test_vcvtq_m_f16_s16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x half> @llvm.arm.mve.vcvt.fp.int.predicated.v8f16.v8i16.v8i1(<8 x i16> [[A:%.*]], i32 0, <8 x i1> [[TMP1]], <8 x half> [[INACTIVE:%.*]])
// CHECK-NEXT:    ret <8 x half> [[TMP2]]
//
float16x8_t test_vcvtq_m_f16_s16(float16x8_t inactive, int16x8_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m(inactive, a, p);
#else /* POLYMORPHIC */
    return vcvtq_m_f16_s16(inactive, a, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_m_f16_u16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x half> @llvm.arm.mve.vcvt.fp.int.predicated.v8f16.v8i16.v8i1(<8 x i16> [[A:%.*]], i32 1, <8 x i1> [[TMP1]], <8 x half> [[INACTIVE:%.*]])
// CHECK-NEXT:    ret <8 x half> [[TMP2]]
//
float16x8_t test_vcvtq_m_f16_u16(float16x8_t inactive, uint16x8_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m(inactive, a, p);
#else /* POLYMORPHIC */
    return vcvtq_m_f16_u16(inactive, a, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_m_f32_s32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.fp.int.predicated.v4f32.v4i32.v4i1(<4 x i32> [[A:%.*]], i32 0, <4 x i1> [[TMP1]], <4 x float> [[INACTIVE:%.*]])
// CHECK-NEXT:    ret <4 x float> [[TMP2]]
//
float32x4_t test_vcvtq_m_f32_s32(float32x4_t inactive, int32x4_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m(inactive, a, p);
#else /* POLYMORPHIC */
    return vcvtq_m_f32_s32(inactive, a, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_m_f32_u32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.fp.int.predicated.v4f32.v4i32.v4i1(<4 x i32> [[A:%.*]], i32 1, <4 x i1> [[TMP1]], <4 x float> [[INACTIVE:%.*]])
// CHECK-NEXT:    ret <4 x float> [[TMP2]]
//
float32x4_t test_vcvtq_m_f32_u32(float32x4_t inactive, uint32x4_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m(inactive, a, p);
#else /* POLYMORPHIC */
    return vcvtq_m_f32_u32(inactive, a, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_m_s16_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x i16> @llvm.arm.mve.vcvt.fp.int.predicated.v8i16.v8f16.v8i1(<8 x half> [[A:%.*]], i32 0, <8 x i1> [[TMP1]], <8 x i16> [[INACTIVE:%.*]])
// CHECK-NEXT:    ret <8 x i16> [[TMP2]]
//
int16x8_t test_vcvtq_m_s16_f16(int16x8_t inactive, float16x8_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m(inactive, a, p);
#else /* POLYMORPHIC */
    return vcvtq_m_s16_f16(inactive, a, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_m_s32_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x i32> @llvm.arm.mve.vcvt.fp.int.predicated.v4i32.v4f32.v4i1(<4 x float> [[A:%.*]], i32 0, <4 x i1> [[TMP1]], <4 x i32> [[INACTIVE:%.*]])
// CHECK-NEXT:    ret <4 x i32> [[TMP2]]
//
int32x4_t test_vcvtq_m_s32_f32(int32x4_t inactive, float32x4_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m(inactive, a, p);
#else /* POLYMORPHIC */
    return vcvtq_m_s32_f32(inactive, a, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_m_u16_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x i16> @llvm.arm.mve.vcvt.fp.int.predicated.v8i16.v8f16.v8i1(<8 x half> [[A:%.*]], i32 1, <8 x i1> [[TMP1]], <8 x i16> [[INACTIVE:%.*]])
// CHECK-NEXT:    ret <8 x i16> [[TMP2]]
//
uint16x8_t test_vcvtq_m_u16_f16(uint16x8_t inactive, float16x8_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m(inactive, a, p);
#else /* POLYMORPHIC */
    return vcvtq_m_u16_f16(inactive, a, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_m_u32_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x i32> @llvm.arm.mve.vcvt.fp.int.predicated.v4i32.v4f32.v4i1(<4 x float> [[A:%.*]], i32 1, <4 x i1> [[TMP1]], <4 x i32> [[INACTIVE:%.*]])
// CHECK-NEXT:    ret <4 x i32> [[TMP2]]
//
uint32x4_t test_vcvtq_m_u32_f32(uint32x4_t inactive, float32x4_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m(inactive, a, p);
#else /* POLYMORPHIC */
    return vcvtq_m_u32_f32(inactive, a, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_x_f16_s16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x half> @llvm.arm.mve.vcvt.fp.int.predicated.v8f16.v8i16.v8i1(<8 x i16> [[A:%.*]], i32 0, <8 x i1> [[TMP1]], <8 x half> undef)
// CHECK-NEXT:    ret <8 x half> [[TMP2]]
//
float16x8_t test_vcvtq_x_f16_s16(int16x8_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_x(a, p);
#else /* POLYMORPHIC */
    return vcvtq_x_f16_s16(a, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_x_f16_u16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x half> @llvm.arm.mve.vcvt.fp.int.predicated.v8f16.v8i16.v8i1(<8 x i16> [[A:%.*]], i32 1, <8 x i1> [[TMP1]], <8 x half> undef)
// CHECK-NEXT:    ret <8 x half> [[TMP2]]
//
float16x8_t test_vcvtq_x_f16_u16(uint16x8_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_x(a, p);
#else /* POLYMORPHIC */
    return vcvtq_x_f16_u16(a, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_x_f32_s32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.fp.int.predicated.v4f32.v4i32.v4i1(<4 x i32> [[A:%.*]], i32 0, <4 x i1> [[TMP1]], <4 x float> undef)
// CHECK-NEXT:    ret <4 x float> [[TMP2]]
//
float32x4_t test_vcvtq_x_f32_s32(int32x4_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_x(a, p);
#else /* POLYMORPHIC */
    return vcvtq_x_f32_s32(a, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_x_f32_u32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.fp.int.predicated.v4f32.v4i32.v4i1(<4 x i32> [[A:%.*]], i32 1, <4 x i1> [[TMP1]], <4 x float> undef)
// CHECK-NEXT:    ret <4 x float> [[TMP2]]
//
float32x4_t test_vcvtq_x_f32_u32(uint32x4_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_x(a, p);
#else /* POLYMORPHIC */
    return vcvtq_x_f32_u32(a, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vcvtq_x_s16_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x i16> @llvm.arm.mve.vcvt.fp.int.predicated.v8i16.v8f16.v8i1(<8 x half> [[A:%.*]], i32 0, <8 x i1> [[TMP1]], <8 x i16> undef)
// CHECK-NEXT:    ret <8 x i16> [[TMP2]]
//
int16x8_t test_vcvtq_x_s16_f16(float16x8_t a, mve_pred16_t p)
{
    return vcvtq_x_s16_f16(a, p);
}

// CHECK-LABEL: @test_vcvtq_x_s32_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x i32> @llvm.arm.mve.vcvt.fp.int.predicated.v4i32.v4f32.v4i1(<4 x float> [[A:%.*]], i32 0, <4 x i1> [[TMP1]], <4 x i32> undef)
// CHECK-NEXT:    ret <4 x i32> [[TMP2]]
//
int32x4_t test_vcvtq_x_s32_f32(float32x4_t a, mve_pred16_t p)
{
    return vcvtq_x_s32_f32(a, p);
}

// CHECK-LABEL: @test_vcvtq_x_u16_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x i16> @llvm.arm.mve.vcvt.fp.int.predicated.v8i16.v8f16.v8i1(<8 x half> [[A:%.*]], i32 1, <8 x i1> [[TMP1]], <8 x i16> undef)
// CHECK-NEXT:    ret <8 x i16> [[TMP2]]
//
uint16x8_t test_vcvtq_x_u16_f16(float16x8_t a, mve_pred16_t p)
{
    return vcvtq_x_u16_f16(a, p);
}

// CHECK-LABEL: @test_vcvtq_x_u32_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x i32> @llvm.arm.mve.vcvt.fp.int.predicated.v4i32.v4f32.v4i1(<4 x float> [[A:%.*]], i32 1, <4 x i1> [[TMP1]], <4 x i32> undef)
// CHECK-NEXT:    ret <4 x i32> [[TMP2]]
//
uint32x4_t test_vcvtq_x_u32_f32(float32x4_t a, mve_pred16_t p)
{
    return vcvtq_x_u32_f32(a, p);
}

// CHECK-LABEL: @test_vcvttq_f16_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = call <8 x half> @llvm.arm.mve.vcvt.narrow(<8 x half> [[A:%.*]], <4 x float> [[B:%.*]], i32 1)
// CHECK-NEXT:    ret <8 x half> [[TMP0]]
//
float16x8_t test_vcvttq_f16_f32(float16x8_t a, float32x4_t b)
{
    return vcvttq_f16_f32(a, b);
}

// CHECK-LABEL: @test_vcvttq_m_f16_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x half> @llvm.arm.mve.vcvt.narrow.predicated(<8 x half> [[A:%.*]], <4 x float> [[B:%.*]], i32 1, <4 x i1> [[TMP1]])
// CHECK-NEXT:    ret <8 x half> [[TMP2]]
//
float16x8_t test_vcvttq_m_f16_f32(float16x8_t a, float32x4_t b, mve_pred16_t p)
{
    return vcvttq_m_f16_f32(a, b, p);
}

// CHECK-LABEL: @test_vcvtq_n_f16_s16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = call <8 x half> @llvm.arm.mve.vcvt.fix.v8f16.v8i16(i32 0, <8 x i16> [[A:%.*]], i32 1)
// CHECK-NEXT:    ret <8 x half> [[TMP0]]
//
float16x8_t test_vcvtq_n_f16_s16(int16x8_t a)
{
#ifdef POLYMORPHIC
    return vcvtq_n(a, 1);
#else
    return vcvtq_n_f16_s16(a, 1);
#endif
}

// CHECK-LABEL: @test_vcvtq_n_f16_u16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = call <8 x half> @llvm.arm.mve.vcvt.fix.v8f16.v8i16(i32 1, <8 x i16> [[A:%.*]], i32 2)
// CHECK-NEXT:    ret <8 x half> [[TMP0]]
//
float16x8_t test_vcvtq_n_f16_u16(uint16x8_t a)
{
#ifdef POLYMORPHIC
    return vcvtq_n(a, 2);
#else
    return vcvtq_n_f16_u16(a, 2);
#endif
}

// CHECK-LABEL: @test_vcvtq_n_f32_s32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.fix.v4f32.v4i32(i32 0, <4 x i32> [[A:%.*]], i32 3)
// CHECK-NEXT:    ret <4 x float> [[TMP0]]
//
float32x4_t test_vcvtq_n_f32_s32(int32x4_t a)
{
#ifdef POLYMORPHIC
    return vcvtq_n(a, 3);
#else
    return vcvtq_n_f32_s32(a, 3);
#endif
}

// CHECK-LABEL: @test_vcvtq_n_f32_u32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.fix.v4f32.v4i32(i32 1, <4 x i32> [[A:%.*]], i32 32)
// CHECK-NEXT:    ret <4 x float> [[TMP0]]
//
float32x4_t test_vcvtq_n_f32_u32(uint32x4_t a)
{
#ifdef POLYMORPHIC
    return vcvtq_n(a, 32);
#else
    return vcvtq_n_f32_u32(a, 32);
#endif
}

// CHECK-LABEL: @test_vcvtq_n_s16_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = call <8 x i16> @llvm.arm.mve.vcvt.fix.v8i16.v8f16(i32 0, <8 x half> [[A:%.*]], i32 1)
// CHECK-NEXT:    ret <8 x i16> [[TMP0]]
//
int16x8_t test_vcvtq_n_s16_f16(float16x8_t a)
{
    return vcvtq_n_s16_f16(a, 1);
}

// CHECK-LABEL: @test_vcvtq_n_u16_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = call <8 x i16> @llvm.arm.mve.vcvt.fix.v8i16.v8f16(i32 1, <8 x half> [[A:%.*]], i32 2)
// CHECK-NEXT:    ret <8 x i16> [[TMP0]]
//
uint16x8_t test_vcvtq_n_u16_f16(float16x8_t a)
{
    return vcvtq_n_u16_f16(a, 2);
}

// CHECK-LABEL: @test_vcvtq_n_s32_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = call <4 x i32> @llvm.arm.mve.vcvt.fix.v4i32.v4f32(i32 0, <4 x float> [[A:%.*]], i32 3)
// CHECK-NEXT:    ret <4 x i32> [[TMP0]]
//
int32x4_t test_vcvtq_n_s32_f32(float32x4_t a)
{
    return vcvtq_n_s32_f32(a, 3);
}

// CHECK-LABEL: @test_vcvtq_n_u32_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = call <4 x i32> @llvm.arm.mve.vcvt.fix.v4i32.v4f32(i32 1, <4 x float> [[A:%.*]], i32 32)
// CHECK-NEXT:    ret <4 x i32> [[TMP0]]
//
uint32x4_t test_vcvtq_n_u32_f32(float32x4_t a)
{
    return vcvtq_n_u32_f32(a, 32);
}

// CHECK-LABEL: @test_vcvtq_m_n_f16_s16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x half> @llvm.arm.mve.vcvt.fix.predicated.v8f16.v8i16.v8i1(i32 0, <8 x half> [[INACTIVE:%.*]], <8 x i16> [[A:%.*]], i32 1, <8 x i1> [[TMP1]])
// CHECK-NEXT:    ret <8 x half> [[TMP2]]
//
float16x8_t test_vcvtq_m_n_f16_s16(float16x8_t inactive, int16x8_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m_n(inactive, a, 1, p);
#else
    return vcvtq_m_n_f16_s16(inactive, a, 1, p);
#endif
}

// CHECK-LABEL: @test_vcvtq_m_n_f16_u16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x half> @llvm.arm.mve.vcvt.fix.predicated.v8f16.v8i16.v8i1(i32 1, <8 x half> [[INACTIVE:%.*]], <8 x i16> [[A:%.*]], i32 2, <8 x i1> [[TMP1]])
// CHECK-NEXT:    ret <8 x half> [[TMP2]]
//
float16x8_t test_vcvtq_m_n_f16_u16(float16x8_t inactive, uint16x8_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m_n(inactive, a, 2, p);
#else
    return vcvtq_m_n_f16_u16(inactive, a, 2, p);
#endif
}

// CHECK-LABEL: @test_vcvtq_m_n_f32_s32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.fix.predicated.v4f32.v4i32.v4i1(i32 0, <4 x float> [[INACTIVE:%.*]], <4 x i32> [[A:%.*]], i32 3, <4 x i1> [[TMP1]])
// CHECK-NEXT:    ret <4 x float> [[TMP2]]
//
float32x4_t test_vcvtq_m_n_f32_s32(float32x4_t inactive, int32x4_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m_n(inactive, a, 3, p);
#else
    return vcvtq_m_n_f32_s32(inactive, a, 3, p);
#endif
}

// CHECK-LABEL: @test_vcvtq_m_n_f32_u32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.fix.predicated.v4f32.v4i32.v4i1(i32 1, <4 x float> [[INACTIVE:%.*]], <4 x i32> [[A:%.*]], i32 32, <4 x i1> [[TMP1]])
// CHECK-NEXT:    ret <4 x float> [[TMP2]]
//
float32x4_t test_vcvtq_m_n_f32_u32(float32x4_t inactive, uint32x4_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m_n(inactive, a, 32, p);
#else
    return vcvtq_m_n_f32_u32(inactive, a, 32, p);
#endif
}

// CHECK-LABEL: @test_vcvtq_m_n_s16_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x i16> @llvm.arm.mve.vcvt.fix.predicated.v8i16.v8f16.v8i1(i32 0, <8 x i16> [[INACTIVE:%.*]], <8 x half> [[A:%.*]], i32 1, <8 x i1> [[TMP1]])
// CHECK-NEXT:    ret <8 x i16> [[TMP2]]
//
int16x8_t test_vcvtq_m_n_s16_f16(int16x8_t inactive, float16x8_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m_n(inactive, a, 1, p);
#else
    return vcvtq_m_n_s16_f16(inactive, a, 1, p);
#endif
}

// CHECK-LABEL: @test_vcvtq_m_n_u16_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x i16> @llvm.arm.mve.vcvt.fix.predicated.v8i16.v8f16.v8i1(i32 1, <8 x i16> [[INACTIVE:%.*]], <8 x half> [[A:%.*]], i32 2, <8 x i1> [[TMP1]])
// CHECK-NEXT:    ret <8 x i16> [[TMP2]]
//
uint16x8_t test_vcvtq_m_n_u16_f16(uint16x8_t inactive, float16x8_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m_n(inactive, a, 2, p);
#else
    return vcvtq_m_n_u16_f16(inactive, a, 2, p);
#endif
}

// CHECK-LABEL: @test_vcvtq_m_n_s32_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x i32> @llvm.arm.mve.vcvt.fix.predicated.v4i32.v4f32.v4i1(i32 0, <4 x i32> [[INACTIVE:%.*]], <4 x float> [[A:%.*]], i32 3, <4 x i1> [[TMP1]])
// CHECK-NEXT:    ret <4 x i32> [[TMP2]]
//
int32x4_t test_vcvtq_m_n_s32_f32(int32x4_t inactive, float32x4_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m_n(inactive, a, 3, p);
#else
    return vcvtq_m_n_s32_f32(inactive, a, 3, p);
#endif
}

// CHECK-LABEL: @test_vcvtq_m_n_u32_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x i32> @llvm.arm.mve.vcvt.fix.predicated.v4i32.v4f32.v4i1(i32 1, <4 x i32> [[INACTIVE:%.*]], <4 x float> [[A:%.*]], i32 32, <4 x i1> [[TMP1]])
// CHECK-NEXT:    ret <4 x i32> [[TMP2]]
//
uint32x4_t test_vcvtq_m_n_u32_f32(uint32x4_t inactive, float32x4_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_m_n(inactive, a, 32, p);
#else
    return vcvtq_m_n_u32_f32(inactive, a, 32, p);
#endif
}

// CHECK-LABEL: @test_vcvtq_x_n_f16_s16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x half> @llvm.arm.mve.vcvt.fix.predicated.v8f16.v8i16.v8i1(i32 0, <8 x half> undef, <8 x i16> [[A:%.*]], i32 1, <8 x i1> [[TMP1]])
// CHECK-NEXT:    ret <8 x half> [[TMP2]]
//
float16x8_t test_vcvtq_x_n_f16_s16(int16x8_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_x_n(a, 1, p);
#else
    return vcvtq_x_n_f16_s16(a, 1, p);
#endif
}

// CHECK-LABEL: @test_vcvtq_x_n_f16_u16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x half> @llvm.arm.mve.vcvt.fix.predicated.v8f16.v8i16.v8i1(i32 1, <8 x half> undef, <8 x i16> [[A:%.*]], i32 2, <8 x i1> [[TMP1]])
// CHECK-NEXT:    ret <8 x half> [[TMP2]]
//
float16x8_t test_vcvtq_x_n_f16_u16(uint16x8_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_x_n(a, 2, p);
#else
    return vcvtq_x_n_f16_u16(a, 2, p);
#endif
}

// CHECK-LABEL: @test_vcvtq_x_n_f32_s32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.fix.predicated.v4f32.v4i32.v4i1(i32 0, <4 x float> undef, <4 x i32> [[A:%.*]], i32 3, <4 x i1> [[TMP1]])
// CHECK-NEXT:    ret <4 x float> [[TMP2]]
//
float32x4_t test_vcvtq_x_n_f32_s32(int32x4_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_x_n(a, 3, p);
#else
    return vcvtq_x_n_f32_s32(a, 3, p);
#endif
}

// CHECK-LABEL: @test_vcvtq_x_n_f32_u32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.fix.predicated.v4f32.v4i32.v4i1(i32 1, <4 x float> undef, <4 x i32> [[A:%.*]], i32 32, <4 x i1> [[TMP1]])
// CHECK-NEXT:    ret <4 x float> [[TMP2]]
//
float32x4_t test_vcvtq_x_n_f32_u32(uint32x4_t a, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vcvtq_x_n(a, 32, p);
#else
    return vcvtq_x_n_f32_u32(a, 32, p);
#endif
}

// CHECK-LABEL: @test_vcvtq_x_n_s16_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x i16> @llvm.arm.mve.vcvt.fix.predicated.v8i16.v8f16.v8i1(i32 0, <8 x i16> undef, <8 x half> [[A:%.*]], i32 1, <8 x i1> [[TMP1]])
// CHECK-NEXT:    ret <8 x i16> [[TMP2]]
//
int16x8_t test_vcvtq_x_n_s16_f16(float16x8_t a, mve_pred16_t p)
{
    return vcvtq_x_n_s16_f16(a, 1, p);
}

// CHECK-LABEL: @test_vcvtq_x_n_u16_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x i16> @llvm.arm.mve.vcvt.fix.predicated.v8i16.v8f16.v8i1(i32 1, <8 x i16> undef, <8 x half> [[A:%.*]], i32 2, <8 x i1> [[TMP1]])
// CHECK-NEXT:    ret <8 x i16> [[TMP2]]
//
uint16x8_t test_vcvtq_x_n_u16_f16(float16x8_t a, mve_pred16_t p)
{
    return vcvtq_x_n_u16_f16(a, 2, p);
}

// CHECK-LABEL: @test_vcvtq_x_n_s32_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x i32> @llvm.arm.mve.vcvt.fix.predicated.v4i32.v4f32.v4i1(i32 0, <4 x i32> undef, <4 x float> [[A:%.*]], i32 3, <4 x i1> [[TMP1]])
// CHECK-NEXT:    ret <4 x i32> [[TMP2]]
//
int32x4_t test_vcvtq_x_n_s32_f32(float32x4_t a, mve_pred16_t p)
{
    return vcvtq_x_n_s32_f32(a, 3, p);
}

// CHECK-LABEL: @test_vcvtq_x_n_u32_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x i32> @llvm.arm.mve.vcvt.fix.predicated.v4i32.v4f32.v4i1(i32 1, <4 x i32> undef, <4 x float> [[A:%.*]], i32 32, <4 x i1> [[TMP1]])
// CHECK-NEXT:    ret <4 x i32> [[TMP2]]
//
uint32x4_t test_vcvtq_x_n_u32_f32(float32x4_t a, mve_pred16_t p)
{
    return vcvtq_x_n_u32_f32(a, 32, p);
}

// CHECK-LABEL: @test_vcvtbq_f32_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.widen(<8 x half> [[A:%.*]], i32 0)
// CHECK-NEXT:    ret <4 x float> [[TMP0]]
//
float32x4_t test_vcvtbq_f32_f16(float16x8_t a)
{
    return vcvtbq_f32_f16(a);
}

// CHECK-LABEL: @test_vcvttq_f32_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.widen(<8 x half> [[A:%.*]], i32 1)
// CHECK-NEXT:    ret <4 x float> [[TMP0]]
//
float32x4_t test_vcvttq_f32_f16(float16x8_t a)
{
    return vcvttq_f32_f16(a);
}

// CHECK-LABEL: @test_vcvtbq_m_f32_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.widen.predicated(<4 x float> [[INACTIVE:%.*]], <8 x half> [[A:%.*]], i32 0, <4 x i1> [[TMP1]])
// CHECK-NEXT:    ret <4 x float> [[TMP2]]
//
float32x4_t test_vcvtbq_m_f32_f16(float32x4_t inactive, float16x8_t a, mve_pred16_t p)
{
    return vcvtbq_m_f32_f16(inactive, a, p);
}

// CHECK-LABEL: @test_vcvttq_m_f32_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.widen.predicated(<4 x float> [[INACTIVE:%.*]], <8 x half> [[A:%.*]], i32 1, <4 x i1> [[TMP1]])
// CHECK-NEXT:    ret <4 x float> [[TMP2]]
//
float32x4_t test_vcvttq_m_f32_f16(float32x4_t inactive, float16x8_t a, mve_pred16_t p)
{
    return vcvttq_m_f32_f16(inactive, a, p);
}

// CHECK-LABEL: @test_vcvtbq_x_f32_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.widen.predicated(<4 x float> undef, <8 x half> [[A:%.*]], i32 0, <4 x i1> [[TMP1]])
// CHECK-NEXT:    ret <4 x float> [[TMP2]]
//
float32x4_t test_vcvtbq_x_f32_f16(float16x8_t a, mve_pred16_t p)
{
    return vcvtbq_x_f32_f16(a, p);
}

// CHECK-LABEL: @test_vcvttq_x_f32_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x float> @llvm.arm.mve.vcvt.widen.predicated(<4 x float> undef, <8 x half> [[A:%.*]], i32 1, <4 x i1> [[TMP1]])
// CHECK-NEXT:    ret <4 x float> [[TMP2]]
//
float32x4_t test_vcvttq_x_f32_f16(float16x8_t a, mve_pred16_t p)
{
    return vcvttq_x_f32_f16(a, p);
}