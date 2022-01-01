# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=aarch64-linux-gnu -mcpu=exynos-m3 -resource-pressure=false -noalias=false < %s | FileCheck %s -check-prefixes=ALL,M3
# RUN: llvm-mca -mtriple=aarch64-linux-gnu -mcpu=exynos-m4 -resource-pressure=false -noalias=false < %s | FileCheck %s -check-prefixes=ALL,M4
# RUN: llvm-mca -mtriple=aarch64-linux-gnu -mcpu=exynos-m5 -resource-pressure=false -noalias=false < %s | FileCheck %s -check-prefixes=ALL,M5

st1	{v0.s}[0], [sp]
st1	{v0.2s}, [sp]
st1	{v0.2s, v1.2s}, [sp]
st1	{v0.2s, v1.2s, v2.2s}, [sp]
st1	{v0.2s, v1.2s, v2.2s, v3.2s}, [sp]

st1	{v0.d}[0], [sp]
st1	{v0.2d}, [sp]
st1	{v0.2d, v1.2d}, [sp]
st1	{v0.2d, v1.2d, v2.2d}, [sp]
st1	{v0.2d, v1.2d, v2.2d, v3.2d}, [sp]

st1	{v0.s}[0], [sp], #4
st1	{v0.2s}, [sp], #8
st1	{v0.2s, v1.2s}, [sp], #16
st1	{v0.2s, v1.2s, v2.2s}, [sp], #24
st1	{v0.2s, v1.2s, v2.2s, v3.2s}, [sp], #32

st1	{v0.d}[0], [sp], #8
st1	{v0.2d}, [sp], #16
st1	{v0.2d, v1.2d}, [sp], #32
st1	{v0.2d, v1.2d, v2.2d}, [sp], #48
st1	{v0.2d, v1.2d, v2.2d, v3.2d}, [sp], #64

st1	{v0.s}[0], [sp], x0
st1	{v0.2s}, [sp], x0
st1	{v0.2s, v1.2s}, [sp], x0
st1	{v0.2s, v1.2s, v2.2s}, [sp], x0
st1	{v0.2s, v1.2s, v2.2s, v3.2s}, [sp], x0

st1	{v0.d}[0], [sp], x0
st1	{v0.2d}, [sp], x0
st1	{v0.2d, v1.2d}, [sp], x0
st1	{v0.2d, v1.2d, v2.2d}, [sp], x0
st1	{v0.2d, v1.2d, v2.2d, v3.2d}, [sp], x0

# ALL:      Iterations:        100
# ALL-NEXT: Instructions:      3000

# M3-NEXT:  Total Cycles:      10203
# M3-NEXT:  Total uOps:        8400

# M4-NEXT:  Total Cycles:      6603
# M4-NEXT:  Total uOps:        8600

# M5-NEXT:  Total Cycles:      6603
# M5-NEXT:  Total uOps:        8600

# ALL:      Dispatch Width:    6

# M3-NEXT:  uOps Per Cycle:    0.82
# M3-NEXT:  IPC:               0.29
# M3-NEXT:  Block RThroughput: 72.0

# M4-NEXT:  uOps Per Cycle:    1.30
# M4-NEXT:  IPC:               0.45
# M4-NEXT:  Block RThroughput: 33.0

# M5-NEXT:  uOps Per Cycle:    1.30
# M5-NEXT:  IPC:               0.45
# M5-NEXT:  Block RThroughput: 33.0

# ALL:      Instruction Info:
# ALL-NEXT: [1]: #uOps
# ALL-NEXT: [2]: Latency
# ALL-NEXT: [3]: RThroughput
# ALL-NEXT: [4]: MayLoad
# ALL-NEXT: [5]: MayStore
# ALL-NEXT: [6]: HasSideEffects (U)

# ALL:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:

