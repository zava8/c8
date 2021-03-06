; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -codegenprepare -mtriple=aarch64-none-linux-gnu < %s | FileCheck %s

@_MergedGlobals = external dso_local global <{ i32, i32 }>, align 4

define dso_local i32 @f(i1 %a, i8 %b) local_unnamed_addr {
; CHECK-LABEL: @f(
; CHECK-NEXT:    br label [[TMP6:%.*]]
; CHECK:       1:
; CHECK-NEXT:    br i1 [[A:%.*]], label [[TMP2:%.*]], label [[TMP6]]
; CHECK:       2:
; CHECK-NEXT:    [[TMP3:%.*]] = phi i32* [ getelementptr inbounds (<{ i32, i32 }>, <{ i32, i32 }>* @_MergedGlobals, i32 0, i32 1), [[TMP1:%.*]] ], [ [[TMP16:%.*]], [[TMP14:%.*]] ]
; CHECK-NEXT:    [[TMP4:%.*]] = phi i32* [ getelementptr inbounds (<{ i32, i32 }>, <{ i32, i32 }>* @_MergedGlobals, i32 0, i32 1), [[TMP1]] ], [ [[TMP15:%.*]], [[TMP14]] ]
; CHECK-NEXT:    ret i32 0
; CHECK:       5:
; CHECK-NEXT:    br label [[TMP6]]
; CHECK:       6:
; CHECK-NEXT:    [[TMP7:%.*]] = phi i32* [ getelementptr inbounds (<{ i32, i32 }>, <{ i32, i32 }>* @_MergedGlobals, i32 0, i32 0), [[TMP0:%.*]] ], [ [[TMP3]], [[TMP5:%.*]] ], [ getelementptr inbounds (<{ i32, i32 }>, <{ i32, i32 }>* @_MergedGlobals, i32 0, i32 1), [[TMP1]] ]
; CHECK-NEXT:    [[TMP8:%.*]] = phi i32* [ getelementptr inbounds (<{ i32, i32 }>, <{ i32, i32 }>* @_MergedGlobals, i32 0, i32 0), [[TMP0]] ], [ [[TMP4]], [[TMP5]] ], [ getelementptr inbounds (<{ i32, i32 }>, <{ i32, i32 }>* @_MergedGlobals, i32 0, i32 1), [[TMP1]] ]
; CHECK-NEXT:    br label [[TMP9:%.*]]
; CHECK:       9:
; CHECK-NEXT:    [[TMP10:%.*]] = phi i32* [ [[TMP16]], [[TMP14]] ], [ [[TMP7]], [[TMP6]] ]
; CHECK-NEXT:    [[TMP11:%.*]] = phi i32* [ [[TMP16]], [[TMP14]] ], [ [[TMP8]], [[TMP6]] ]
; CHECK-NEXT:    [[TMP12:%.*]] = phi i32* [ [[TMP15]], [[TMP14]] ], [ [[TMP8]], [[TMP6]] ]
; CHECK-NEXT:    br i1 [[A]], label [[TMP14]], label [[TMP13:%.*]]
; CHECK:       13:
; CHECK-NEXT:    store i32 5, i32* [[TMP11]], align 4
; CHECK-NEXT:    br label [[TMP14]]
; CHECK:       14:
; CHECK-NEXT:    [[TMP15]] = phi i32* [ [[TMP12]], [[TMP13]] ], [ [[TMP10]], [[TMP9]] ]
; CHECK-NEXT:    [[TMP16]] = phi i32* [ [[TMP11]], [[TMP13]] ], [ [[TMP10]], [[TMP9]] ]
; CHECK-NEXT:    br i1 [[A]], label [[TMP2]], label [[TMP9]]
;
  br label %11

1:                                                ; No predecessors!
  br i1 %a, label %2, label %10

2:                                                ; preds = %22, %1
  %3 = phi i32* [ getelementptr inbounds (<{ i32, i32 }>, <{ i32, i32 }>* @_MergedGlobals, i32 0, i32 1), %1 ], [ %21, %22 ]
  %4 = phi i32* [ getelementptr inbounds (<{ i32, i32 }>, <{ i32, i32 }>* @_MergedGlobals, i32 0, i32 1), %1 ], [ %20, %22 ]
  ret i32 0

5:                                                ; No predecessors!
  %6 = icmp ugt i8 %b, 50
  br label %7

7:                                                ; preds = %10, %5
  %8 = phi i32* [ %3, %5 ], [ getelementptr inbounds (<{ i32, i32 }>, <{ i32, i32 }>* @_MergedGlobals, i32 0, i32 1), %10 ]
  %9 = phi i32* [ %4, %5 ], [ getelementptr inbounds (<{ i32, i32 }>, <{ i32, i32 }>* @_MergedGlobals, i32 0, i32 1), %10 ]
  br label %11

10:                                               ; preds = %1
  br label %7

11:                                               ; preds = %7, %0
  %12 = phi i32* [ getelementptr inbounds (<{ i32, i32 }>, <{ i32, i32 }>* @_MergedGlobals, i32 0, i32 0), %0 ], [ %8, %7 ]
  %13 = phi i32* [ getelementptr inbounds (<{ i32, i32 }>, <{ i32, i32 }>* @_MergedGlobals, i32 0, i32 0), %0 ], [ %9, %7 ]
  br label %14

14:                                               ; preds = %19, %11
  %15 = phi i32* [ %21, %19 ], [ %12, %11 ]
  %16 = phi i32* [ %21, %19 ], [ %13, %11 ]
  %17 = phi i32* [ %20, %19 ], [ %13, %11 ]
  br i1 %a, label %19, label %18

18:                                               ; preds = %14
  store i32 5, i32* %16, align 4
  br label %19

19:                                               ; preds = %18, %14
  %20 = phi i32* [ %17, %18 ], [ %15, %14 ]
  %21 = phi i32* [ %16, %18 ], [ %15, %14 ]
  br i1 %a, label %22, label %14

22:                                               ; preds = %19
  br label %2
}
