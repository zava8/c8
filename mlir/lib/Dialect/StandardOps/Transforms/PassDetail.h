//===- PassDetail.h - GPU Pass class details --------------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef DIALECT_STANDARD_TRANSFORMS_PASSDETAIL_H_
#define DIALECT_STANDARD_TRANSFORMS_PASSDETAIL_H_

#include "mlir/Dialect/SCF/SCF.h"
#include "mlir/Pass/Pass.h"

namespace mlir {

class AtomicRMWOp;

namespace bufferization {
class BufferizationDialect;
} // namespace bufferization

namespace memref {
class MemRefDialect;
} // namespace memref

#define GEN_PASS_CLASSES
#include "mlir/Dialect/StandardOps/Transforms/Passes.h.inc"

} // namespace mlir

#endif // DIALECT_STANDARD_TRANSFORMS_PASSDETAIL_H_