# M3-NEXT:   4      7     3.00           *            st1	{ v0.s }[0], [sp]
# M3-NEXT:   1      1     1.00           *            st1	{ v0.2s }, [sp]
# M3-NEXT:   2      2     2.00           *            st1	{ v0.2s, v1.2s }, [sp]
# M3-NEXT:   3      3     3.00           *            st1	{ v0.2s, v1.2s, v2.2s }, [sp]
# M3-NEXT:   4      4     4.00           *            st1	{ v0.2s, v1.2s, v2.2s, v3.2s }, [sp]
# M3-NEXT:   4      7     3.00           *            st1	{ v0.d }[0], [sp]
# M3-NEXT:   1      1     1.00           *            st1	{ v0.2d }, [sp]
# M3-NEXT:   2      2     2.00           *            st1	{ v0.2d, v1.2d }, [sp]
# M3-NEXT:   3      3     3.00           *            st1	{ v0.2d, v1.2d, v2.2d }, [sp]
# M3-NEXT:   4      4     4.00           *            st1	{ v0.2d, v1.2d, v2.2d, v3.2d }, [sp]
# M3-NEXT:   4      7     3.00           *            st1	{ v0.s }[0], [sp], #4
# M3-NEXT:   1      1     1.00           *            st1	{ v0.2s }, [sp], #8
# M3-NEXT:   2      2     2.00           *            st1	{ v0.2s, v1.2s }, [sp], #16
# M3-NEXT:   3      3     3.00           *            st1	{ v0.2s, v1.2s, v2.2s }, [sp], #24
# M3-NEXT:   4      4     4.00           *            st1	{ v0.2s, v1.2s, v2.2s, v3.2s }, [sp], #32
# M3-NEXT:   4      7     3.00           *            st1	{ v0.d }[0], [sp], #8
# M3-NEXT:   1      1     1.00           *            st1	{ v0.2d }, [sp], #16
# M3-NEXT:   2      2     2.00           *            st1	{ v0.2d, v1.2d }, [sp], #32
# M3-NEXT:   3      3     3.00           *            st1	{ v0.2d, v1.2d, v2.2d }, [sp], #48
# M3-NEXT:   4      4     4.00           *            st1	{ v0.2d, v1.2d, v2.2d, v3.2d }, [sp], #64
# M3-NEXT:   4      7     3.00           *            st1	{ v0.s }[0], [sp], x0
# M3-NEXT:   1      1     1.00           *            st1	{ v0.2s }, [sp], x0
# M3-NEXT:   2      2     2.00           *            st1	{ v0.2s, v1.2s }, [sp], x0
# M3-NEXT:   3      3     3.00           *            st1	{ v0.2s, v1.2s, v2.2s }, [sp], x0
# M3-NEXT:   4      4     4.00           *            st1	{ v0.2s, v1.2s, v2.2s, v3.2s }, [sp], x0
# M3-NEXT:   4      7     3.00           *            st1	{ v0.d }[0], [sp], x0
# M3-NEXT:   1      1     1.00           *            st1	{ v0.2d }, [sp], x0
# M3-NEXT:   2      2     2.00           *            st1	{ v0.2d, v1.2d }, [sp], x0
# M3-NEXT:   3      3     3.00           *            st1	{ v0.2d, v1.2d, v2.2d }, [sp], x0
# M3-NEXT:   4      4     4.00           *            st1	{ v0.2d, v1.2d, v2.2d, v3.2d }, [sp], x0

# M4-NEXT:   1      1     0.50           *            st1	{ v0.s }[0], [sp]
# M4-NEXT:   1      1     0.50           *            st1	{ v0.2s }, [sp]
# M4-NEXT:   2      2     1.00           *            st1	{ v0.2s, v1.2s }, [sp]
# M4-NEXT:   3      3     1.50           *            st1	{ v0.2s, v1.2s, v2.2s }, [sp]
# M4-NEXT:   4      4     2.00           *            st1	{ v0.2s, v1.2s, v2.2s, v3.2s }, [sp]
# M4-NEXT:   1      1     0.50           *            st1	{ v0.d }[0], [sp]
# M4-NEXT:   1      1     0.50           *            st1	{ v0.2d }, [sp]
# M4-NEXT:   2      2     1.00           *            st1	{ v0.2d, v1.2d }, [sp]
# M4-NEXT:   3      3     1.50           *            st1	{ v0.2d, v1.2d, v2.2d }, [sp]
# M4-NEXT:   4      4     2.00           *            st1	{ v0.2d, v1.2d, v2.2d, v3.2d }, [sp]
# M4-NEXT:   2      1     0.50           *            st1	{ v0.s }[0], [sp], #4
# M4-NEXT:   2      1     0.50           *            st1	{ v0.2s }, [sp], #8
# M4-NEXT:   3      2     1.00           *            st1	{ v0.2s, v1.2s }, [sp], #16
# M4-NEXT:   4      3     1.50           *            st1	{ v0.2s, v1.2s, v2.2s }, [sp], #24
# M4-NEXT:   5      4     2.00           *            st1	{ v0.2s, v1.2s, v2.2s, v3.2s }, [sp], #32
# M4-NEXT:   2      1     0.50           *            st1	{ v0.d }[0], [sp], #8
# M4-NEXT:   2      1     0.50           *            st1	{ v0.2d }, [sp], #16
# M4-NEXT:   3      2     1.00           *            st1	{ v0.2d, v1.2d }, [sp], #32
# M4-NEXT:   4      3     1.50           *            st1	{ v0.2d, v1.2d, v2.2d }, [sp], #48
# M4-NEXT:   5      4     2.00           *            st1	{ v0.2d, v1.2d, v2.2d, v3.2d }, [sp], #64
# M4-NEXT:   2      1     0.50           *            st1	{ v0.s }[0], [sp], x0
# M4-NEXT:   2      1     0.50           *            st1	{ v0.2s }, [sp], x0
# M4-NEXT:   3      2     1.00           *            st1	{ v0.2s, v1.2s }, [sp], x0
# M4-NEXT:   4      3     1.50           *            st1	{ v0.2s, v1.2s, v2.2s }, [sp], x0
# M4-NEXT:   5      4     2.00           *            st1	{ v0.2s, v1.2s, v2.2s, v3.2s }, [sp], x0
# M4-NEXT:   2      1     0.50           *            st1	{ v0.d }[0], [sp], x0
# M4-NEXT:   2      1     0.50           *            st1	{ v0.2d }, [sp], x0
# M4-NEXT:   3      2     1.00           *            st1	{ v0.2d, v1.2d }, [sp], x0
# M4-NEXT:   4      3     1.50           *            st1	{ v0.2d, v1.2d, v2.2d }, [sp], x0
# M4-NEXT:   5      4     2.00           *            st1	{ v0.2d, v1.2d, v2.2d, v3.2d }, [sp], x0

# M5-NEXT:   1      1     0.50           *            st1	{ v0.s }[0], [sp]
# M5-NEXT:   1      1     0.50           *            st1	{ v0.2s }, [sp]
# M5-NEXT:   2      2     1.00           *            st1	{ v0.2s, v1.2s }, [sp]
# M5-NEXT:   3      3     1.50           *            st1	{ v0.2s, v1.2s, v2.2s }, [sp]
# M5-NEXT:   4      4     2.00           *            st1	{ v0.2s, v1.2s, v2.2s, v3.2s }, [sp]
# M5-NEXT:   1      1     0.50           *            st1	{ v0.d }[0], [sp]
# M5-NEXT:   1      1     0.50           *            st1	{ v0.2d }, [sp]
# M5-NEXT:   2      2     1.00           *            st1	{ v0.2d, v1.2d }, [sp]
# M5-NEXT:   3      3     1.50           *            st1	{ v0.2d, v1.2d, v2.2d }, [sp]
# M5-NEXT:   4      4     2.00           *            st1	{ v0.2d, v1.2d, v2.2d, v3.2d }, [sp]
# M5-NEXT:   2      1     0.50           *            st1	{ v0.s }[0], [sp], #4
# M5-NEXT:   2      1     0.50           *            st1	{ v0.2s }, [sp], #8
# M5-NEXT:   3      2     1.00           *            st1	{ v0.2s, v1.2s }, [sp], #16
# M5-NEXT:   4      3     1.50           *            st1	{ v0.2s, v1.2s, v2.2s }, [sp], #24
# M5-NEXT:   5      4     2.00           *            st1	{ v0.2s, v1.2s, v2.2s, v3.2s }, [sp], #32
# M5-NEXT:   2      1     0.50           *            st1	{ v0.d }[0], [sp], #8
# M5-NEXT:   2      1     0.50           *            st1	{ v0.2d }, [sp], #16
# M5-NEXT:   3      2     1.00           *            st1	{ v0.2d, v1.2d }, [sp], #32
# M5-NEXT:   4      3     1.50           *            st1	{ v0.2d, v1.2d, v2.2d }, [sp], #48
# M5-NEXT:   5      4     2.00           *            st1	{ v0.2d, v1.2d, v2.2d, v3.2d }, [sp], #64
# M5-NEXT:   2      1     0.50           *            st1	{ v0.s }[0], [sp], x0
# M5-NEXT:   2      1     0.50           *            st1	{ v0.2s }, [sp], x0
# M5-NEXT:   3      2     1.00           *            st1	{ v0.2s, v1.2s }, [sp], x0
# M5-NEXT:   4      3     1.50           *            st1	{ v0.2s, v1.2s, v2.2s }, [sp], x0
# M5-NEXT:   5      4     2.00           *            st1	{ v0.2s, v1.2s, v2.2s, v3.2s }, [sp], x0
# M5-NEXT:   2      1     0.50           *            st1	{ v0.d }[0], [sp], x0
# M5-NEXT:   2      1     0.50           *            st1	{ v0.2d }, [sp], x0
# M5-NEXT:   3      2     1.00           *            st1	{ v0.2d, v1.2d }, [sp], x0
# M5-NEXT:   4      3     1.50           *            st1	{ v0.2d, v1.2d, v2.2d }, [sp], x0
# M5-NEXT:   5      4     2.00           *            st1	{ v0.2d, v1.2d, v2.2d, v3.2d }, [sp], x0