; ModuleID = 'sgefa.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.FULL = type { i32, i32, [1000 x float*] }

@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [49 x i8] c"Matrix row dim (%d) or column dim (%d) too big.\0A\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"One-Norm(A) ---------- %e.\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"FACTORED MATRIX FOLLOWS\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"True Solution\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"Solution\00", align 1
@.str.5 = private unnamed_addr constant [30 x i8] c"Solution to transposed system\00", align 1
@.str.24 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"%3d|\00", align 1
@.str.27 = private unnamed_addr constant [7 x i8] c"%12.4e\00", align 1
@.str.28 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.26 = private unnamed_addr constant [5 x i8] c"    \00", align 1
@.str.6 = private unnamed_addr constant [74 x i8] c"\0A\0A**********************************************************************\0A\00", align 1
@.str.7 = private unnamed_addr constant [42 x i8] c"Hilbert Slice.  Test case %d of size %d.\0A\00", align 1
@.str.8 = private unnamed_addr constant [42 x i8] c"Monoelemental.  Test case %d of size %d.\0A\00", align 1
@.str.9 = private unnamed_addr constant [41 x i8] c"Tridiagional.  Test case %d of size %d.\0A\00", align 1
@.str.10 = private unnamed_addr constant [37 x i8] c"Rank One.  Test case %d of size %d.\0A\00", align 1
@.str.11 = private unnamed_addr constant [40 x i8] c"Zero Column.  Test case %d of size %d.\0A\00", align 1
@.str.12 = private unnamed_addr constant [45 x i8] c"Upper Triangular.  Test case %d of size %d.\0A\00", align 1
@.str.13 = private unnamed_addr constant [45 x i8] c"Lower Triangular.  Test case %d of size %d.\0A\00", align 1
@.str.14 = private unnamed_addr constant [51 x i8] c"Near Overflow.  Test case %d of size %d. BIG = %e\0A\00", align 1
@.str.15 = private unnamed_addr constant [54 x i8] c"Near Underflow.  Test case %d of size %d. SMALL = %e\0A\00", align 1
@.str.16 = private unnamed_addr constant [29 x i8] c"MATGEN: All tests complete.\0A\00", align 1
@.str.17 = private unnamed_addr constant [26 x i8] c"MATGEN: Error in matvec.\0A\00", align 1
@.str.18 = private unnamed_addr constant [15 x i8] c"MATRIX FOLLOWS\00", align 1
@.str.19 = private unnamed_addr constant [9 x i8] c"SOLUTION\00", align 1
@.str.20 = private unnamed_addr constant [16 x i8] c"RIGHT HAND SIDE\00", align 1
@.str.21 = private unnamed_addr constant [26 x i8] c"TRANSPOSE RIGHT HAND SIDE\00", align 1
@.str.22 = private unnamed_addr constant [52 x i8] c"GET_SPACE: Can't get enouph space for matricies...\0A\00", align 1
@.str.23 = private unnamed_addr constant [50 x i8] c"GET_SPACE: Can't get enouph space for vectors...\0A\00", align 1
@.str.29 = private unnamed_addr constant [4 x i8] c"%8d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @isamax(i32 %n, float* %sx, i32 %incx) #0 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %sx.addr = alloca float*, align 8
  %incx.addr = alloca i32, align 4
  %smax = alloca float, align 4
  %i = alloca i32, align 4
  %istmp = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store float* %sx, float** %sx.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store float 0.000000e+00, float* %smax, align 4
  store i32 0, i32* %istmp, align 4
  %0 = load i32, i32* %n.addr, align 4
  %cmp = icmp sle i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %istmp, align 4
  store i32 %1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %incx.addr, align 4
  %cmp1 = icmp ne i32 %2, 1
  br i1 %cmp1, label %if.then2, label %if.end36

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %incx.addr, align 4
  %cmp3 = icmp slt i32 %3, 0
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.then2
  %4 = load float*, float** %sx.addr, align 8
  %5 = load i32, i32* %n.addr, align 4
  %sub = sub nsw i32 0, %5
  %add = add nsw i32 %sub, 1
  %6 = load i32, i32* %incx.addr, align 4
  %mul = mul nsw i32 %add, %6
  %add5 = add nsw i32 %mul, 1
  %idx.ext = sext i32 %add5 to i64
  %add.ptr = getelementptr inbounds float, float* %4, i64 %idx.ext
  store float* %add.ptr, float** %sx.addr, align 8
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.then2
  store i32 0, i32* %istmp, align 4
  %7 = load float*, float** %sx.addr, align 8
  %8 = load float, float* %7, align 4
  %conv = fpext float %8 to double
  %cmp7 = fcmp ogt double %conv, 0.000000e+00
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end6
  %9 = load float*, float** %sx.addr, align 8
  %10 = load float, float* %9, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end6
  %11 = load float*, float** %sx.addr, align 8
  %12 = load float, float* %11, align 4
  %sub9 = fsub float -0.000000e+00, %12
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi float [ %10, %cond.true ], [ %sub9, %cond.false ]
  store float %cond, float* %smax, align 4
  %13 = load i32, i32* %incx.addr, align 4
  %14 = load float*, float** %sx.addr, align 8
  %idx.ext10 = sext i32 %13 to i64
  %add.ptr11 = getelementptr inbounds float, float* %14, i64 %idx.ext10
  store float* %add.ptr11, float** %sx.addr, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %15 = load i32, i32* %i, align 4
  %16 = load i32, i32* %n.addr, align 4
  %cmp12 = icmp slt i32 %15, %16
  br i1 %cmp12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %17 = load float*, float** %sx.addr, align 8
  %18 = load float, float* %17, align 4
  %conv14 = fpext float %18 to double
  %cmp15 = fcmp ogt double %conv14, 0.000000e+00
  br i1 %cmp15, label %cond.true17, label %cond.false18

cond.true17:                                      ; preds = %for.body
  %19 = load float*, float** %sx.addr, align 8
  %20 = load float, float* %19, align 4
  br label %cond.end20

cond.false18:                                     ; preds = %for.body
  %21 = load float*, float** %sx.addr, align 8
  %22 = load float, float* %21, align 4
  %sub19 = fsub float -0.000000e+00, %22
  br label %cond.end20

cond.end20:                                       ; preds = %cond.false18, %cond.true17
  %cond21 = phi float [ %20, %cond.true17 ], [ %sub19, %cond.false18 ]
  %23 = load float, float* %smax, align 4
  %cmp22 = fcmp ogt float %cond21, %23
  br i1 %cmp22, label %if.then24, label %if.end33

if.then24:                                        ; preds = %cond.end20
  %24 = load i32, i32* %i, align 4
  store i32 %24, i32* %istmp, align 4
  %25 = load float*, float** %sx.addr, align 8
  %26 = load float, float* %25, align 4
  %conv25 = fpext float %26 to double
  %cmp26 = fcmp ogt double %conv25, 0.000000e+00
  br i1 %cmp26, label %cond.true28, label %cond.false29

cond.true28:                                      ; preds = %if.then24
  %27 = load float*, float** %sx.addr, align 8
  %28 = load float, float* %27, align 4
  br label %cond.end31

cond.false29:                                     ; preds = %if.then24
  %29 = load float*, float** %sx.addr, align 8
  %30 = load float, float* %29, align 4
  %sub30 = fsub float -0.000000e+00, %30
  br label %cond.end31

cond.end31:                                       ; preds = %cond.false29, %cond.true28
  %cond32 = phi float [ %28, %cond.true28 ], [ %sub30, %cond.false29 ]
  store float %cond32, float* %smax, align 4
  br label %if.end33

if.end33:                                         ; preds = %cond.end31, %cond.end20
  br label %for.inc

for.inc:                                          ; preds = %if.end33
  %31 = load i32, i32* %i, align 4
  %inc = add nsw i32 %31, 1
  store i32 %inc, i32* %i, align 4
  %32 = load i32, i32* %incx.addr, align 4
  %33 = load float*, float** %sx.addr, align 8
  %idx.ext34 = sext i32 %32 to i64
  %add.ptr35 = getelementptr inbounds float, float* %33, i64 %idx.ext34
  store float* %add.ptr35, float** %sx.addr, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %34 = load i32, i32* %istmp, align 4
  store i32 %34, i32* %retval, align 4
  br label %return

if.end36:                                         ; preds = %if.end
  store i32 0, i32* %istmp, align 4
  %35 = load float*, float** %sx.addr, align 8
  %36 = load float, float* %35, align 4
  %conv37 = fpext float %36 to double
  %cmp38 = fcmp ogt double %conv37, 0.000000e+00
  br i1 %cmp38, label %cond.true40, label %cond.false41

cond.true40:                                      ; preds = %if.end36
  %37 = load float*, float** %sx.addr, align 8
  %38 = load float, float* %37, align 4
  br label %cond.end43

cond.false41:                                     ; preds = %if.end36
  %39 = load float*, float** %sx.addr, align 8
  %40 = load float, float* %39, align 4
  %sub42 = fsub float -0.000000e+00, %40
  br label %cond.end43

cond.end43:                                       ; preds = %cond.false41, %cond.true40
  %cond44 = phi float [ %38, %cond.true40 ], [ %sub42, %cond.false41 ]
  store float %cond44, float* %smax, align 4
  %41 = load float*, float** %sx.addr, align 8
  %incdec.ptr = getelementptr inbounds float, float* %41, i32 1
  store float* %incdec.ptr, float** %sx.addr, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond45

for.cond45:                                       ; preds = %for.inc69, %cond.end43
  %42 = load i32, i32* %i, align 4
  %43 = load i32, i32* %n.addr, align 4
  %cmp46 = icmp slt i32 %42, %43
  br i1 %cmp46, label %for.body48, label %for.end72

for.body48:                                       ; preds = %for.cond45
  %44 = load float*, float** %sx.addr, align 8
  %45 = load float, float* %44, align 4
  %conv49 = fpext float %45 to double
  %cmp50 = fcmp ogt double %conv49, 0.000000e+00
  br i1 %cmp50, label %cond.true52, label %cond.false53

cond.true52:                                      ; preds = %for.body48
  %46 = load float*, float** %sx.addr, align 8
  %47 = load float, float* %46, align 4
  br label %cond.end55

cond.false53:                                     ; preds = %for.body48
  %48 = load float*, float** %sx.addr, align 8
  %49 = load float, float* %48, align 4
  %sub54 = fsub float -0.000000e+00, %49
  br label %cond.end55

cond.end55:                                       ; preds = %cond.false53, %cond.true52
  %cond56 = phi float [ %47, %cond.true52 ], [ %sub54, %cond.false53 ]
  %50 = load float, float* %smax, align 4
  %cmp57 = fcmp ogt float %cond56, %50
  br i1 %cmp57, label %if.then59, label %if.end68

if.then59:                                        ; preds = %cond.end55
  %51 = load i32, i32* %i, align 4
  store i32 %51, i32* %istmp, align 4
  %52 = load float*, float** %sx.addr, align 8
  %53 = load float, float* %52, align 4
  %conv60 = fpext float %53 to double
  %cmp61 = fcmp ogt double %conv60, 0.000000e+00
  br i1 %cmp61, label %cond.true63, label %cond.false64

cond.true63:                                      ; preds = %if.then59
  %54 = load float*, float** %sx.addr, align 8
  %55 = load float, float* %54, align 4
  br label %cond.end66

cond.false64:                                     ; preds = %if.then59
  %56 = load float*, float** %sx.addr, align 8
  %57 = load float, float* %56, align 4
  %sub65 = fsub float -0.000000e+00, %57
  br label %cond.end66

cond.end66:                                       ; preds = %cond.false64, %cond.true63
  %cond67 = phi float [ %55, %cond.true63 ], [ %sub65, %cond.false64 ]
  store float %cond67, float* %smax, align 4
  br label %if.end68

if.end68:                                         ; preds = %cond.end66, %cond.end55
  br label %for.inc69

for.inc69:                                        ; preds = %if.end68
  %58 = load i32, i32* %i, align 4
  %inc70 = add nsw i32 %58, 1
  store i32 %inc70, i32* %i, align 4
  %59 = load float*, float** %sx.addr, align 8
  %incdec.ptr71 = getelementptr inbounds float, float* %59, i32 1
  store float* %incdec.ptr71, float** %sx.addr, align 8
  br label %for.cond45

for.end72:                                        ; preds = %for.cond45
  %60 = load i32, i32* %istmp, align 4
  store i32 %60, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end72, %for.end, %if.then
  %61 = load i32, i32* %retval, align 4
  ret i32 %61
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @saxpy(i32 %n, double, float* %sx, i32 %incx, float* %sy, i32 %incy) #0 {
entry:
  %n.addr = alloca i32, align 4
  %sa.addr = alloca float, align 4
  %sx.addr = alloca float*, align 8
  %incx.addr = alloca i32, align 4
  %sy.addr = alloca float*, align 8
  %incy.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %sa = fptrunc double %0 to float
  store i32 %n, i32* %n.addr, align 4
  store float %sa, float* %sa.addr, align 4
  store float* %sx, float** %sx.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store float* %sy, float** %sy.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp sle i32 %1, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load float, float* %sa.addr, align 4
  %conv = fpext float %2 to double
  %cmp1 = fcmp oeq double %conv, 0.000000e+00
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %for.end60

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i32, i32* %incx.addr, align 4
  %4 = load i32, i32* %incy.addr, align 4
  %cmp3 = icmp eq i32 %3, %4
  br i1 %cmp3, label %if.then5, label %if.end28

if.then5:                                         ; preds = %if.end
  %5 = load i32, i32* %incx.addr, align 4
  %cmp6 = icmp eq i32 %5, 1
  br i1 %cmp6, label %if.then8, label %if.end12

if.then8:                                         ; preds = %if.then5
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then8
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %n.addr, align 4
  %cmp9 = icmp slt i32 %6, %7
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load float, float* %sa.addr, align 4
  %9 = load float*, float** %sx.addr, align 8
  %10 = load float, float* %9, align 4
  %mul = fmul float %8, %10
  %11 = load float*, float** %sy.addr, align 8
  %12 = load float, float* %11, align 4
  %add = fadd float %12, %mul
  store float %add, float* %11, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  %14 = load float*, float** %sy.addr, align 8
  %incdec.ptr = getelementptr inbounds float, float* %14, i32 1
  store float* %incdec.ptr, float** %sy.addr, align 8
  %15 = load float*, float** %sx.addr, align 8
  %incdec.ptr11 = getelementptr inbounds float, float* %15, i32 1
  store float* %incdec.ptr11, float** %sx.addr, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %for.end60

if.end12:                                         ; preds = %if.then5
  %16 = load i32, i32* %incx.addr, align 4
  %cmp13 = icmp sgt i32 %16, 0
  br i1 %cmp13, label %if.then15, label %if.end27

if.then15:                                        ; preds = %if.end12
  store i32 0, i32* %i, align 4
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc22, %if.then15
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* %n.addr, align 4
  %cmp17 = icmp slt i32 %17, %18
  br i1 %cmp17, label %for.body19, label %for.end26

for.body19:                                       ; preds = %for.cond16
  %19 = load float, float* %sa.addr, align 4
  %20 = load float*, float** %sx.addr, align 8
  %21 = load float, float* %20, align 4
  %mul20 = fmul float %19, %21
  %22 = load float*, float** %sy.addr, align 8
  %23 = load float, float* %22, align 4
  %add21 = fadd float %23, %mul20
  store float %add21, float* %22, align 4
  br label %for.inc22

for.inc22:                                        ; preds = %for.body19
  %24 = load i32, i32* %i, align 4
  %inc23 = add nsw i32 %24, 1
  store i32 %inc23, i32* %i, align 4
  %25 = load i32, i32* %incx.addr, align 4
  %26 = load float*, float** %sx.addr, align 8
  %idx.ext = sext i32 %25 to i64
  %add.ptr = getelementptr inbounds float, float* %26, i64 %idx.ext
  store float* %add.ptr, float** %sx.addr, align 8
  %27 = load i32, i32* %incx.addr, align 4
  %28 = load float*, float** %sy.addr, align 8
  %idx.ext24 = sext i32 %27 to i64
  %add.ptr25 = getelementptr inbounds float, float* %28, i64 %idx.ext24
  store float* %add.ptr25, float** %sy.addr, align 8
  br label %for.cond16

for.end26:                                        ; preds = %for.cond16
  br label %for.end60

if.end27:                                         ; preds = %if.end12
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.end
  %29 = load i32, i32* %incx.addr, align 4
  %cmp29 = icmp slt i32 %29, 0
  br i1 %cmp29, label %if.then31, label %if.end37

if.then31:                                        ; preds = %if.end28
  %30 = load i32, i32* %n.addr, align 4
  %sub = sub nsw i32 0, %30
  %add32 = add nsw i32 %sub, 1
  %31 = load i32, i32* %incx.addr, align 4
  %mul33 = mul nsw i32 %add32, %31
  %add34 = add nsw i32 %mul33, 1
  %32 = load float*, float** %sx.addr, align 8
  %idx.ext35 = sext i32 %add34 to i64
  %add.ptr36 = getelementptr inbounds float, float* %32, i64 %idx.ext35
  store float* %add.ptr36, float** %sx.addr, align 8
  br label %if.end37

if.end37:                                         ; preds = %if.then31, %if.end28
  %33 = load i32, i32* %incy.addr, align 4
  %cmp38 = icmp slt i32 %33, 0
  br i1 %cmp38, label %if.then40, label %if.end47

if.then40:                                        ; preds = %if.end37
  %34 = load i32, i32* %n.addr, align 4
  %sub41 = sub nsw i32 0, %34
  %add42 = add nsw i32 %sub41, 1
  %35 = load i32, i32* %incy.addr, align 4
  %mul43 = mul nsw i32 %add42, %35
  %add44 = add nsw i32 %mul43, 1
  %36 = load float*, float** %sy.addr, align 8
  %idx.ext45 = sext i32 %add44 to i64
  %add.ptr46 = getelementptr inbounds float, float* %36, i64 %idx.ext45
  store float* %add.ptr46, float** %sy.addr, align 8
  br label %if.end47

if.end47:                                         ; preds = %if.then40, %if.end37
  store i32 0, i32* %i, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc54, %if.end47
  %37 = load i32, i32* %i, align 4
  %38 = load i32, i32* %n.addr, align 4
  %cmp49 = icmp slt i32 %37, %38
  br i1 %cmp49, label %for.body51, label %for.end60

for.body51:                                       ; preds = %for.cond48
  %39 = load float, float* %sa.addr, align 4
  %40 = load float*, float** %sx.addr, align 8
  %41 = load float, float* %40, align 4
  %mul52 = fmul float %39, %41
  %42 = load float*, float** %sy.addr, align 8
  %43 = load float, float* %42, align 4
  %add53 = fadd float %43, %mul52
  store float %add53, float* %42, align 4
  br label %for.inc54

for.inc54:                                        ; preds = %for.body51
  %44 = load i32, i32* %i, align 4
  %inc55 = add nsw i32 %44, 1
  store i32 %inc55, i32* %i, align 4
  %45 = load i32, i32* %incx.addr, align 4
  %46 = load float*, float** %sx.addr, align 8
  %idx.ext56 = sext i32 %45 to i64
  %add.ptr57 = getelementptr inbounds float, float* %46, i64 %idx.ext56
  store float* %add.ptr57, float** %sx.addr, align 8
  %47 = load i32, i32* %incy.addr, align 4
  %48 = load float*, float** %sy.addr, align 8
  %idx.ext58 = sext i32 %47 to i64
  %add.ptr59 = getelementptr inbounds float, float* %48, i64 %idx.ext58
  store float* %add.ptr59, float** %sy.addr, align 8
  br label %for.cond48

for.end60:                                        ; preds = %for.cond48, %for.end26, %for.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @saxpyx(i32 %n, double, float* %sx, i32 %incx, float* %sy, i32 %incy) #0 {
entry:
  %n.addr = alloca i32, align 4
  %sa.addr = alloca float, align 4
  %sx.addr = alloca float*, align 8
  %incx.addr = alloca i32, align 4
  %sy.addr = alloca float*, align 8
  %incy.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %sa = fptrunc double %0 to float
  store i32 %n, i32* %n.addr, align 4
  store float %sa, float* %sa.addr, align 4
  store float* %sx, float** %sx.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store float* %sy, float** %sy.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp sle i32 %1, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load float, float* %sa.addr, align 4
  %conv = fpext float %2 to double
  %cmp1 = fcmp oeq double %conv, 0.000000e+00
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %for.end60

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i32, i32* %incx.addr, align 4
  %4 = load i32, i32* %incy.addr, align 4
  %cmp3 = icmp eq i32 %3, %4
  br i1 %cmp3, label %if.then5, label %if.end28

if.then5:                                         ; preds = %if.end
  %5 = load i32, i32* %incx.addr, align 4
  %cmp6 = icmp eq i32 %5, 1
  br i1 %cmp6, label %if.then8, label %if.end12

if.then8:                                         ; preds = %if.then5
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then8
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %n.addr, align 4
  %cmp9 = icmp slt i32 %6, %7
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load float*, float** %sy.addr, align 8
  %9 = load float, float* %8, align 4
  %10 = load float, float* %sa.addr, align 4
  %11 = load float*, float** %sx.addr, align 8
  %12 = load float, float* %11, align 4
  %mul = fmul float %10, %12
  %add = fadd float %9, %mul
  %13 = load float*, float** %sx.addr, align 8
  store float %add, float* %13, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  %15 = load float*, float** %sx.addr, align 8
  %incdec.ptr = getelementptr inbounds float, float* %15, i32 1
  store float* %incdec.ptr, float** %sx.addr, align 8
  %16 = load float*, float** %sy.addr, align 8
  %incdec.ptr11 = getelementptr inbounds float, float* %16, i32 1
  store float* %incdec.ptr11, float** %sy.addr, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %for.end60

if.end12:                                         ; preds = %if.then5
  %17 = load i32, i32* %incx.addr, align 4
  %cmp13 = icmp sgt i32 %17, 0
  br i1 %cmp13, label %if.then15, label %if.end27

if.then15:                                        ; preds = %if.end12
  store i32 0, i32* %i, align 4
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc22, %if.then15
  %18 = load i32, i32* %i, align 4
  %19 = load i32, i32* %n.addr, align 4
  %cmp17 = icmp slt i32 %18, %19
  br i1 %cmp17, label %for.body19, label %for.end26

for.body19:                                       ; preds = %for.cond16
  %20 = load float*, float** %sy.addr, align 8
  %21 = load float, float* %20, align 4
  %22 = load float, float* %sa.addr, align 4
  %23 = load float*, float** %sx.addr, align 8
  %24 = load float, float* %23, align 4
  %mul20 = fmul float %22, %24
  %add21 = fadd float %21, %mul20
  %25 = load float*, float** %sx.addr, align 8
  store float %add21, float* %25, align 4
  br label %for.inc22

for.inc22:                                        ; preds = %for.body19
  %26 = load i32, i32* %i, align 4
  %inc23 = add nsw i32 %26, 1
  store i32 %inc23, i32* %i, align 4
  %27 = load i32, i32* %incx.addr, align 4
  %28 = load float*, float** %sx.addr, align 8
  %idx.ext = sext i32 %27 to i64
  %add.ptr = getelementptr inbounds float, float* %28, i64 %idx.ext
  store float* %add.ptr, float** %sx.addr, align 8
  %29 = load i32, i32* %incx.addr, align 4
  %30 = load float*, float** %sy.addr, align 8
  %idx.ext24 = sext i32 %29 to i64
  %add.ptr25 = getelementptr inbounds float, float* %30, i64 %idx.ext24
  store float* %add.ptr25, float** %sy.addr, align 8
  br label %for.cond16

for.end26:                                        ; preds = %for.cond16
  br label %for.end60

if.end27:                                         ; preds = %if.end12
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.end
  %31 = load i32, i32* %incx.addr, align 4
  %cmp29 = icmp slt i32 %31, 0
  br i1 %cmp29, label %if.then31, label %if.end37

if.then31:                                        ; preds = %if.end28
  %32 = load i32, i32* %n.addr, align 4
  %sub = sub nsw i32 0, %32
  %add32 = add nsw i32 %sub, 1
  %33 = load i32, i32* %incx.addr, align 4
  %mul33 = mul nsw i32 %add32, %33
  %add34 = add nsw i32 %mul33, 1
  %34 = load float*, float** %sx.addr, align 8
  %idx.ext35 = sext i32 %add34 to i64
  %add.ptr36 = getelementptr inbounds float, float* %34, i64 %idx.ext35
  store float* %add.ptr36, float** %sx.addr, align 8
  br label %if.end37

if.end37:                                         ; preds = %if.then31, %if.end28
  %35 = load i32, i32* %incy.addr, align 4
  %cmp38 = icmp slt i32 %35, 0
  br i1 %cmp38, label %if.then40, label %if.end47

if.then40:                                        ; preds = %if.end37
  %36 = load i32, i32* %n.addr, align 4
  %sub41 = sub nsw i32 0, %36
  %add42 = add nsw i32 %sub41, 1
  %37 = load i32, i32* %incy.addr, align 4
  %mul43 = mul nsw i32 %add42, %37
  %add44 = add nsw i32 %mul43, 1
  %38 = load float*, float** %sy.addr, align 8
  %idx.ext45 = sext i32 %add44 to i64
  %add.ptr46 = getelementptr inbounds float, float* %38, i64 %idx.ext45
  store float* %add.ptr46, float** %sy.addr, align 8
  br label %if.end47

if.end47:                                         ; preds = %if.then40, %if.end37
  store i32 0, i32* %i, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc54, %if.end47
  %39 = load i32, i32* %i, align 4
  %40 = load i32, i32* %n.addr, align 4
  %cmp49 = icmp slt i32 %39, %40
  br i1 %cmp49, label %for.body51, label %for.end60

for.body51:                                       ; preds = %for.cond48
  %41 = load float*, float** %sy.addr, align 8
  %42 = load float, float* %41, align 4
  %43 = load float, float* %sa.addr, align 4
  %44 = load float*, float** %sx.addr, align 8
  %45 = load float, float* %44, align 4
  %mul52 = fmul float %43, %45
  %add53 = fadd float %42, %mul52
  %46 = load float*, float** %sx.addr, align 8
  store float %add53, float* %46, align 4
  br label %for.inc54

for.inc54:                                        ; preds = %for.body51
  %47 = load i32, i32* %i, align 4
  %inc55 = add nsw i32 %47, 1
  store i32 %inc55, i32* %i, align 4
  %48 = load i32, i32* %incx.addr, align 4
  %49 = load float*, float** %sx.addr, align 8
  %idx.ext56 = sext i32 %48 to i64
  %add.ptr57 = getelementptr inbounds float, float* %49, i64 %idx.ext56
  store float* %add.ptr57, float** %sx.addr, align 8
  %50 = load i32, i32* %incy.addr, align 4
  %51 = load float*, float** %sy.addr, align 8
  %idx.ext58 = sext i32 %50 to i64
  %add.ptr59 = getelementptr inbounds float, float* %51, i64 %idx.ext58
  store float* %add.ptr59, float** %sy.addr, align 8
  br label %for.cond48

for.end60:                                        ; preds = %for.cond48, %for.end26, %for.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @scopy(i32 %n, float* %sx, i32 %incx, float* %sy, i32 %incy) #0 {
entry:
  %n.addr = alloca i32, align 4
  %sx.addr = alloca float*, align 8
  %incx.addr = alloca i32, align 4
  %sy.addr = alloca float*, align 8
  %incy.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store float* %sx, float** %sx.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store float* %sy, float** %sy.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %incx.addr, align 4
  %2 = load i32, i32* %incy.addr, align 4
  %cmp1 = icmp eq i32 %1, %2
  br i1 %cmp1, label %if.then2, label %if.end19

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %incx.addr, align 4
  %cmp3 = icmp eq i32 %3, 1
  br i1 %cmp3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.then2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then4
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %n.addr, align 4
  %cmp5 = icmp slt i32 %4, %5
  br i1 %cmp5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load float*, float** %sx.addr, align 8
  %incdec.ptr = getelementptr inbounds float, float* %6, i32 1
  store float* %incdec.ptr, float** %sx.addr, align 8
  %7 = load float, float* %6, align 4
  %8 = load float*, float** %sy.addr, align 8
  %incdec.ptr6 = getelementptr inbounds float, float* %8, i32 1
  store float* %incdec.ptr6, float** %sy.addr, align 8
  store float %7, float* %8, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %return

if.end7:                                          ; preds = %if.then2
  %10 = load i32, i32* %incx.addr, align 4
  %cmp8 = icmp sgt i32 %10, 0
  br i1 %cmp8, label %if.then9, label %if.end18

if.then9:                                         ; preds = %if.end7
  store i32 0, i32* %i, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc13, %if.then9
  %11 = load i32, i32* %i, align 4
  %12 = load i32, i32* %n.addr, align 4
  %cmp11 = icmp slt i32 %11, %12
  br i1 %cmp11, label %for.body12, label %for.end17

for.body12:                                       ; preds = %for.cond10
  %13 = load float*, float** %sx.addr, align 8
  %14 = load float, float* %13, align 4
  %15 = load float*, float** %sy.addr, align 8
  store float %14, float* %15, align 4
  br label %for.inc13

for.inc13:                                        ; preds = %for.body12
  %16 = load i32, i32* %i, align 4
  %inc14 = add nsw i32 %16, 1
  store i32 %inc14, i32* %i, align 4
  %17 = load i32, i32* %incx.addr, align 4
  %18 = load float*, float** %sx.addr, align 8
  %idx.ext = sext i32 %17 to i64
  %add.ptr = getelementptr inbounds float, float* %18, i64 %idx.ext
  store float* %add.ptr, float** %sx.addr, align 8
  %19 = load i32, i32* %incx.addr, align 4
  %20 = load float*, float** %sy.addr, align 8
  %idx.ext15 = sext i32 %19 to i64
  %add.ptr16 = getelementptr inbounds float, float* %20, i64 %idx.ext15
  store float* %add.ptr16, float** %sy.addr, align 8
  br label %for.cond10

for.end17:                                        ; preds = %for.cond10
  br label %return

if.end18:                                         ; preds = %if.end7
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.end
  %21 = load i32, i32* %incx.addr, align 4
  %cmp20 = icmp slt i32 %21, 0
  br i1 %cmp20, label %if.then21, label %if.end25

if.then21:                                        ; preds = %if.end19
  %22 = load i32, i32* %n.addr, align 4
  %sub = sub nsw i32 0, %22
  %add = add nsw i32 %sub, 1
  %23 = load i32, i32* %incx.addr, align 4
  %mul = mul nsw i32 %add, %23
  %add22 = add nsw i32 %mul, 1
  %24 = load float*, float** %sx.addr, align 8
  %idx.ext23 = sext i32 %add22 to i64
  %add.ptr24 = getelementptr inbounds float, float* %24, i64 %idx.ext23
  store float* %add.ptr24, float** %sx.addr, align 8
  br label %if.end25

if.end25:                                         ; preds = %if.then21, %if.end19
  %25 = load i32, i32* %incy.addr, align 4
  %cmp26 = icmp slt i32 %25, 0
  br i1 %cmp26, label %if.then27, label %if.end34

if.then27:                                        ; preds = %if.end25
  %26 = load i32, i32* %n.addr, align 4
  %sub28 = sub nsw i32 0, %26
  %add29 = add nsw i32 %sub28, 1
  %27 = load i32, i32* %incy.addr, align 4
  %mul30 = mul nsw i32 %add29, %27
  %add31 = add nsw i32 %mul30, 1
  %28 = load float*, float** %sy.addr, align 8
  %idx.ext32 = sext i32 %add31 to i64
  %add.ptr33 = getelementptr inbounds float, float* %28, i64 %idx.ext32
  store float* %add.ptr33, float** %sy.addr, align 8
  br label %if.end34

if.end34:                                         ; preds = %if.then27, %if.end25
  store i32 0, i32* %i, align 4
  br label %for.cond35

for.cond35:                                       ; preds = %for.inc38, %if.end34
  %29 = load i32, i32* %i, align 4
  %30 = load i32, i32* %n.addr, align 4
  %cmp36 = icmp slt i32 %29, %30
  br i1 %cmp36, label %for.body37, label %for.end44

for.body37:                                       ; preds = %for.cond35
  %31 = load float*, float** %sy.addr, align 8
  %32 = load float, float* %31, align 4
  %33 = load float*, float** %sx.addr, align 8
  store float %32, float* %33, align 4
  br label %for.inc38

for.inc38:                                        ; preds = %for.body37
  %34 = load i32, i32* %i, align 4
  %inc39 = add nsw i32 %34, 1
  store i32 %inc39, i32* %i, align 4
  %35 = load i32, i32* %incx.addr, align 4
  %36 = load float*, float** %sx.addr, align 8
  %idx.ext40 = sext i32 %35 to i64
  %add.ptr41 = getelementptr inbounds float, float* %36, i64 %idx.ext40
  store float* %add.ptr41, float** %sx.addr, align 8
  %37 = load i32, i32* %incy.addr, align 4
  %38 = load float*, float** %sy.addr, align 8
  %idx.ext42 = sext i32 %37 to i64
  %add.ptr43 = getelementptr inbounds float, float* %38, i64 %idx.ext42
  store float* %add.ptr43, float** %sy.addr, align 8
  br label %for.cond35

for.end44:                                        ; preds = %for.cond35
  br label %return

return:                                           ; preds = %for.end44, %for.end17, %for.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @sdot(i32 %n, float* %sx, i32 %incx, float* %sy, i32 %incy) #0 {
entry:
  %retval = alloca double, align 8
  %n.addr = alloca i32, align 4
  %sx.addr = alloca float*, align 8
  %incx.addr = alloca i32, align 4
  %sy.addr = alloca float*, align 8
  %incy.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %stemp = alloca float, align 4
  store i32 %n, i32* %n.addr, align 4
  store float* %sx, float** %sx.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store float* %sy, float** %sy.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store float 0.000000e+00, float* %stemp, align 4
  %0 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load float, float* %stemp, align 4
  %conv = fpext float %1 to double
  store double %conv, double* %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %incx.addr, align 4
  %3 = load i32, i32* %incy.addr, align 4
  %cmp1 = icmp eq i32 %2, %3
  br i1 %cmp1, label %if.then3, label %if.end28

if.then3:                                         ; preds = %if.end
  %4 = load i32, i32* %incx.addr, align 4
  %cmp4 = icmp eq i32 %4, 1
  br i1 %cmp4, label %if.then6, label %if.end11

if.then6:                                         ; preds = %if.then3
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then6
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %n.addr, align 4
  %cmp7 = icmp slt i32 %5, %6
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load float*, float** %sx.addr, align 8
  %8 = load float, float* %7, align 4
  %9 = load float*, float** %sy.addr, align 8
  %10 = load float, float* %9, align 4
  %mul = fmul float %8, %10
  %11 = load float, float* %stemp, align 4
  %add = fadd float %11, %mul
  store float %add, float* %stemp, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  %13 = load float*, float** %sx.addr, align 8
  %incdec.ptr = getelementptr inbounds float, float* %13, i32 1
  store float* %incdec.ptr, float** %sx.addr, align 8
  %14 = load float*, float** %sy.addr, align 8
  %incdec.ptr9 = getelementptr inbounds float, float* %14, i32 1
  store float* %incdec.ptr9, float** %sy.addr, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load float, float* %stemp, align 4
  %conv10 = fpext float %15 to double
  store double %conv10, double* %retval, align 8
  br label %return

if.end11:                                         ; preds = %if.then3
  %16 = load i32, i32* %incx.addr, align 4
  %cmp12 = icmp sgt i32 %16, 0
  br i1 %cmp12, label %if.then14, label %if.end27

if.then14:                                        ; preds = %if.end11
  store i32 0, i32* %i, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc21, %if.then14
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* %n.addr, align 4
  %cmp16 = icmp slt i32 %17, %18
  br i1 %cmp16, label %for.body18, label %for.end25

for.body18:                                       ; preds = %for.cond15
  %19 = load float*, float** %sx.addr, align 8
  %20 = load float, float* %19, align 4
  %21 = load float*, float** %sy.addr, align 8
  %22 = load float, float* %21, align 4
  %mul19 = fmul float %20, %22
  %23 = load float, float* %stemp, align 4
  %add20 = fadd float %23, %mul19
  store float %add20, float* %stemp, align 4
  br label %for.inc21

for.inc21:                                        ; preds = %for.body18
  %24 = load i32, i32* %i, align 4
  %inc22 = add nsw i32 %24, 1
  store i32 %inc22, i32* %i, align 4
  %25 = load i32, i32* %incx.addr, align 4
  %26 = load float*, float** %sx.addr, align 8
  %idx.ext = sext i32 %25 to i64
  %add.ptr = getelementptr inbounds float, float* %26, i64 %idx.ext
  store float* %add.ptr, float** %sx.addr, align 8
  %27 = load i32, i32* %incx.addr, align 4
  %28 = load float*, float** %sy.addr, align 8
  %idx.ext23 = sext i32 %27 to i64
  %add.ptr24 = getelementptr inbounds float, float* %28, i64 %idx.ext23
  store float* %add.ptr24, float** %sy.addr, align 8
  br label %for.cond15

for.end25:                                        ; preds = %for.cond15
  %29 = load float, float* %stemp, align 4
  %conv26 = fpext float %29 to double
  store double %conv26, double* %retval, align 8
  br label %return

if.end27:                                         ; preds = %if.end11
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.end
  %30 = load i32, i32* %incx.addr, align 4
  %cmp29 = icmp slt i32 %30, 0
  br i1 %cmp29, label %if.then31, label %if.end37

if.then31:                                        ; preds = %if.end28
  %31 = load i32, i32* %n.addr, align 4
  %sub = sub nsw i32 0, %31
  %add32 = add nsw i32 %sub, 1
  %32 = load i32, i32* %incx.addr, align 4
  %mul33 = mul nsw i32 %add32, %32
  %add34 = add nsw i32 %mul33, 1
  %33 = load float*, float** %sx.addr, align 8
  %idx.ext35 = sext i32 %add34 to i64
  %add.ptr36 = getelementptr inbounds float, float* %33, i64 %idx.ext35
  store float* %add.ptr36, float** %sx.addr, align 8
  br label %if.end37

if.end37:                                         ; preds = %if.then31, %if.end28
  %34 = load i32, i32* %incy.addr, align 4
  %cmp38 = icmp slt i32 %34, 0
  br i1 %cmp38, label %if.then40, label %if.end47

if.then40:                                        ; preds = %if.end37
  %35 = load i32, i32* %n.addr, align 4
  %sub41 = sub nsw i32 0, %35
  %add42 = add nsw i32 %sub41, 1
  %36 = load i32, i32* %incy.addr, align 4
  %mul43 = mul nsw i32 %add42, %36
  %add44 = add nsw i32 %mul43, 1
  %37 = load float*, float** %sy.addr, align 8
  %idx.ext45 = sext i32 %add44 to i64
  %add.ptr46 = getelementptr inbounds float, float* %37, i64 %idx.ext45
  store float* %add.ptr46, float** %sy.addr, align 8
  br label %if.end47

if.end47:                                         ; preds = %if.then40, %if.end37
  store i32 0, i32* %i, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc54, %if.end47
  %38 = load i32, i32* %i, align 4
  %39 = load i32, i32* %n.addr, align 4
  %cmp49 = icmp slt i32 %38, %39
  br i1 %cmp49, label %for.body51, label %for.end60

for.body51:                                       ; preds = %for.cond48
  %40 = load float*, float** %sx.addr, align 8
  %41 = load float, float* %40, align 4
  %42 = load float*, float** %sy.addr, align 8
  %43 = load float, float* %42, align 4
  %mul52 = fmul float %41, %43
  %44 = load float, float* %stemp, align 4
  %add53 = fadd float %44, %mul52
  store float %add53, float* %stemp, align 4
  br label %for.inc54

for.inc54:                                        ; preds = %for.body51
  %45 = load i32, i32* %i, align 4
  %inc55 = add nsw i32 %45, 1
  store i32 %inc55, i32* %i, align 4
  %46 = load i32, i32* %incx.addr, align 4
  %47 = load float*, float** %sx.addr, align 8
  %idx.ext56 = sext i32 %46 to i64
  %add.ptr57 = getelementptr inbounds float, float* %47, i64 %idx.ext56
  store float* %add.ptr57, float** %sx.addr, align 8
  %48 = load i32, i32* %incy.addr, align 4
  %49 = load float*, float** %sy.addr, align 8
  %idx.ext58 = sext i32 %48 to i64
  %add.ptr59 = getelementptr inbounds float, float* %49, i64 %idx.ext58
  store float* %add.ptr59, float** %sy.addr, align 8
  br label %for.cond48

for.end60:                                        ; preds = %for.cond48
  %50 = load float, float* %stemp, align 4
  %conv61 = fpext float %50 to double
  store double %conv61, double* %retval, align 8
  br label %return

return:                                           ; preds = %for.end60, %for.end25, %for.end, %if.then
  %51 = load double, double* %retval, align 8
  ret double %51
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @snrm2(i32 %n, float* %sx, i32 %incx) #0 {
entry:
  %retval = alloca double, align 8
  %n.addr = alloca i32, align 4
  %sx.addr = alloca float*, align 8
  %incx.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %phase = alloca i32, align 4
  %sum = alloca double, align 8
  %cutlo = alloca double, align 8
  %cuthi = alloca double, align 8
  %hitst = alloca double, align 8
  %xmax = alloca float, align 4
  store i32 %n, i32* %n.addr, align 4
  store float* %sx, float** %sx.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i32 3, i32* %phase, align 4
  store double 0.000000e+00, double* %sum, align 8
  %0 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %incx.addr, align 4
  %cmp1 = icmp slt i32 %1, 1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load double, double* %sum, align 8
  store double %2, double* %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %call = call double @r1mach()
  %div = fdiv double 0x3696D601AD376AB9, %call
  %call2 = call double @sqrt(double %div) #4
  store double %call2, double* %cutlo, align 8
  %call3 = call double @sqrt(double 0x47D2CED32A16A1B1) #4
  store double %call3, double* %cuthi, align 8
  %3 = load double, double* %cuthi, align 8
  %4 = load i32, i32* %n.addr, align 4
  %conv = sitofp i32 %4 to double
  %div4 = fdiv double %3, %conv
  store double %div4, double* %hitst, align 8
  store i32 0, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %n.addr, align 4
  %cmp5 = icmp slt i32 %5, %6
  br i1 %cmp5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %7 = load float*, float** %sx.addr, align 8
  %8 = load float, float* %7, align 4
  %conv7 = fpext float %8 to double
  %cmp8 = fcmp oeq double %conv7, 0.000000e+00
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %9 = phi i1 [ false, %while.cond ], [ %cmp8, %land.rhs ]
  br i1 %9, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  %11 = load i32, i32* %incx.addr, align 4
  %12 = load float*, float** %sx.addr, align 8
  %idx.ext = sext i32 %11 to i64
  %add.ptr = getelementptr inbounds float, float* %12, i64 %idx.ext
  store float* %add.ptr, float** %sx.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  %13 = load i32, i32* %i, align 4
  %14 = load i32, i32* %n.addr, align 4
  %cmp10 = icmp sge i32 %13, %14
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %while.end
  %15 = load double, double* %sum, align 8
  store double %15, double* %retval, align 8
  br label %return

if.end13:                                         ; preds = %while.end
  br label %START

START:                                            ; preds = %if.then68, %if.end13
  %16 = load float*, float** %sx.addr, align 8
  %17 = load float, float* %16, align 4
  %conv14 = fpext float %17 to double
  %cmp15 = fcmp ogt double %conv14, 0.000000e+00
  br i1 %cmp15, label %cond.true, label %cond.false

cond.true:                                        ; preds = %START
  %18 = load float*, float** %sx.addr, align 8
  %19 = load float, float* %18, align 4
  br label %cond.end

cond.false:                                       ; preds = %START
  %20 = load float*, float** %sx.addr, align 8
  %21 = load float, float* %20, align 4
  %sub = fsub float -0.000000e+00, %21
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi float [ %19, %cond.true ], [ %sub, %cond.false ]
  %conv17 = fpext float %cond to double
  %22 = load double, double* %cutlo, align 8
  %cmp18 = fcmp ogt double %conv17, %22
  br i1 %cmp18, label %if.then20, label %if.else

if.then20:                                        ; preds = %cond.end
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then20
  %23 = load i32, i32* %i, align 4
  %24 = load i32, i32* %n.addr, align 4
  %cmp21 = icmp slt i32 %23, %24
  br i1 %cmp21, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %25 = load float*, float** %sx.addr, align 8
  %26 = load float, float* %25, align 4
  %conv23 = fpext float %26 to double
  %cmp24 = fcmp ogt double %conv23, 0.000000e+00
  br i1 %cmp24, label %cond.true26, label %cond.false27

cond.true26:                                      ; preds = %for.body
  %27 = load float*, float** %sx.addr, align 8
  %28 = load float, float* %27, align 4
  br label %cond.end29

cond.false27:                                     ; preds = %for.body
  %29 = load float*, float** %sx.addr, align 8
  %30 = load float, float* %29, align 4
  %sub28 = fsub float -0.000000e+00, %30
  br label %cond.end29

cond.end29:                                       ; preds = %cond.false27, %cond.true26
  %cond30 = phi float [ %28, %cond.true26 ], [ %sub28, %cond.false27 ]
  %conv31 = fpext float %cond30 to double
  %31 = load double, double* %hitst, align 8
  %cmp32 = fcmp ogt double %conv31, %31
  br i1 %cmp32, label %if.then34, label %if.end35

if.then34:                                        ; preds = %cond.end29
  br label %GOT_LARGE

if.end35:                                         ; preds = %cond.end29
  %32 = load float*, float** %sx.addr, align 8
  %33 = load float, float* %32, align 4
  %34 = load float*, float** %sx.addr, align 8
  %35 = load float, float* %34, align 4
  %mul = fmul float %33, %35
  %conv36 = fpext float %mul to double
  %36 = load double, double* %sum, align 8
  %add = fadd double %36, %conv36
  store double %add, double* %sum, align 8
  br label %for.inc

for.inc:                                          ; preds = %if.end35
  %37 = load i32, i32* %i, align 4
  %inc37 = add nsw i32 %37, 1
  store i32 %inc37, i32* %i, align 4
  %38 = load i32, i32* %incx.addr, align 4
  %39 = load float*, float** %sx.addr, align 8
  %idx.ext38 = sext i32 %38 to i64
  %add.ptr39 = getelementptr inbounds float, float* %39, i64 %idx.ext38
  store float* %add.ptr39, float** %sx.addr, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %40 = load double, double* %sum, align 8
  %call40 = call double @sqrt(double %40) #4
  store double %call40, double* %sum, align 8
  %41 = load double, double* %sum, align 8
  store double %41, double* %retval, align 8
  br label %return

if.else:                                          ; preds = %cond.end
  %42 = load float*, float** %sx.addr, align 8
  %43 = load float, float* %42, align 4
  %conv41 = fpext float %43 to double
  %cmp42 = fcmp ogt double %conv41, 0.000000e+00
  br i1 %cmp42, label %cond.true44, label %cond.false45

cond.true44:                                      ; preds = %if.else
  %44 = load float*, float** %sx.addr, align 8
  %45 = load float, float* %44, align 4
  br label %cond.end47

cond.false45:                                     ; preds = %if.else
  %46 = load float*, float** %sx.addr, align 8
  %47 = load float, float* %46, align 4
  %sub46 = fsub float -0.000000e+00, %47
  br label %cond.end47

cond.end47:                                       ; preds = %cond.false45, %cond.true44
  %cond48 = phi float [ %45, %cond.true44 ], [ %sub46, %cond.false45 ]
  store float %cond48, float* %xmax, align 4
  %48 = load i32, i32* %incx.addr, align 4
  %49 = load float*, float** %sx.addr, align 8
  %idx.ext49 = sext i32 %48 to i64
  %add.ptr50 = getelementptr inbounds float, float* %49, i64 %idx.ext49
  store float* %add.ptr50, float** %sx.addr, align 8
  %50 = load i32, i32* %i, align 4
  %inc51 = add nsw i32 %50, 1
  store i32 %inc51, i32* %i, align 4
  %51 = load double, double* %sum, align 8
  %add52 = fadd double %51, 1.000000e+00
  store double %add52, double* %sum, align 8
  br label %for.cond53

for.cond53:                                       ; preds = %for.inc106, %cond.end47
  %52 = load i32, i32* %i, align 4
  %53 = load i32, i32* %n.addr, align 4
  %cmp54 = icmp slt i32 %52, %53
  br i1 %cmp54, label %for.body56, label %for.end110

for.body56:                                       ; preds = %for.cond53
  %54 = load float*, float** %sx.addr, align 8
  %55 = load float, float* %54, align 4
  %conv57 = fpext float %55 to double
  %cmp58 = fcmp ogt double %conv57, 0.000000e+00
  br i1 %cmp58, label %cond.true60, label %cond.false61

cond.true60:                                      ; preds = %for.body56
  %56 = load float*, float** %sx.addr, align 8
  %57 = load float, float* %56, align 4
  br label %cond.end63

cond.false61:                                     ; preds = %for.body56
  %58 = load float*, float** %sx.addr, align 8
  %59 = load float, float* %58, align 4
  %sub62 = fsub float -0.000000e+00, %59
  br label %cond.end63

cond.end63:                                       ; preds = %cond.false61, %cond.true60
  %cond64 = phi float [ %57, %cond.true60 ], [ %sub62, %cond.false61 ]
  %conv65 = fpext float %cond64 to double
  %60 = load double, double* %cutlo, align 8
  %cmp66 = fcmp ogt double %conv65, %60
  br i1 %cmp66, label %if.then68, label %if.end73

if.then68:                                        ; preds = %cond.end63
  %61 = load double, double* %sum, align 8
  %62 = load float, float* %xmax, align 4
  %conv69 = fpext float %62 to double
  %mul70 = fmul double %61, %conv69
  %63 = load float, float* %xmax, align 4
  %conv71 = fpext float %63 to double
  %mul72 = fmul double %mul70, %conv71
  store double %mul72, double* %sum, align 8
  br label %START

if.end73:                                         ; preds = %cond.end63
  %64 = load float*, float** %sx.addr, align 8
  %65 = load float, float* %64, align 4
  %conv74 = fpext float %65 to double
  %cmp75 = fcmp ogt double %conv74, 0.000000e+00
  br i1 %cmp75, label %cond.true77, label %cond.false78

cond.true77:                                      ; preds = %if.end73
  %66 = load float*, float** %sx.addr, align 8
  %67 = load float, float* %66, align 4
  br label %cond.end80

cond.false78:                                     ; preds = %if.end73
  %68 = load float*, float** %sx.addr, align 8
  %69 = load float, float* %68, align 4
  %sub79 = fsub float -0.000000e+00, %69
  br label %cond.end80

cond.end80:                                       ; preds = %cond.false78, %cond.true77
  %cond81 = phi float [ %67, %cond.true77 ], [ %sub79, %cond.false78 ]
  %70 = load float, float* %xmax, align 4
  %cmp82 = fcmp ogt float %cond81, %70
  br i1 %cmp82, label %if.then84, label %if.end100

if.then84:                                        ; preds = %cond.end80
  %71 = load double, double* %sum, align 8
  %72 = load float, float* %xmax, align 4
  %73 = load float*, float** %sx.addr, align 8
  %74 = load float, float* %73, align 4
  %div85 = fdiv float %72, %74
  %conv86 = fpext float %div85 to double
  %mul87 = fmul double %71, %conv86
  %75 = load float, float* %xmax, align 4
  %76 = load float*, float** %sx.addr, align 8
  %77 = load float, float* %76, align 4
  %div88 = fdiv float %75, %77
  %conv89 = fpext float %div88 to double
  %mul90 = fmul double %mul87, %conv89
  %add91 = fadd double 1.000000e+00, %mul90
  store double %add91, double* %sum, align 8
  %78 = load float*, float** %sx.addr, align 8
  %79 = load float, float* %78, align 4
  %conv92 = fpext float %79 to double
  %cmp93 = fcmp ogt double %conv92, 0.000000e+00
  br i1 %cmp93, label %cond.true95, label %cond.false96

cond.true95:                                      ; preds = %if.then84
  %80 = load float*, float** %sx.addr, align 8
  %81 = load float, float* %80, align 4
  br label %cond.end98

cond.false96:                                     ; preds = %if.then84
  %82 = load float*, float** %sx.addr, align 8
  %83 = load float, float* %82, align 4
  %sub97 = fsub float -0.000000e+00, %83
  br label %cond.end98

cond.end98:                                       ; preds = %cond.false96, %cond.true95
  %cond99 = phi float [ %81, %cond.true95 ], [ %sub97, %cond.false96 ]
  store float %cond99, float* %xmax, align 4
  br label %for.inc106

if.end100:                                        ; preds = %cond.end80
  %84 = load float*, float** %sx.addr, align 8
  %85 = load float, float* %84, align 4
  %86 = load float, float* %xmax, align 4
  %div101 = fdiv float %85, %86
  %87 = load float*, float** %sx.addr, align 8
  %88 = load float, float* %87, align 4
  %89 = load float, float* %xmax, align 4
  %div102 = fdiv float %88, %89
  %mul103 = fmul float %div101, %div102
  %conv104 = fpext float %mul103 to double
  %90 = load double, double* %sum, align 8
  %add105 = fadd double %90, %conv104
  store double %add105, double* %sum, align 8
  br label %for.inc106

for.inc106:                                       ; preds = %if.end100, %cond.end98
  %91 = load i32, i32* %i, align 4
  %inc107 = add nsw i32 %91, 1
  store i32 %inc107, i32* %i, align 4
  %92 = load i32, i32* %incx.addr, align 4
  %93 = load float*, float** %sx.addr, align 8
  %idx.ext108 = sext i32 %92 to i64
  %add.ptr109 = getelementptr inbounds float, float* %93, i64 %idx.ext108
  store float* %add.ptr109, float** %sx.addr, align 8
  br label %for.cond53

for.end110:                                       ; preds = %for.cond53
  %94 = load float, float* %xmax, align 4
  %conv111 = fpext float %94 to double
  %95 = load double, double* %sum, align 8
  %call112 = call double @sqrt(double %95) #4
  %mul113 = fmul double %conv111, %call112
  store double %mul113, double* %retval, align 8
  br label %return

GOT_LARGE:                                        ; preds = %if.then34
  %96 = load double, double* %sum, align 8
  %97 = load float*, float** %sx.addr, align 8
  %98 = load float, float* %97, align 4
  %conv114 = fpext float %98 to double
  %div115 = fdiv double %96, %conv114
  %99 = load float*, float** %sx.addr, align 8
  %100 = load float, float* %99, align 4
  %conv116 = fpext float %100 to double
  %div117 = fdiv double %div115, %conv116
  %add118 = fadd double 1.000000e+00, %div117
  store double %add118, double* %sum, align 8
  %101 = load float*, float** %sx.addr, align 8
  %102 = load float, float* %101, align 4
  %conv119 = fpext float %102 to double
  %cmp120 = fcmp ogt double %conv119, 0.000000e+00
  br i1 %cmp120, label %cond.true122, label %cond.false123

cond.true122:                                     ; preds = %GOT_LARGE
  %103 = load float*, float** %sx.addr, align 8
  %104 = load float, float* %103, align 4
  br label %cond.end125

cond.false123:                                    ; preds = %GOT_LARGE
  %105 = load float*, float** %sx.addr, align 8
  %106 = load float, float* %105, align 4
  %sub124 = fsub float -0.000000e+00, %106
  br label %cond.end125

cond.end125:                                      ; preds = %cond.false123, %cond.true122
  %cond126 = phi float [ %104, %cond.true122 ], [ %sub124, %cond.false123 ]
  store float %cond126, float* %xmax, align 4
  %107 = load i32, i32* %incx.addr, align 4
  %108 = load float*, float** %sx.addr, align 8
  %idx.ext127 = sext i32 %107 to i64
  %add.ptr128 = getelementptr inbounds float, float* %108, i64 %idx.ext127
  store float* %add.ptr128, float** %sx.addr, align 8
  %109 = load i32, i32* %i, align 4
  %inc129 = add nsw i32 %109, 1
  store i32 %inc129, i32* %i, align 4
  br label %for.cond130

for.cond130:                                      ; preds = %for.inc166, %cond.end125
  %110 = load i32, i32* %i, align 4
  %111 = load i32, i32* %n.addr, align 4
  %cmp131 = icmp slt i32 %110, %111
  br i1 %cmp131, label %for.body133, label %for.end170

for.body133:                                      ; preds = %for.cond130
  %112 = load float*, float** %sx.addr, align 8
  %113 = load float, float* %112, align 4
  %conv134 = fpext float %113 to double
  %cmp135 = fcmp ogt double %conv134, 0.000000e+00
  br i1 %cmp135, label %cond.true137, label %cond.false138

cond.true137:                                     ; preds = %for.body133
  %114 = load float*, float** %sx.addr, align 8
  %115 = load float, float* %114, align 4
  br label %cond.end140

cond.false138:                                    ; preds = %for.body133
  %116 = load float*, float** %sx.addr, align 8
  %117 = load float, float* %116, align 4
  %sub139 = fsub float -0.000000e+00, %117
  br label %cond.end140

cond.end140:                                      ; preds = %cond.false138, %cond.true137
  %cond141 = phi float [ %115, %cond.true137 ], [ %sub139, %cond.false138 ]
  %118 = load float, float* %xmax, align 4
  %cmp142 = fcmp ogt float %cond141, %118
  br i1 %cmp142, label %if.then144, label %if.end160

if.then144:                                       ; preds = %cond.end140
  %119 = load double, double* %sum, align 8
  %120 = load float, float* %xmax, align 4
  %121 = load float*, float** %sx.addr, align 8
  %122 = load float, float* %121, align 4
  %div145 = fdiv float %120, %122
  %conv146 = fpext float %div145 to double
  %mul147 = fmul double %119, %conv146
  %123 = load float, float* %xmax, align 4
  %124 = load float*, float** %sx.addr, align 8
  %125 = load float, float* %124, align 4
  %div148 = fdiv float %123, %125
  %conv149 = fpext float %div148 to double
  %mul150 = fmul double %mul147, %conv149
  %add151 = fadd double 1.000000e+00, %mul150
  store double %add151, double* %sum, align 8
  %126 = load float*, float** %sx.addr, align 8
  %127 = load float, float* %126, align 4
  %conv152 = fpext float %127 to double
  %cmp153 = fcmp ogt double %conv152, 0.000000e+00
  br i1 %cmp153, label %cond.true155, label %cond.false156

cond.true155:                                     ; preds = %if.then144
  %128 = load float*, float** %sx.addr, align 8
  %129 = load float, float* %128, align 4
  br label %cond.end158

cond.false156:                                    ; preds = %if.then144
  %130 = load float*, float** %sx.addr, align 8
  %131 = load float, float* %130, align 4
  %sub157 = fsub float -0.000000e+00, %131
  br label %cond.end158

cond.end158:                                      ; preds = %cond.false156, %cond.true155
  %cond159 = phi float [ %129, %cond.true155 ], [ %sub157, %cond.false156 ]
  store float %cond159, float* %xmax, align 4
  br label %for.inc166

if.end160:                                        ; preds = %cond.end140
  %132 = load float*, float** %sx.addr, align 8
  %133 = load float, float* %132, align 4
  %134 = load float, float* %xmax, align 4
  %div161 = fdiv float %133, %134
  %135 = load float*, float** %sx.addr, align 8
  %136 = load float, float* %135, align 4
  %137 = load float, float* %xmax, align 4
  %div162 = fdiv float %136, %137
  %mul163 = fmul float %div161, %div162
  %conv164 = fpext float %mul163 to double
  %138 = load double, double* %sum, align 8
  %add165 = fadd double %138, %conv164
  store double %add165, double* %sum, align 8
  br label %for.inc166

for.inc166:                                       ; preds = %if.end160, %cond.end158
  %139 = load i32, i32* %i, align 4
  %inc167 = add nsw i32 %139, 1
  store i32 %inc167, i32* %i, align 4
  %140 = load i32, i32* %incx.addr, align 4
  %141 = load float*, float** %sx.addr, align 8
  %idx.ext168 = sext i32 %140 to i64
  %add.ptr169 = getelementptr inbounds float, float* %141, i64 %idx.ext168
  store float* %add.ptr169, float** %sx.addr, align 8
  br label %for.cond130

for.end170:                                       ; preds = %for.cond130
  %142 = load float, float* %xmax, align 4
  %conv171 = fpext float %142 to double
  %143 = load double, double* %sum, align 8
  %call172 = call double @sqrt(double %143) #4
  %mul173 = fmul double %conv171, %call172
  store double %mul173, double* %retval, align 8
  br label %return

return:                                           ; preds = %for.end170, %for.end110, %for.end, %if.then12, %if.then
  %144 = load double, double* %retval, align 8
  ret double %144
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @r1mach() #0 {
entry:
  %u = alloca float, align 4
  %comp = alloca float, align 4
  store float 1.000000e+00, float* %u, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %0 = load float, float* %u, align 4
  %conv = fpext float %0 to double
  %mul = fmul double %conv, 5.000000e-01
  %conv1 = fptrunc double %mul to float
  store float %conv1, float* %u, align 4
  %1 = load float, float* %u, align 4
  %conv2 = fpext float %1 to double
  %add = fadd double 1.000000e+00, %conv2
  %conv3 = fptrunc double %add to float
  store float %conv3, float* %comp, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %2 = load float, float* %comp, align 4
  %conv4 = fpext float %2 to double
  %cmp = fcmp une double %conv4, 1.000000e+00
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %3 = load float, float* %u, align 4
  %conv6 = fpext float %3 to double
  %mul7 = fmul double %conv6, 2.000000e+00
  ret double %mul7
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @min0(i32 %n, i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j, i32 %k, i32 %l, i32 %m, i32 %o, i32 %p) #0 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %f.addr = alloca i32, align 4
  %g.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %l.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %o.addr = alloca i32, align 4
  %p.addr = alloca i32, align 4
  %mt = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %f, i32* %f.addr, align 4
  store i32 %g, i32* %g.addr, align 4
  store i32 %h, i32* %h.addr, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i32 %l, i32* %l.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %o, i32* %o.addr, align 4
  store i32 %p, i32* %p.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4
  %cmp1 = icmp sgt i32 %1, 15
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i32, i32* %a.addr, align 4
  store i32 %2, i32* %mt, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp2 = icmp eq i32 %3, 1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %4 = load i32, i32* %mt, align 4
  store i32 %4, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %5 = load i32, i32* %mt, align 4
  %6 = load i32, i32* %b.addr, align 4
  %cmp5 = icmp sgt i32 %5, %6
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end4
  %7 = load i32, i32* %b.addr, align 4
  store i32 %7, i32* %mt, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end4
  %8 = load i32, i32* %n.addr, align 4
  %cmp8 = icmp eq i32 %8, 2
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end7
  %9 = load i32, i32* %mt, align 4
  store i32 %9, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end7
  %10 = load i32, i32* %mt, align 4
  %11 = load i32, i32* %c.addr, align 4
  %cmp11 = icmp sgt i32 %10, %11
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end10
  %12 = load i32, i32* %c.addr, align 4
  store i32 %12, i32* %mt, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.end10
  %13 = load i32, i32* %n.addr, align 4
  %cmp14 = icmp eq i32 %13, 3
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end13
  %14 = load i32, i32* %mt, align 4
  store i32 %14, i32* %retval, align 4
  br label %return

if.end16:                                         ; preds = %if.end13
  %15 = load i32, i32* %mt, align 4
  %16 = load i32, i32* %d.addr, align 4
  %cmp17 = icmp sgt i32 %15, %16
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end16
  %17 = load i32, i32* %d.addr, align 4
  store i32 %17, i32* %mt, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.end16
  %18 = load i32, i32* %n.addr, align 4
  %cmp20 = icmp eq i32 %18, 4
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end19
  %19 = load i32, i32* %mt, align 4
  store i32 %19, i32* %retval, align 4
  br label %return

if.end22:                                         ; preds = %if.end19
  %20 = load i32, i32* %mt, align 4
  %21 = load i32, i32* %e.addr, align 4
  %cmp23 = icmp sgt i32 %20, %21
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end22
  %22 = load i32, i32* %e.addr, align 4
  store i32 %22, i32* %mt, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.end22
  %23 = load i32, i32* %n.addr, align 4
  %cmp26 = icmp eq i32 %23, 5
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end25
  %24 = load i32, i32* %mt, align 4
  store i32 %24, i32* %retval, align 4
  br label %return

if.end28:                                         ; preds = %if.end25
  %25 = load i32, i32* %mt, align 4
  %26 = load i32, i32* %f.addr, align 4
  %cmp29 = icmp sgt i32 %25, %26
  br i1 %cmp29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end28
  %27 = load i32, i32* %f.addr, align 4
  store i32 %27, i32* %mt, align 4
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %if.end28
  %28 = load i32, i32* %n.addr, align 4
  %cmp32 = icmp eq i32 %28, 6
  br i1 %cmp32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end31
  %29 = load i32, i32* %mt, align 4
  store i32 %29, i32* %retval, align 4
  br label %return

if.end34:                                         ; preds = %if.end31
  %30 = load i32, i32* %mt, align 4
  %31 = load i32, i32* %g.addr, align 4
  %cmp35 = icmp sgt i32 %30, %31
  br i1 %cmp35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end34
  %32 = load i32, i32* %g.addr, align 4
  store i32 %32, i32* %mt, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.then36, %if.end34
  %33 = load i32, i32* %n.addr, align 4
  %cmp38 = icmp eq i32 %33, 7
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end37
  %34 = load i32, i32* %mt, align 4
  store i32 %34, i32* %retval, align 4
  br label %return

if.end40:                                         ; preds = %if.end37
  %35 = load i32, i32* %mt, align 4
  %36 = load i32, i32* %h.addr, align 4
  %cmp41 = icmp sgt i32 %35, %36
  br i1 %cmp41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.end40
  %37 = load i32, i32* %h.addr, align 4
  store i32 %37, i32* %mt, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.then42, %if.end40
  %38 = load i32, i32* %n.addr, align 4
  %cmp44 = icmp eq i32 %38, 8
  br i1 %cmp44, label %if.then45, label %if.end46

if.then45:                                        ; preds = %if.end43
  %39 = load i32, i32* %mt, align 4
  store i32 %39, i32* %retval, align 4
  br label %return

if.end46:                                         ; preds = %if.end43
  %40 = load i32, i32* %mt, align 4
  %41 = load i32, i32* %i.addr, align 4
  %cmp47 = icmp sgt i32 %40, %41
  br i1 %cmp47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end46
  %42 = load i32, i32* %i.addr, align 4
  store i32 %42, i32* %mt, align 4
  br label %if.end49

if.end49:                                         ; preds = %if.then48, %if.end46
  %43 = load i32, i32* %n.addr, align 4
  %cmp50 = icmp eq i32 %43, 9
  br i1 %cmp50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.end49
  %44 = load i32, i32* %mt, align 4
  store i32 %44, i32* %retval, align 4
  br label %return

if.end52:                                         ; preds = %if.end49
  %45 = load i32, i32* %mt, align 4
  %46 = load i32, i32* %j.addr, align 4
  %cmp53 = icmp sgt i32 %45, %46
  br i1 %cmp53, label %if.then54, label %if.end55

if.then54:                                        ; preds = %if.end52
  %47 = load i32, i32* %j.addr, align 4
  store i32 %47, i32* %mt, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.then54, %if.end52
  %48 = load i32, i32* %n.addr, align 4
  %cmp56 = icmp eq i32 %48, 10
  br i1 %cmp56, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.end55
  %49 = load i32, i32* %mt, align 4
  store i32 %49, i32* %retval, align 4
  br label %return

if.end58:                                         ; preds = %if.end55
  %50 = load i32, i32* %mt, align 4
  %51 = load i32, i32* %k.addr, align 4
  %cmp59 = icmp sgt i32 %50, %51
  br i1 %cmp59, label %if.then60, label %if.end61

if.then60:                                        ; preds = %if.end58
  %52 = load i32, i32* %k.addr, align 4
  store i32 %52, i32* %mt, align 4
  br label %if.end61

if.end61:                                         ; preds = %if.then60, %if.end58
  %53 = load i32, i32* %n.addr, align 4
  %cmp62 = icmp eq i32 %53, 11
  br i1 %cmp62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end61
  %54 = load i32, i32* %mt, align 4
  store i32 %54, i32* %retval, align 4
  br label %return

if.end64:                                         ; preds = %if.end61
  %55 = load i32, i32* %mt, align 4
  %56 = load i32, i32* %l.addr, align 4
  %cmp65 = icmp sgt i32 %55, %56
  br i1 %cmp65, label %if.then66, label %if.end67

if.then66:                                        ; preds = %if.end64
  %57 = load i32, i32* %l.addr, align 4
  store i32 %57, i32* %mt, align 4
  br label %if.end67

if.end67:                                         ; preds = %if.then66, %if.end64
  %58 = load i32, i32* %n.addr, align 4
  %cmp68 = icmp eq i32 %58, 12
  br i1 %cmp68, label %if.then69, label %if.end70

if.then69:                                        ; preds = %if.end67
  %59 = load i32, i32* %mt, align 4
  store i32 %59, i32* %retval, align 4
  br label %return

if.end70:                                         ; preds = %if.end67
  %60 = load i32, i32* %mt, align 4
  %61 = load i32, i32* %m.addr, align 4
  %cmp71 = icmp sgt i32 %60, %61
  br i1 %cmp71, label %if.then72, label %if.end73

if.then72:                                        ; preds = %if.end70
  %62 = load i32, i32* %m.addr, align 4
  store i32 %62, i32* %mt, align 4
  br label %if.end73

if.end73:                                         ; preds = %if.then72, %if.end70
  %63 = load i32, i32* %n.addr, align 4
  %cmp74 = icmp eq i32 %63, 13
  br i1 %cmp74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end73
  %64 = load i32, i32* %mt, align 4
  store i32 %64, i32* %retval, align 4
  br label %return

if.end76:                                         ; preds = %if.end73
  %65 = load i32, i32* %mt, align 4
  %66 = load i32, i32* %o.addr, align 4
  %cmp77 = icmp sgt i32 %65, %66
  br i1 %cmp77, label %if.then78, label %if.end79

if.then78:                                        ; preds = %if.end76
  %67 = load i32, i32* %o.addr, align 4
  store i32 %67, i32* %mt, align 4
  br label %if.end79

if.end79:                                         ; preds = %if.then78, %if.end76
  %68 = load i32, i32* %n.addr, align 4
  %cmp80 = icmp eq i32 %68, 14
  br i1 %cmp80, label %if.then81, label %if.end82

if.then81:                                        ; preds = %if.end79
  %69 = load i32, i32* %mt, align 4
  store i32 %69, i32* %retval, align 4
  br label %return

if.end82:                                         ; preds = %if.end79
  %70 = load i32, i32* %mt, align 4
  %71 = load i32, i32* %p.addr, align 4
  %cmp83 = icmp sgt i32 %70, %71
  br i1 %cmp83, label %if.then84, label %if.end85

if.then84:                                        ; preds = %if.end82
  %72 = load i32, i32* %p.addr, align 4
  store i32 %72, i32* %mt, align 4
  br label %if.end85

if.end85:                                         ; preds = %if.then84, %if.end82
  %73 = load i32, i32* %mt, align 4
  store i32 %73, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end85, %if.then81, %if.then75, %if.then69, %if.then63, %if.then57, %if.then51, %if.then45, %if.then39, %if.then33, %if.then27, %if.then21, %if.then15, %if.then9, %if.then3, %if.then
  %74 = load i32, i32* %retval, align 4
  ret i32 %74
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sscal(i32 %n, double, float* %sx, i32 %incx) #0 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %sa.addr = alloca float, align 4
  %sx.addr = alloca float*, align 8
  %incx.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %sa = fptrunc double %0 to float
  store i32 %n, i32* %n.addr, align 4
  store float %sa, float* %sa.addr, align 4
  store float* %sx, float** %sx.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %1, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %incx.addr, align 4
  %cmp1 = icmp ne i32 %2, 1
  br i1 %cmp1, label %if.then2, label %if.end10

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %incx.addr, align 4
  %cmp3 = icmp slt i32 %3, 0
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %n.addr, align 4
  %sub = sub nsw i32 0, %4
  %add = add nsw i32 %sub, 1
  %5 = load i32, i32* %incx.addr, align 4
  %mul = mul nsw i32 %add, %5
  %6 = load float*, float** %sx.addr, align 8
  %idx.ext = sext i32 %mul to i64
  %add.ptr = getelementptr inbounds float, float* %6, i64 %idx.ext
  store float* %add.ptr, float** %sx.addr, align 8
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.then2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end5
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %n.addr, align 4
  %cmp6 = icmp slt i32 %7, %8
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load float, float* %sa.addr, align 4
  %10 = load float*, float** %sx.addr, align 8
  %11 = load float, float* %10, align 4
  %mul7 = fmul float %11, %9
  store float %mul7, float* %10, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  %13 = load i32, i32* %incx.addr, align 4
  %14 = load float*, float** %sx.addr, align 8
  %idx.ext8 = sext i32 %13 to i64
  %add.ptr9 = getelementptr inbounds float, float* %14, i64 %idx.ext8
  store float* %add.ptr9, float** %sx.addr, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc15, %if.end10
  %15 = load i32, i32* %i, align 4
  %16 = load i32, i32* %n.addr, align 4
  %cmp12 = icmp slt i32 %15, %16
  br i1 %cmp12, label %for.body13, label %for.end17

for.body13:                                       ; preds = %for.cond11
  %17 = load float, float* %sa.addr, align 4
  %18 = load float*, float** %sx.addr, align 8
  %19 = load float, float* %18, align 4
  %mul14 = fmul float %19, %17
  store float %mul14, float* %18, align 4
  br label %for.inc15

for.inc15:                                        ; preds = %for.body13
  %20 = load i32, i32* %i, align 4
  %inc16 = add nsw i32 %20, 1
  store i32 %inc16, i32* %i, align 4
  %21 = load float*, float** %sx.addr, align 8
  %incdec.ptr = getelementptr inbounds float, float* %21, i32 1
  store float* %incdec.ptr, float** %sx.addr, align 8
  br label %for.cond11

for.end17:                                        ; preds = %for.cond11
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end17, %for.end, %if.then
  %22 = load i32, i32* %retval, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @vexopy(i32 %n, float* %v, float* %x, float* %y, i32 %itype) #0 {
entry:
  %n.addr = alloca i32, align 4
  %v.addr = alloca float*, align 8
  %x.addr = alloca float*, align 8
  %y.addr = alloca float*, align 8
  %itype.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store float* %v, float** %v.addr, align 8
  store float* %x, float** %x.addr, align 8
  store float* %y, float** %y.addr, align 8
  store i32 %itype, i32* %itype.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end15

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %itype.addr, align 4
  %cmp1 = icmp eq i32 %1, 1
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then2
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp3 = icmp slt i32 %2, %3
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load float*, float** %x.addr, align 8
  %5 = load float, float* %4, align 4
  %6 = load float*, float** %y.addr, align 8
  %7 = load float, float* %6, align 4
  %add = fadd float %5, %7
  %8 = load float*, float** %v.addr, align 8
  store float %add, float* %8, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  %10 = load float*, float** %x.addr, align 8
  %incdec.ptr = getelementptr inbounds float, float* %10, i32 1
  store float* %incdec.ptr, float** %x.addr, align 8
  %11 = load float*, float** %y.addr, align 8
  %incdec.ptr4 = getelementptr inbounds float, float* %11, i32 1
  store float* %incdec.ptr4, float** %y.addr, align 8
  %12 = load float*, float** %v.addr, align 8
  %incdec.ptr5 = getelementptr inbounds float, float* %12, i32 1
  store float* %incdec.ptr5, float** %v.addr, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end15

if.else:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc9, %if.else
  %13 = load i32, i32* %i, align 4
  %14 = load i32, i32* %n.addr, align 4
  %cmp7 = icmp slt i32 %13, %14
  br i1 %cmp7, label %for.body8, label %for.end14

for.body8:                                        ; preds = %for.cond6
  %15 = load float*, float** %x.addr, align 8
  %16 = load float, float* %15, align 4
  %17 = load float*, float** %y.addr, align 8
  %18 = load float, float* %17, align 4
  %sub = fsub float %16, %18
  %19 = load float*, float** %v.addr, align 8
  store float %sub, float* %19, align 4
  br label %for.inc9

for.inc9:                                         ; preds = %for.body8
  %20 = load i32, i32* %i, align 4
  %inc10 = add nsw i32 %20, 1
  store i32 %inc10, i32* %i, align 4
  %21 = load float*, float** %x.addr, align 8
  %incdec.ptr11 = getelementptr inbounds float, float* %21, i32 1
  store float* %incdec.ptr11, float** %x.addr, align 8
  %22 = load float*, float** %y.addr, align 8
  %incdec.ptr12 = getelementptr inbounds float, float* %22, i32 1
  store float* %incdec.ptr12, float** %y.addr, align 8
  %23 = load float*, float** %v.addr, align 8
  %incdec.ptr13 = getelementptr inbounds float, float* %23, i32 1
  store float* %incdec.ptr13, float** %v.addr, align 8
  br label %for.cond6

for.end14:                                        ; preds = %for.cond6
  br label %if.end15

if.end15:                                         ; preds = %for.end14, %for.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @vfill(i32 %n, float* %v, double) #0 {
entry:
  %n.addr = alloca i32, align 4
  %v.addr = alloca float*, align 8
  %val.addr = alloca float, align 4
  %i = alloca i32, align 4
  %val = fptrunc double %0 to float
  store i32 %n, i32* %n.addr, align 4
  store float* %v, float** %v.addr, align 8
  store float %val, float* %val.addr, align 4
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %1, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %for.end

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp1 = icmp slt i32 %2, %3
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load float, float* %val.addr, align 4
  %5 = load float*, float** %v.addr, align 8
  store float %4, float* %5, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  %7 = load float*, float** %v.addr, align 8
  %incdec.ptr = getelementptr inbounds float, float* %7, i32 1
  store float* %incdec.ptr, float** %v.addr, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %a = alloca %struct.FULL, align 8
  %b = alloca float*, align 8
  %bt = alloca float*, align 8
  %x = alloca float*, align 8
  %anorm = alloca float, align 4
  %col = alloca float*, align 8
  %t = alloca float, align 4
  %err = alloca double, align 8
  %ipvt = alloca i32*, align 8
  %retval1 = alloca i32, align 4
  %test_case = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 0, i32* %test_case, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end57, %entry
  %0 = load i32, i32* %test_case, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* %test_case, align 4
  %call = call i32 @matgen(%struct.FULL* %a, float** %x, float** %b, float** %bt, i32** %ipvt, i32 %inc, i32 1)
  %tobool = icmp ne i32 %call, 0
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %rd = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 1
  %1 = load i32, i32* %rd, align 4
  %cmp = icmp sgt i32 %1, 1000
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %cd = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 0
  %2 = load i32, i32* %cd, align 8
  %cmp2 = icmp sgt i32 %2, 1000
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %rd3 = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 1
  %4 = load i32, i32* %rd3, align 4
  %cd4 = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 0
  %5 = load i32, i32* %cd4, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str, i64 0, i64 0), i32 %4, i32 %5)
  call void @exit(i32 1) #5
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, i32* %j, align 4
  store float 0.000000e+00, float* %anorm, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %if.end
  %6 = load i32, i32* %j, align 4
  %cd6 = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 0
  %7 = load i32, i32* %cd6, align 8
  %cmp7 = icmp slt i32 %6, %7
  br i1 %cmp7, label %for.body, label %for.end23

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  %pd = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 2
  %8 = load i32, i32* %j, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd, i64 0, i64 %idxprom
  %9 = load float*, float** %arrayidx, align 8
  store float* %9, float** %col, align 8
  store float 0.000000e+00, float* %t, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc, %for.body
  %10 = load i32, i32* %i, align 4
  %rd9 = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 1
  %11 = load i32, i32* %rd9, align 4
  %cmp10 = icmp slt i32 %10, %11
  br i1 %cmp10, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond8
  %12 = load float*, float** %col, align 8
  %13 = load float, float* %12, align 4
  %conv = fpext float %13 to double
  %cmp12 = fcmp olt double %conv, 0.000000e+00
  br i1 %cmp12, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body11
  %14 = load float*, float** %col, align 8
  %15 = load float, float* %14, align 4
  %sub = fsub float -0.000000e+00, %15
  br label %cond.end

cond.false:                                       ; preds = %for.body11
  %16 = load float*, float** %col, align 8
  %17 = load float, float* %16, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi float [ %sub, %cond.true ], [ %17, %cond.false ]
  %18 = load float, float* %t, align 4
  %add = fadd float %18, %cond
  store float %add, float* %t, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %19 = load i32, i32* %i, align 4
  %inc14 = add nsw i32 %19, 1
  store i32 %inc14, i32* %i, align 4
  %20 = load float*, float** %col, align 8
  %incdec.ptr = getelementptr inbounds float, float* %20, i32 1
  store float* %incdec.ptr, float** %col, align 8
  br label %for.cond8

for.end:                                          ; preds = %for.cond8
  %21 = load float, float* %anorm, align 4
  %22 = load float, float* %t, align 4
  %cmp15 = fcmp ogt float %21, %22
  br i1 %cmp15, label %cond.true17, label %cond.false18

cond.true17:                                      ; preds = %for.end
  %23 = load float, float* %anorm, align 4
  br label %cond.end19

cond.false18:                                     ; preds = %for.end
  %24 = load float, float* %t, align 4
  br label %cond.end19

cond.end19:                                       ; preds = %cond.false18, %cond.true17
  %cond20 = phi float [ %23, %cond.true17 ], [ %24, %cond.false18 ]
  store float %cond20, float* %anorm, align 4
  br label %for.inc21

for.inc21:                                        ; preds = %cond.end19
  %25 = load i32, i32* %j, align 4
  %inc22 = add nsw i32 %25, 1
  store i32 %inc22, i32* %j, align 4
  br label %for.cond

for.end23:                                        ; preds = %for.cond
  %26 = load float, float* %anorm, align 4
  %conv24 = fpext float %26 to double
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i64 0, i64 0), double %conv24)
  %27 = load i32*, i32** %ipvt, align 8
  %call26 = call i32 (%struct.FULL*, i32*, ...) bitcast (i32 (%struct.FULL*, i32*)* @sgefa to i32 (%struct.FULL*, i32*, ...)*)(%struct.FULL* %a, i32* %27)
  store i32 %call26, i32* %retval1, align 4
  %28 = load i32, i32* %retval1, align 4
  %tobool27 = icmp ne i32 %28, 0
  br i1 %tobool27, label %if.then28, label %if.else

if.then28:                                        ; preds = %for.end23
  br label %if.end57

if.else:                                          ; preds = %for.end23
  %29 = load i32*, i32** %ipvt, align 8
  %30 = load float*, float** %b, align 8
  %call29 = call i32 (%struct.FULL*, i32*, float*, i32, ...) bitcast (i32 (%struct.FULL*, i32*, float*, i32)* @sgesl to i32 (%struct.FULL*, i32*, float*, i32, ...)*)(%struct.FULL* %a, i32* %29, float* %30, i32 0)
  %rd30 = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 1
  %31 = load i32, i32* %rd30, align 4
  %cmp31 = icmp sle i32 %31, 7
  br i1 %cmp31, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.else
  call void @matdump(%struct.FULL* %a, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0))
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %if.else
  %rd35 = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 1
  %32 = load i32, i32* %rd35, align 4
  %cmp36 = icmp sle i32 %32, 7
  br i1 %cmp36, label %if.then38, label %if.end41

if.then38:                                        ; preds = %if.end34
  %33 = load float*, float** %x, align 8
  %rd39 = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 1
  %34 = load i32, i32* %rd39, align 4
  call void @fvecdump(float* %33, i32 %34, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0))
  %35 = load float*, float** %b, align 8
  %rd40 = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 1
  %36 = load i32, i32* %rd40, align 4
  call void @fvecdump(float* %35, i32 %36, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0))
  br label %if.end41

if.end41:                                         ; preds = %if.then38, %if.end34
  %rd42 = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 1
  %37 = load i32, i32* %rd42, align 4
  %38 = load float*, float** %b, align 8
  %39 = load float*, float** %x, align 8
  %40 = load float*, float** %b, align 8
  %call43 = call i32 (i32, float*, float*, float*, i32, ...) bitcast (void (i32, float*, float*, float*, i32)* @vexopy to i32 (i32, float*, float*, float*, i32, ...)*)(i32 %37, float* %38, float* %39, float* %40, i32 2)
  %rd44 = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 1
  %41 = load i32, i32* %rd44, align 4
  %42 = load float*, float** %b, align 8
  %call45 = call double (i32, float*, i32, ...) bitcast (double (i32, float*, i32)* @snrm2 to double (i32, float*, i32, ...)*)(i32 %41, float* %42, i32 1)
  store double %call45, double* %err, align 8
  %43 = load i32*, i32** %ipvt, align 8
  %44 = load float*, float** %bt, align 8
  %call46 = call i32 (%struct.FULL*, i32*, float*, i32, ...) bitcast (i32 (%struct.FULL*, i32*, float*, i32)* @sgesl to i32 (%struct.FULL*, i32*, float*, i32, ...)*)(%struct.FULL* %a, i32* %43, float* %44, i32 1)
  %rd47 = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 1
  %45 = load i32, i32* %rd47, align 4
  %cmp48 = icmp sle i32 %45, 7
  br i1 %cmp48, label %if.then50, label %if.end52

if.then50:                                        ; preds = %if.end41
  %46 = load float*, float** %bt, align 8
  %rd51 = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 1
  %47 = load i32, i32* %rd51, align 4
  call void @fvecdump(float* %46, i32 %47, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.5, i64 0, i64 0))
  br label %if.end52

if.end52:                                         ; preds = %if.then50, %if.end41
  %rd53 = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 1
  %48 = load i32, i32* %rd53, align 4
  %49 = load float*, float** %bt, align 8
  %50 = load float*, float** %x, align 8
  %51 = load float*, float** %bt, align 8
  %call54 = call i32 (i32, float*, float*, float*, i32, ...) bitcast (void (i32, float*, float*, float*, i32)* @vexopy to i32 (i32, float*, float*, float*, i32, ...)*)(i32 %48, float* %49, float* %50, float* %51, i32 2)
  %rd55 = getelementptr inbounds %struct.FULL, %struct.FULL* %a, i32 0, i32 1
  %52 = load i32, i32* %rd55, align 4
  %53 = load float*, float** %bt, align 8
  %call56 = call double (i32, float*, i32, ...) bitcast (double (i32, float*, i32)* @snrm2 to double (i32, float*, i32, ...)*)(i32 %52, float* %53, i32 1)
  store double %call56, double* %err, align 8
  br label %if.end57

if.end57:                                         ; preds = %if.end52, %if.then28
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @matgen(%struct.FULL* %a, float** %x, float** %b, float** %bt, i32** %ipvt, i32 %test_case, i32 %scale) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca %struct.FULL*, align 8
  %x.addr = alloca float**, align 8
  %b.addr = alloca float**, align 8
  %bt.addr = alloca float**, align 8
  %ipvt.addr = alloca i32**, align 8
  %test_case.addr = alloca i32, align 4
  %scale.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca i32, align 4
  %col = alloca float*, align 8
  %tl = alloca float, align 4
  %tu = alloca float, align 4
  store %struct.FULL* %a, %struct.FULL** %a.addr, align 8
  store float** %x, float*** %x.addr, align 8
  store float** %b, float*** %b.addr, align 8
  store float** %bt, float*** %bt.addr, align 8
  store i32** %ipvt, i32*** %ipvt.addr, align 8
  store i32 %test_case, i32* %test_case.addr, align 4
  store i32 %scale, i32* %scale.addr, align 4
  %0 = load i32, i32* %test_case.addr, align 4
  %cmp = icmp sgt i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.6, i64 0, i64 0))
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %j, align 4
  %2 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd = getelementptr inbounds %struct.FULL, %struct.FULL* %2, i32 0, i32 1
  %3 = load i32, i32* %rd, align 4
  %cmp1 = icmp slt i32 %1, %3
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd = getelementptr inbounds %struct.FULL, %struct.FULL* %4, i32 0, i32 2
  %5 = load i32, i32* %j, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd, i64 0, i64 %idxprom
  %6 = load float*, float** %arrayidx, align 8
  call void (float*, ...) bitcast (void (...)* @free to void (float*, ...)*)(float* %6)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %j, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load float**, float*** %x.addr, align 8
  %9 = load float*, float** %8, align 8
  call void (float*, ...) bitcast (void (...)* @free to void (float*, ...)*)(float* %9)
  %10 = load float**, float*** %b.addr, align 8
  %11 = load float*, float** %10, align 8
  call void (float*, ...) bitcast (void (...)* @free to void (float*, ...)*)(float* %11)
  %12 = load float**, float*** %bt.addr, align 8
  %13 = load float*, float** %12, align 8
  call void (float*, ...) bitcast (void (...)* @free to void (float*, ...)*)(float* %13)
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  %14 = load i32, i32* %test_case.addr, align 4
  switch i32 %14, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb
    i32 3, label %sw.bb
    i32 4, label %sw.bb31
    i32 5, label %sw.bb31
    i32 6, label %sw.bb44
    i32 7, label %sw.bb44
    i32 8, label %sw.bb44
    i32 9, label %sw.bb94
    i32 10, label %sw.bb125
    i32 11, label %sw.bb157
    i32 12, label %sw.bb192
    i32 13, label %sw.bb230
    i32 14, label %sw.bb276
  ]

sw.bb:                                            ; preds = %if.end, %if.end, %if.end
  %15 = load i32, i32* %test_case.addr, align 4
  %mul = mul nsw i32 3, %15
  %16 = load i32, i32* %scale.addr, align 4
  %mul2 = mul nsw i32 %mul, %16
  store i32 %mul2, i32* %n, align 4
  %17 = load i32, i32* %n, align 4
  %18 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd = getelementptr inbounds %struct.FULL, %struct.FULL* %18, i32 0, i32 0
  store i32 %17, i32* %cd, align 8
  %19 = load i32, i32* %n, align 4
  %20 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd3 = getelementptr inbounds %struct.FULL, %struct.FULL* %20, i32 0, i32 1
  store i32 %19, i32* %rd3, align 4
  %21 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %22 = load float**, float*** %x.addr, align 8
  %23 = load float**, float*** %b.addr, align 8
  %24 = load float**, float*** %bt.addr, align 8
  %25 = load i32**, i32*** %ipvt.addr, align 8
  %call4 = call i32 @get_space(%struct.FULL* %21, float** %22, float** %23, float** %24, i32** %25)
  %tobool = icmp ne i32 %call4, 0
  br i1 %tobool, label %if.then5, label %if.end6

if.then5:                                         ; preds = %sw.bb
  store i32 1, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %sw.bb
  %26 = load i32, i32* %test_case.addr, align 4
  %27 = load i32, i32* %n, align 4
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.7, i64 0, i64 0), i32 %26, i32 %27)
  store i32 0, i32* %j, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc28, %if.end6
  %28 = load i32, i32* %j, align 4
  %29 = load i32, i32* %n, align 4
  %cmp9 = icmp slt i32 %28, %29
  br i1 %cmp9, label %for.body10, label %for.end30

for.body10:                                       ; preds = %for.cond8
  store i32 0, i32* %i, align 4
  %30 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd11 = getelementptr inbounds %struct.FULL, %struct.FULL* %30, i32 0, i32 2
  %31 = load i32, i32* %j, align 4
  %idxprom12 = sext i32 %31 to i64
  %arrayidx13 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd11, i64 0, i64 %idxprom12
  %32 = load float*, float** %arrayidx13, align 8
  store float* %32, float** %col, align 8
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc25, %for.body10
  %33 = load i32, i32* %i, align 4
  %34 = load i32, i32* %n, align 4
  %cmp15 = icmp slt i32 %33, %34
  br i1 %cmp15, label %for.body16, label %for.end27

for.body16:                                       ; preds = %for.cond14
  %35 = load float*, float** %col, align 8
  store float 0.000000e+00, float* %35, align 4
  %36 = load i32, i32* %i, align 4
  %37 = load i32, i32* %j, align 4
  %sub = sub nsw i32 %37, 3
  %cmp17 = icmp sge i32 %36, %sub
  br i1 %cmp17, label %land.lhs.true, label %if.end24

land.lhs.true:                                    ; preds = %for.body16
  %38 = load i32, i32* %i, align 4
  %39 = load i32, i32* %j, align 4
  %add = add nsw i32 %39, 2
  %cmp18 = icmp sle i32 %38, %add
  br i1 %cmp18, label %if.then19, label %if.end24

if.then19:                                        ; preds = %land.lhs.true
  %40 = load i32, i32* %i, align 4
  %41 = load i32, i32* %j, align 4
  %add20 = add nsw i32 %40, %41
  %add21 = add nsw i32 %add20, 1
  %conv = sitofp i32 %add21 to float
  %conv22 = fpext float %conv to double
  %div = fdiv double 1.000000e+00, %conv22
  %conv23 = fptrunc double %div to float
  %42 = load float*, float** %col, align 8
  store float %conv23, float* %42, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then19, %land.lhs.true, %for.body16
  br label %for.inc25

for.inc25:                                        ; preds = %if.end24
  %43 = load i32, i32* %i, align 4
  %inc26 = add nsw i32 %43, 1
  store i32 %inc26, i32* %i, align 4
  %44 = load float*, float** %col, align 8
  %incdec.ptr = getelementptr inbounds float, float* %44, i32 1
  store float* %incdec.ptr, float** %col, align 8
  br label %for.cond14

for.end27:                                        ; preds = %for.cond14
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %45 = load i32, i32* %j, align 4
  %inc29 = add nsw i32 %45, 1
  store i32 %inc29, i32* %j, align 4
  br label %for.cond8

for.end30:                                        ; preds = %for.cond8
  br label %sw.epilog

sw.bb31:                                          ; preds = %if.end, %if.end
  store i32 1, i32* %n, align 4
  %46 = load i32, i32* %n, align 4
  %47 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd32 = getelementptr inbounds %struct.FULL, %struct.FULL* %47, i32 0, i32 0
  store i32 %46, i32* %cd32, align 8
  %48 = load i32, i32* %n, align 4
  %49 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd33 = getelementptr inbounds %struct.FULL, %struct.FULL* %49, i32 0, i32 1
  store i32 %48, i32* %rd33, align 4
  %50 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %51 = load float**, float*** %x.addr, align 8
  %52 = load float**, float*** %b.addr, align 8
  %53 = load float**, float*** %bt.addr, align 8
  %54 = load i32**, i32*** %ipvt.addr, align 8
  %call34 = call i32 @get_space(%struct.FULL* %50, float** %51, float** %52, float** %53, i32** %54)
  %tobool35 = icmp ne i32 %call34, 0
  br i1 %tobool35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %sw.bb31
  store i32 1, i32* %retval, align 4
  br label %return

if.end37:                                         ; preds = %sw.bb31
  %55 = load i32, i32* %test_case.addr, align 4
  %56 = load i32, i32* %n, align 4
  %call38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.8, i64 0, i64 0), i32 %55, i32 %56)
  %57 = load i32, i32* %test_case.addr, align 4
  %cmp39 = icmp eq i32 %57, 4
  %58 = zext i1 %cmp39 to i64
  %cond = select i1 %cmp39, double 3.000000e+00, double 0.000000e+00
  %conv41 = fptrunc double %cond to float
  %59 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd42 = getelementptr inbounds %struct.FULL, %struct.FULL* %59, i32 0, i32 2
  %arrayidx43 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd42, i64 0, i64 0
  %60 = load float*, float** %arrayidx43, align 8
  store float %conv41, float* %60, align 4
  br label %sw.epilog

sw.bb44:                                          ; preds = %if.end, %if.end, %if.end
  %61 = load i32, i32* %scale.addr, align 4
  %mul45 = mul nsw i32 15, %61
  store i32 %mul45, i32* %n, align 4
  %62 = load i32, i32* %n, align 4
  %63 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd46 = getelementptr inbounds %struct.FULL, %struct.FULL* %63, i32 0, i32 0
  store i32 %62, i32* %cd46, align 8
  %64 = load i32, i32* %n, align 4
  %65 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd47 = getelementptr inbounds %struct.FULL, %struct.FULL* %65, i32 0, i32 1
  store i32 %64, i32* %rd47, align 4
  %66 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %67 = load float**, float*** %x.addr, align 8
  %68 = load float**, float*** %b.addr, align 8
  %69 = load float**, float*** %bt.addr, align 8
  %70 = load i32**, i32*** %ipvt.addr, align 8
  %call48 = call i32 @get_space(%struct.FULL* %66, float** %67, float** %68, float** %69, i32** %70)
  %tobool49 = icmp ne i32 %call48, 0
  br i1 %tobool49, label %if.then50, label %if.end51

if.then50:                                        ; preds = %sw.bb44
  store i32 1, i32* %retval, align 4
  br label %return

if.end51:                                         ; preds = %sw.bb44
  %71 = load i32, i32* %test_case.addr, align 4
  %72 = load i32, i32* %n, align 4
  %call52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.9, i64 0, i64 0), i32 %71, i32 %72)
  store float 1.000000e+00, float* %tu, align 4
  store float 1.000000e+00, float* %tl, align 4
  %73 = load i32, i32* %test_case.addr, align 4
  %cmp53 = icmp eq i32 %73, 7
  br i1 %cmp53, label %if.then55, label %if.end56

if.then55:                                        ; preds = %if.end51
  store float 1.000000e+02, float* %tl, align 4
  br label %if.end56

if.end56:                                         ; preds = %if.then55, %if.end51
  %74 = load i32, i32* %test_case.addr, align 4
  %cmp57 = icmp eq i32 %74, 8
  br i1 %cmp57, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.end56
  store float 1.000000e+02, float* %tu, align 4
  br label %if.end60

if.end60:                                         ; preds = %if.then59, %if.end56
  store i32 0, i32* %j, align 4
  br label %for.cond61

for.cond61:                                       ; preds = %for.inc91, %if.end60
  %75 = load i32, i32* %j, align 4
  %76 = load i32, i32* %n, align 4
  %cmp62 = icmp slt i32 %75, %76
  br i1 %cmp62, label %for.body64, label %for.end93

for.body64:                                       ; preds = %for.cond61
  store i32 0, i32* %i, align 4
  %77 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd65 = getelementptr inbounds %struct.FULL, %struct.FULL* %77, i32 0, i32 2
  %78 = load i32, i32* %j, align 4
  %idxprom66 = sext i32 %78 to i64
  %arrayidx67 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd65, i64 0, i64 %idxprom66
  %79 = load float*, float** %arrayidx67, align 8
  store float* %79, float** %col, align 8
  br label %for.cond68

for.cond68:                                       ; preds = %for.inc87, %for.body64
  %80 = load i32, i32* %i, align 4
  %81 = load i32, i32* %n, align 4
  %cmp69 = icmp slt i32 %80, %81
  br i1 %cmp69, label %for.body71, label %for.end90

for.body71:                                       ; preds = %for.cond68
  %82 = load float*, float** %col, align 8
  store float 0.000000e+00, float* %82, align 4
  %83 = load i32, i32* %i, align 4
  %84 = load i32, i32* %j, align 4
  %cmp72 = icmp eq i32 %83, %84
  br i1 %cmp72, label %if.then74, label %if.else

if.then74:                                        ; preds = %for.body71
  %85 = load float*, float** %col, align 8
  store float 4.000000e+00, float* %85, align 4
  br label %if.end86

if.else:                                          ; preds = %for.body71
  %86 = load i32, i32* %i, align 4
  %87 = load i32, i32* %j, align 4
  %sub75 = sub nsw i32 %87, 1
  %cmp76 = icmp eq i32 %86, %sub75
  br i1 %cmp76, label %if.then78, label %if.else79

if.then78:                                        ; preds = %if.else
  %88 = load float, float* %tl, align 4
  %89 = load float*, float** %col, align 8
  store float %88, float* %89, align 4
  br label %if.end85

if.else79:                                        ; preds = %if.else
  %90 = load i32, i32* %i, align 4
  %91 = load i32, i32* %j, align 4
  %add80 = add nsw i32 %91, 1
  %cmp81 = icmp eq i32 %90, %add80
  br i1 %cmp81, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.else79
  %92 = load float, float* %tu, align 4
  %93 = load float*, float** %col, align 8
  store float %92, float* %93, align 4
  br label %if.end84

if.end84:                                         ; preds = %if.then83, %if.else79
  br label %if.end85

if.end85:                                         ; preds = %if.end84, %if.then78
  br label %if.end86

if.end86:                                         ; preds = %if.end85, %if.then74
  br label %for.inc87

for.inc87:                                        ; preds = %if.end86
  %94 = load i32, i32* %i, align 4
  %inc88 = add nsw i32 %94, 1
  store i32 %inc88, i32* %i, align 4
  %95 = load float*, float** %col, align 8
  %incdec.ptr89 = getelementptr inbounds float, float* %95, i32 1
  store float* %incdec.ptr89, float** %col, align 8
  br label %for.cond68

for.end90:                                        ; preds = %for.cond68
  br label %for.inc91

for.inc91:                                        ; preds = %for.end90
  %96 = load i32, i32* %j, align 4
  %inc92 = add nsw i32 %96, 1
  store i32 %inc92, i32* %j, align 4
  br label %for.cond61

for.end93:                                        ; preds = %for.cond61
  br label %sw.epilog

sw.bb94:                                          ; preds = %if.end
  %97 = load i32, i32* %scale.addr, align 4
  %mul95 = mul nsw i32 5, %97
  store i32 %mul95, i32* %n, align 4
  %98 = load i32, i32* %n, align 4
  %99 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd96 = getelementptr inbounds %struct.FULL, %struct.FULL* %99, i32 0, i32 0
  store i32 %98, i32* %cd96, align 8
  %100 = load i32, i32* %n, align 4
  %101 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd97 = getelementptr inbounds %struct.FULL, %struct.FULL* %101, i32 0, i32 1
  store i32 %100, i32* %rd97, align 4
  %102 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %103 = load float**, float*** %x.addr, align 8
  %104 = load float**, float*** %b.addr, align 8
  %105 = load float**, float*** %bt.addr, align 8
  %106 = load i32**, i32*** %ipvt.addr, align 8
  %call98 = call i32 @get_space(%struct.FULL* %102, float** %103, float** %104, float** %105, i32** %106)
  %tobool99 = icmp ne i32 %call98, 0
  br i1 %tobool99, label %if.then100, label %if.end101

if.then100:                                       ; preds = %sw.bb94
  store i32 1, i32* %retval, align 4
  br label %return

if.end101:                                        ; preds = %sw.bb94
  %107 = load i32, i32* %test_case.addr, align 4
  %108 = load i32, i32* %n, align 4
  %call102 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.10, i64 0, i64 0), i32 %107, i32 %108)
  store i32 0, i32* %j, align 4
  br label %for.cond103

for.cond103:                                      ; preds = %for.inc122, %if.end101
  %109 = load i32, i32* %j, align 4
  %110 = load i32, i32* %n, align 4
  %cmp104 = icmp slt i32 %109, %110
  br i1 %cmp104, label %for.body106, label %for.end124

for.body106:                                      ; preds = %for.cond103
  store i32 0, i32* %i, align 4
  %111 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd107 = getelementptr inbounds %struct.FULL, %struct.FULL* %111, i32 0, i32 2
  %112 = load i32, i32* %j, align 4
  %idxprom108 = sext i32 %112 to i64
  %arrayidx109 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd107, i64 0, i64 %idxprom108
  %113 = load float*, float** %arrayidx109, align 8
  store float* %113, float** %col, align 8
  br label %for.cond110

for.cond110:                                      ; preds = %for.inc118, %for.body106
  %114 = load i32, i32* %i, align 4
  %115 = load i32, i32* %n, align 4
  %cmp111 = icmp slt i32 %114, %115
  br i1 %cmp111, label %for.body113, label %for.end121

for.body113:                                      ; preds = %for.cond110
  %116 = load i32, i32* %i, align 4
  %117 = load i32, i32* %j, align 4
  %sub114 = sub nsw i32 %116, %117
  %conv115 = sitofp i32 %sub114 to double
  %call116 = call double @pow(double 1.000000e+01, double %conv115) #4
  %conv117 = fptrunc double %call116 to float
  %118 = load float*, float** %col, align 8
  store float %conv117, float* %118, align 4
  br label %for.inc118

for.inc118:                                       ; preds = %for.body113
  %119 = load i32, i32* %i, align 4
  %inc119 = add nsw i32 %119, 1
  store i32 %inc119, i32* %i, align 4
  %120 = load float*, float** %col, align 8
  %incdec.ptr120 = getelementptr inbounds float, float* %120, i32 1
  store float* %incdec.ptr120, float** %col, align 8
  br label %for.cond110

for.end121:                                       ; preds = %for.cond110
  br label %for.inc122

for.inc122:                                       ; preds = %for.end121
  %121 = load i32, i32* %j, align 4
  %inc123 = add nsw i32 %121, 1
  store i32 %inc123, i32* %j, align 4
  br label %for.cond103

for.end124:                                       ; preds = %for.cond103
  br label %sw.epilog

sw.bb125:                                         ; preds = %if.end
  %122 = load i32, i32* %scale.addr, align 4
  %mul126 = mul nsw i32 4, %122
  store i32 %mul126, i32* %n, align 4
  %123 = load i32, i32* %n, align 4
  %124 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd127 = getelementptr inbounds %struct.FULL, %struct.FULL* %124, i32 0, i32 0
  store i32 %123, i32* %cd127, align 8
  %125 = load i32, i32* %n, align 4
  %126 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd128 = getelementptr inbounds %struct.FULL, %struct.FULL* %126, i32 0, i32 1
  store i32 %125, i32* %rd128, align 4
  %127 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %128 = load float**, float*** %x.addr, align 8
  %129 = load float**, float*** %b.addr, align 8
  %130 = load float**, float*** %bt.addr, align 8
  %131 = load i32**, i32*** %ipvt.addr, align 8
  %call129 = call i32 @get_space(%struct.FULL* %127, float** %128, float** %129, float** %130, i32** %131)
  %tobool130 = icmp ne i32 %call129, 0
  br i1 %tobool130, label %if.then131, label %if.end132

if.then131:                                       ; preds = %sw.bb125
  store i32 1, i32* %retval, align 4
  br label %return

if.end132:                                        ; preds = %sw.bb125
  %132 = load i32, i32* %test_case.addr, align 4
  %133 = load i32, i32* %n, align 4
  %call133 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.11, i64 0, i64 0), i32 %132, i32 %133)
  store i32 0, i32* %j, align 4
  br label %for.cond134

for.cond134:                                      ; preds = %for.inc154, %if.end132
  %134 = load i32, i32* %j, align 4
  %135 = load i32, i32* %n, align 4
  %cmp135 = icmp slt i32 %134, %135
  br i1 %cmp135, label %for.body137, label %for.end156

for.body137:                                      ; preds = %for.cond134
  store i32 0, i32* %i, align 4
  %136 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd138 = getelementptr inbounds %struct.FULL, %struct.FULL* %136, i32 0, i32 2
  %137 = load i32, i32* %j, align 4
  %idxprom139 = sext i32 %137 to i64
  %arrayidx140 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd138, i64 0, i64 %idxprom139
  %138 = load float*, float** %arrayidx140, align 8
  store float* %138, float** %col, align 8
  br label %for.cond141

for.cond141:                                      ; preds = %for.inc150, %for.body137
  %139 = load i32, i32* %i, align 4
  %140 = load i32, i32* %n, align 4
  %cmp142 = icmp slt i32 %139, %140
  br i1 %cmp142, label %for.body144, label %for.end153

for.body144:                                      ; preds = %for.cond141
  %141 = load i32, i32* %j, align 4
  %sub145 = sub nsw i32 %141, 2
  %conv146 = sitofp i32 %sub145 to float
  store float %conv146, float* %tu, align 4
  %142 = load i32, i32* %i, align 4
  %add147 = add nsw i32 %142, 1
  %conv148 = sitofp i32 %add147 to float
  store float %conv148, float* %tl, align 4
  %143 = load float, float* %tu, align 4
  %144 = load float, float* %tl, align 4
  %div149 = fdiv float %143, %144
  %145 = load float*, float** %col, align 8
  store float %div149, float* %145, align 4
  br label %for.inc150

for.inc150:                                       ; preds = %for.body144
  %146 = load i32, i32* %i, align 4
  %inc151 = add nsw i32 %146, 1
  store i32 %inc151, i32* %i, align 4
  %147 = load float*, float** %col, align 8
  %incdec.ptr152 = getelementptr inbounds float, float* %147, i32 1
  store float* %incdec.ptr152, float** %col, align 8
  br label %for.cond141

for.end153:                                       ; preds = %for.cond141
  br label %for.inc154

for.inc154:                                       ; preds = %for.end153
  %148 = load i32, i32* %j, align 4
  %inc155 = add nsw i32 %148, 1
  store i32 %inc155, i32* %j, align 4
  br label %for.cond134

for.end156:                                       ; preds = %for.cond134
  br label %sw.epilog

sw.bb157:                                         ; preds = %if.end
  %149 = load i32, i32* %scale.addr, align 4
  %mul158 = mul nsw i32 6, %149
  store i32 %mul158, i32* %n, align 4
  %150 = load i32, i32* %n, align 4
  %151 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd159 = getelementptr inbounds %struct.FULL, %struct.FULL* %151, i32 0, i32 0
  store i32 %150, i32* %cd159, align 8
  %152 = load i32, i32* %n, align 4
  %153 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd160 = getelementptr inbounds %struct.FULL, %struct.FULL* %153, i32 0, i32 1
  store i32 %152, i32* %rd160, align 4
  %154 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %155 = load float**, float*** %x.addr, align 8
  %156 = load float**, float*** %b.addr, align 8
  %157 = load float**, float*** %bt.addr, align 8
  %158 = load i32**, i32*** %ipvt.addr, align 8
  %call161 = call i32 @get_space(%struct.FULL* %154, float** %155, float** %156, float** %157, i32** %158)
  %tobool162 = icmp ne i32 %call161, 0
  br i1 %tobool162, label %if.then163, label %if.end164

if.then163:                                       ; preds = %sw.bb157
  store i32 1, i32* %retval, align 4
  br label %return

if.end164:                                        ; preds = %sw.bb157
  %159 = load i32, i32* %test_case.addr, align 4
  %160 = load i32, i32* %n, align 4
  %call165 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.12, i64 0, i64 0), i32 %159, i32 %160)
  store i32 0, i32* %j, align 4
  br label %for.cond166

for.cond166:                                      ; preds = %for.inc189, %if.end164
  %161 = load i32, i32* %j, align 4
  %162 = load i32, i32* %n, align 4
  %cmp167 = icmp slt i32 %161, %162
  br i1 %cmp167, label %for.body169, label %for.end191

for.body169:                                      ; preds = %for.cond166
  store i32 0, i32* %i, align 4
  %163 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd170 = getelementptr inbounds %struct.FULL, %struct.FULL* %163, i32 0, i32 2
  %164 = load i32, i32* %j, align 4
  %idxprom171 = sext i32 %164 to i64
  %arrayidx172 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd170, i64 0, i64 %idxprom171
  %165 = load float*, float** %arrayidx172, align 8
  store float* %165, float** %col, align 8
  br label %for.cond173

for.cond173:                                      ; preds = %for.inc185, %for.body169
  %166 = load i32, i32* %i, align 4
  %167 = load i32, i32* %n, align 4
  %cmp174 = icmp slt i32 %166, %167
  br i1 %cmp174, label %for.body176, label %for.end188

for.body176:                                      ; preds = %for.cond173
  %168 = load i32, i32* %i, align 4
  %169 = load i32, i32* %j, align 4
  %cmp177 = icmp sgt i32 %168, %169
  br i1 %cmp177, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body176
  br label %cond.end

cond.false:                                       ; preds = %for.body176
  %170 = load i32, i32* %i, align 4
  %171 = load i32, i32* %j, align 4
  %sub179 = sub nsw i32 %170, %171
  %add180 = add nsw i32 %sub179, 1
  %conv181 = sitofp i32 %add180 to float
  %conv182 = fpext float %conv181 to double
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond183 = phi double [ 0.000000e+00, %cond.true ], [ %conv182, %cond.false ]
  %conv184 = fptrunc double %cond183 to float
  %172 = load float*, float** %col, align 8
  store float %conv184, float* %172, align 4
  br label %for.inc185

for.inc185:                                       ; preds = %cond.end
  %173 = load i32, i32* %i, align 4
  %inc186 = add nsw i32 %173, 1
  store i32 %inc186, i32* %i, align 4
  %174 = load float*, float** %col, align 8
  %incdec.ptr187 = getelementptr inbounds float, float* %174, i32 1
  store float* %incdec.ptr187, float** %col, align 8
  br label %for.cond173

for.end188:                                       ; preds = %for.cond173
  br label %for.inc189

for.inc189:                                       ; preds = %for.end188
  %175 = load i32, i32* %j, align 4
  %inc190 = add nsw i32 %175, 1
  store i32 %inc190, i32* %j, align 4
  br label %for.cond166

for.end191:                                       ; preds = %for.cond166
  br label %sw.epilog

sw.bb192:                                         ; preds = %if.end
  %176 = load i32, i32* %scale.addr, align 4
  %mul193 = mul nsw i32 6, %176
  store i32 %mul193, i32* %n, align 4
  %177 = load i32, i32* %n, align 4
  %178 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd194 = getelementptr inbounds %struct.FULL, %struct.FULL* %178, i32 0, i32 0
  store i32 %177, i32* %cd194, align 8
  %179 = load i32, i32* %n, align 4
  %180 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd195 = getelementptr inbounds %struct.FULL, %struct.FULL* %180, i32 0, i32 1
  store i32 %179, i32* %rd195, align 4
  %181 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %182 = load float**, float*** %x.addr, align 8
  %183 = load float**, float*** %b.addr, align 8
  %184 = load float**, float*** %bt.addr, align 8
  %185 = load i32**, i32*** %ipvt.addr, align 8
  %call196 = call i32 @get_space(%struct.FULL* %181, float** %182, float** %183, float** %184, i32** %185)
  %tobool197 = icmp ne i32 %call196, 0
  br i1 %tobool197, label %if.then198, label %if.end199

if.then198:                                       ; preds = %sw.bb192
  store i32 1, i32* %retval, align 4
  br label %return

if.end199:                                        ; preds = %sw.bb192
  %186 = load i32, i32* %test_case.addr, align 4
  %187 = load i32, i32* %n, align 4
  %call200 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.13, i64 0, i64 0), i32 %186, i32 %187)
  store i32 0, i32* %j, align 4
  br label %for.cond201

for.cond201:                                      ; preds = %for.inc227, %if.end199
  %188 = load i32, i32* %j, align 4
  %189 = load i32, i32* %n, align 4
  %cmp202 = icmp slt i32 %188, %189
  br i1 %cmp202, label %for.body204, label %for.end229

for.body204:                                      ; preds = %for.cond201
  store i32 0, i32* %i, align 4
  %190 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd205 = getelementptr inbounds %struct.FULL, %struct.FULL* %190, i32 0, i32 2
  %191 = load i32, i32* %j, align 4
  %idxprom206 = sext i32 %191 to i64
  %arrayidx207 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd205, i64 0, i64 %idxprom206
  %192 = load float*, float** %arrayidx207, align 8
  store float* %192, float** %col, align 8
  br label %for.cond208

for.cond208:                                      ; preds = %for.inc223, %for.body204
  %193 = load i32, i32* %i, align 4
  %194 = load i32, i32* %n, align 4
  %cmp209 = icmp slt i32 %193, %194
  br i1 %cmp209, label %for.body211, label %for.end226

for.body211:                                      ; preds = %for.cond208
  %195 = load i32, i32* %i, align 4
  %196 = load i32, i32* %j, align 4
  %cmp212 = icmp slt i32 %195, %196
  br i1 %cmp212, label %cond.true214, label %cond.false215

cond.true214:                                     ; preds = %for.body211
  br label %cond.end220

cond.false215:                                    ; preds = %for.body211
  %197 = load i32, i32* %i, align 4
  %198 = load i32, i32* %j, align 4
  %sub216 = sub nsw i32 %197, %198
  %add217 = add nsw i32 %sub216, 1
  %conv218 = sitofp i32 %add217 to float
  %conv219 = fpext float %conv218 to double
  br label %cond.end220

cond.end220:                                      ; preds = %cond.false215, %cond.true214
  %cond221 = phi double [ 0.000000e+00, %cond.true214 ], [ %conv219, %cond.false215 ]
  %conv222 = fptrunc double %cond221 to float
  %199 = load float*, float** %col, align 8
  store float %conv222, float* %199, align 4
  br label %for.inc223

for.inc223:                                       ; preds = %cond.end220
  %200 = load i32, i32* %i, align 4
  %inc224 = add nsw i32 %200, 1
  store i32 %inc224, i32* %i, align 4
  %201 = load float*, float** %col, align 8
  %incdec.ptr225 = getelementptr inbounds float, float* %201, i32 1
  store float* %incdec.ptr225, float** %col, align 8
  br label %for.cond208

for.end226:                                       ; preds = %for.cond208
  br label %for.inc227

for.inc227:                                       ; preds = %for.end226
  %202 = load i32, i32* %j, align 4
  %inc228 = add nsw i32 %202, 1
  store i32 %inc228, i32* %j, align 4
  br label %for.cond201

for.end229:                                       ; preds = %for.cond201
  br label %sw.epilog

sw.bb230:                                         ; preds = %if.end
  %203 = load i32, i32* %scale.addr, align 4
  %mul231 = mul nsw i32 5, %203
  store i32 %mul231, i32* %n, align 4
  %204 = load i32, i32* %n, align 4
  %205 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd232 = getelementptr inbounds %struct.FULL, %struct.FULL* %205, i32 0, i32 0
  store i32 %204, i32* %cd232, align 8
  %206 = load i32, i32* %n, align 4
  %207 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd233 = getelementptr inbounds %struct.FULL, %struct.FULL* %207, i32 0, i32 1
  store i32 %206, i32* %rd233, align 4
  %208 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %209 = load float**, float*** %x.addr, align 8
  %210 = load float**, float*** %b.addr, align 8
  %211 = load float**, float*** %bt.addr, align 8
  %212 = load i32**, i32*** %ipvt.addr, align 8
  %call234 = call i32 @get_space(%struct.FULL* %208, float** %209, float** %210, float** %211, i32** %212)
  %tobool235 = icmp ne i32 %call234, 0
  br i1 %tobool235, label %if.then236, label %if.end237

if.then236:                                       ; preds = %sw.bb230
  store i32 1, i32* %retval, align 4
  br label %return

if.end237:                                        ; preds = %sw.bb230
  %213 = load i32, i32* %test_case.addr, align 4
  %214 = load i32, i32* %n, align 4
  %call238 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.14, i64 0, i64 0), i32 %213, i32 %214, double 0x47D2CED32A16A1B1)
  %215 = load i32, i32* %n, align 4
  %216 = load i32, i32* %n, align 4
  %mul239 = mul nsw i32 %215, %216
  %conv240 = sitofp i32 %mul239 to float
  store float %conv240, float* %tl, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond241

for.cond241:                                      ; preds = %for.inc273, %if.end237
  %217 = load i32, i32* %j, align 4
  %218 = load i32, i32* %n, align 4
  %cmp242 = icmp slt i32 %217, %218
  br i1 %cmp242, label %for.body244, label %for.end275

for.body244:                                      ; preds = %for.cond241
  store i32 0, i32* %i, align 4
  %219 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd245 = getelementptr inbounds %struct.FULL, %struct.FULL* %219, i32 0, i32 2
  %220 = load i32, i32* %j, align 4
  %idxprom246 = sext i32 %220 to i64
  %arrayidx247 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd245, i64 0, i64 %idxprom246
  %221 = load float*, float** %arrayidx247, align 8
  store float* %221, float** %col, align 8
  br label %for.cond248

for.cond248:                                      ; preds = %for.inc269, %for.body244
  %222 = load i32, i32* %i, align 4
  %223 = load i32, i32* %n, align 4
  %cmp249 = icmp slt i32 %222, %223
  br i1 %cmp249, label %for.body251, label %for.end272

for.body251:                                      ; preds = %for.cond248
  %224 = load i32, i32* %j, align 4
  %add252 = add nsw i32 %224, 1
  %conv253 = sitofp i32 %add252 to float
  %225 = load i32, i32* %i, align 4
  %226 = load i32, i32* %j, align 4
  %cmp254 = icmp sgt i32 %225, %226
  br i1 %cmp254, label %cond.true256, label %cond.false258

cond.true256:                                     ; preds = %for.body251
  %227 = load i32, i32* %i, align 4
  %add257 = add nsw i32 %227, 1
  br label %cond.end260

cond.false258:                                    ; preds = %for.body251
  %228 = load i32, i32* %j, align 4
  %add259 = add nsw i32 %228, 1
  br label %cond.end260

cond.end260:                                      ; preds = %cond.false258, %cond.true256
  %cond261 = phi i32 [ %add257, %cond.true256 ], [ %add259, %cond.false258 ]
  %conv262 = sitofp i32 %cond261 to float
  %div263 = fdiv float %conv253, %conv262
  store float %div263, float* %tu, align 4
  %229 = load float, float* %tu, align 4
  %conv264 = fpext float %229 to double
  %mul265 = fmul double 0x47D2CED32A16A1B1, %conv264
  %230 = load float, float* %tl, align 4
  %conv266 = fpext float %230 to double
  %div267 = fdiv double %mul265, %conv266
  %conv268 = fptrunc double %div267 to float
  %231 = load float*, float** %col, align 8
  store float %conv268, float* %231, align 4
  br label %for.inc269

for.inc269:                                       ; preds = %cond.end260
  %232 = load i32, i32* %i, align 4
  %inc270 = add nsw i32 %232, 1
  store i32 %inc270, i32* %i, align 4
  %233 = load float*, float** %col, align 8
  %incdec.ptr271 = getelementptr inbounds float, float* %233, i32 1
  store float* %incdec.ptr271, float** %col, align 8
  br label %for.cond248

for.end272:                                       ; preds = %for.cond248
  br label %for.inc273

for.inc273:                                       ; preds = %for.end272
  %234 = load i32, i32* %j, align 4
  %inc274 = add nsw i32 %234, 1
  store i32 %inc274, i32* %j, align 4
  br label %for.cond241

for.end275:                                       ; preds = %for.cond241
  br label %sw.epilog

sw.bb276:                                         ; preds = %if.end
  %235 = load i32, i32* %scale.addr, align 4
  %mul277 = mul nsw i32 5, %235
  store i32 %mul277, i32* %n, align 4
  %236 = load i32, i32* %n, align 4
  %237 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd278 = getelementptr inbounds %struct.FULL, %struct.FULL* %237, i32 0, i32 0
  store i32 %236, i32* %cd278, align 8
  %238 = load i32, i32* %n, align 4
  %239 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd279 = getelementptr inbounds %struct.FULL, %struct.FULL* %239, i32 0, i32 1
  store i32 %238, i32* %rd279, align 4
  %240 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %241 = load float**, float*** %x.addr, align 8
  %242 = load float**, float*** %b.addr, align 8
  %243 = load float**, float*** %bt.addr, align 8
  %244 = load i32**, i32*** %ipvt.addr, align 8
  %call280 = call i32 @get_space(%struct.FULL* %240, float** %241, float** %242, float** %243, i32** %244)
  %tobool281 = icmp ne i32 %call280, 0
  br i1 %tobool281, label %if.then282, label %if.end283

if.then282:                                       ; preds = %sw.bb276
  store i32 1, i32* %retval, align 4
  br label %return

if.end283:                                        ; preds = %sw.bb276
  %245 = load i32, i32* %test_case.addr, align 4
  %246 = load i32, i32* %n, align 4
  %call284 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.15, i64 0, i64 0), i32 %245, i32 %246, double 0x380B38FB9DAA78E4)
  %247 = load i32, i32* %n, align 4
  %248 = load i32, i32* %n, align 4
  %mul285 = mul nsw i32 %247, %248
  %conv286 = sitofp i32 %mul285 to float
  store float %conv286, float* %tl, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond287

for.cond287:                                      ; preds = %for.inc318, %if.end283
  %249 = load i32, i32* %j, align 4
  %250 = load i32, i32* %n, align 4
  %cmp288 = icmp slt i32 %249, %250
  br i1 %cmp288, label %for.body290, label %for.end320

for.body290:                                      ; preds = %for.cond287
  store i32 0, i32* %i, align 4
  %251 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd291 = getelementptr inbounds %struct.FULL, %struct.FULL* %251, i32 0, i32 2
  %252 = load i32, i32* %j, align 4
  %idxprom292 = sext i32 %252 to i64
  %arrayidx293 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd291, i64 0, i64 %idxprom292
  %253 = load float*, float** %arrayidx293, align 8
  store float* %253, float** %col, align 8
  br label %for.cond294

for.cond294:                                      ; preds = %for.inc314, %for.body290
  %254 = load i32, i32* %i, align 4
  %255 = load i32, i32* %n, align 4
  %cmp295 = icmp slt i32 %254, %255
  br i1 %cmp295, label %for.body297, label %for.end317

for.body297:                                      ; preds = %for.cond294
  %256 = load i32, i32* %i, align 4
  %257 = load i32, i32* %j, align 4
  %cmp298 = icmp sgt i32 %256, %257
  br i1 %cmp298, label %cond.true300, label %cond.false302

cond.true300:                                     ; preds = %for.body297
  %258 = load i32, i32* %i, align 4
  %add301 = add nsw i32 %258, 1
  br label %cond.end304

cond.false302:                                    ; preds = %for.body297
  %259 = load i32, i32* %j, align 4
  %add303 = add nsw i32 %259, 1
  br label %cond.end304

cond.end304:                                      ; preds = %cond.false302, %cond.true300
  %cond305 = phi i32 [ %add301, %cond.true300 ], [ %add303, %cond.false302 ]
  %conv306 = sitofp i32 %cond305 to float
  %260 = load i32, i32* %j, align 4
  %add307 = add nsw i32 %260, 1
  %conv308 = sitofp i32 %add307 to float
  %div309 = fdiv float %conv306, %conv308
  store float %div309, float* %tu, align 4
  %261 = load float, float* %tu, align 4
  %262 = load float, float* %tl, align 4
  %mul310 = fmul float %261, %262
  %conv311 = fpext float %mul310 to double
  %div312 = fdiv double %conv311, 0x47D2CED32A16A1B1
  %conv313 = fptrunc double %div312 to float
  %263 = load float*, float** %col, align 8
  store float %conv313, float* %263, align 4
  br label %for.inc314

for.inc314:                                       ; preds = %cond.end304
  %264 = load i32, i32* %i, align 4
  %inc315 = add nsw i32 %264, 1
  store i32 %inc315, i32* %i, align 4
  %265 = load float*, float** %col, align 8
  %incdec.ptr316 = getelementptr inbounds float, float* %265, i32 1
  store float* %incdec.ptr316, float** %col, align 8
  br label %for.cond294

for.end317:                                       ; preds = %for.cond294
  br label %for.inc318

for.inc318:                                       ; preds = %for.end317
  %266 = load i32, i32* %j, align 4
  %inc319 = add nsw i32 %266, 1
  store i32 %inc319, i32* %j, align 4
  br label %for.cond287

for.end320:                                       ; preds = %for.cond287
  br label %sw.epilog

sw.default:                                       ; preds = %if.end
  %call321 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.16, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %for.end320, %for.end275, %for.end229, %for.end191, %for.end156, %for.end124, %for.end93, %if.end37, %for.end30
  %267 = load float**, float*** %x.addr, align 8
  %268 = load float*, float** %267, align 8
  store float 1.000000e+00, float* %268, align 4
  %269 = load i32, i32* %n, align 4
  %cmp322 = icmp sgt i32 %269, 1
  br i1 %cmp322, label %if.then324, label %if.end325

if.then324:                                       ; preds = %sw.epilog
  %270 = load float**, float*** %bt.addr, align 8
  %271 = load float*, float** %270, align 8
  store float 0.000000e+00, float* %271, align 4
  br label %if.end325

if.end325:                                        ; preds = %if.then324, %sw.epilog
  %272 = load i32, i32* %n, align 4
  %cmp326 = icmp sgt i32 %272, 2
  br i1 %cmp326, label %if.then328, label %if.end339

if.then328:                                       ; preds = %if.end325
  store i32 2, i32* %i, align 4
  %273 = load float**, float*** %x.addr, align 8
  %274 = load float*, float** %273, align 8
  %add.ptr = getelementptr inbounds float, float* %274, i64 2
  store float* %add.ptr, float** %col, align 8
  br label %for.cond329

for.cond329:                                      ; preds = %for.inc335, %if.then328
  %275 = load i32, i32* %i, align 4
  %276 = load i32, i32* %n, align 4
  %cmp330 = icmp slt i32 %275, %276
  br i1 %cmp330, label %for.body332, label %for.end338

for.body332:                                      ; preds = %for.cond329
  %277 = load float*, float** %col, align 8
  %add.ptr333 = getelementptr inbounds float, float* %277, i64 -2
  %278 = load float, float* %add.ptr333, align 4
  %sub334 = fsub float -0.000000e+00, %278
  %279 = load float*, float** %col, align 8
  store float %sub334, float* %279, align 4
  br label %for.inc335

for.inc335:                                       ; preds = %for.body332
  %280 = load i32, i32* %i, align 4
  %inc336 = add nsw i32 %280, 1
  store i32 %inc336, i32* %i, align 4
  %281 = load float*, float** %col, align 8
  %incdec.ptr337 = getelementptr inbounds float, float* %281, i32 1
  store float* %incdec.ptr337, float** %col, align 8
  br label %for.cond329

for.end338:                                       ; preds = %for.cond329
  br label %if.end339

if.end339:                                        ; preds = %for.end338, %if.end325
  %282 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %283 = load float**, float*** %x.addr, align 8
  %284 = load float*, float** %283, align 8
  %285 = load float**, float*** %b.addr, align 8
  %286 = load float*, float** %285, align 8
  %call340 = call i32 @matvec(%struct.FULL* %282, float* %284, float* %286, i32 0)
  %tobool341 = icmp ne i32 %call340, 0
  br i1 %tobool341, label %if.then342, label %if.end344

if.then342:                                       ; preds = %if.end339
  %call343 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.17, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end344:                                        ; preds = %if.end339
  %287 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %288 = load float**, float*** %x.addr, align 8
  %289 = load float*, float** %288, align 8
  %290 = load float**, float*** %bt.addr, align 8
  %291 = load float*, float** %290, align 8
  %call345 = call i32 @matvec(%struct.FULL* %287, float* %289, float* %291, i32 1)
  %tobool346 = icmp ne i32 %call345, 0
  br i1 %tobool346, label %if.then347, label %if.end349

if.then347:                                       ; preds = %if.end344
  %call348 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.17, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end349:                                        ; preds = %if.end344
  %292 = load i32, i32* %n, align 4
  %cmp350 = icmp sle i32 %292, 7
  br i1 %cmp350, label %if.then352, label %if.end353

if.then352:                                       ; preds = %if.end349
  %293 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  call void @matdump(%struct.FULL* %293, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.18, i64 0, i64 0))
  br label %if.end353

if.end353:                                        ; preds = %if.then352, %if.end349
  %294 = load i32, i32* %n, align 4
  %cmp354 = icmp sle i32 %294, 7
  br i1 %cmp354, label %if.then356, label %if.end357

if.then356:                                       ; preds = %if.end353
  %295 = load float**, float*** %x.addr, align 8
  %296 = load float*, float** %295, align 8
  %297 = load i32, i32* %n, align 4
  call void @fvecdump(float* %296, i32 %297, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.19, i64 0, i64 0))
  %298 = load float**, float*** %b.addr, align 8
  %299 = load float*, float** %298, align 8
  %300 = load i32, i32* %n, align 4
  call void @fvecdump(float* %299, i32 %300, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.20, i64 0, i64 0))
  %301 = load float**, float*** %bt.addr, align 8
  %302 = load float*, float** %301, align 8
  %303 = load i32, i32* %n, align 4
  call void @fvecdump(float* %302, i32 %303, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.21, i64 0, i64 0))
  br label %if.end357

if.end357:                                        ; preds = %if.then356, %if.end353
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end357, %if.then347, %if.then342, %sw.default, %if.then282, %if.then236, %if.then198, %if.then163, %if.then131, %if.then100, %if.then50, %if.then36, %if.then5
  %304 = load i32, i32* %retval, align 4
  ret i32 %304
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn
declare dso_local void @exit(i32) #3

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @matdump(%struct.FULL* %a, i8* %head) #0 {
entry:
  %a.addr = alloca %struct.FULL*, align 8
  %head.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %jj = alloca i32, align 4
  %ncolmod = alloca i32, align 4
  %ncolrem = alloca i32, align 4
  store %struct.FULL* %a, %struct.FULL** %a.addr, align 8
  store i8* %head, i8** %head.addr, align 8
  %0 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd = getelementptr inbounds %struct.FULL, %struct.FULL* %0, i32 0, i32 0
  %1 = load i32, i32* %cd, align 8
  %div = sdiv i32 %1, 6
  store i32 %div, i32* %ncolmod, align 4
  %2 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd1 = getelementptr inbounds %struct.FULL, %struct.FULL* %2, i32 0, i32 0
  %3 = load i32, i32* %cd1, align 8
  %4 = load i32, i32* %ncolmod, align 4
  %mul = mul nsw i32 %4, 6
  %sub = sub nsw i32 %3, %mul
  store i32 %sub, i32* %ncolrem, align 4
  %5 = load i8*, i8** %head.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.24, i64 0, i64 0), i8* %5)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc32, %entry
  %6 = load i32, i32* %i, align 4
  %7 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd = getelementptr inbounds %struct.FULL, %struct.FULL* %7, i32 0, i32 1
  %8 = load i32, i32* %rd, align 4
  %cmp = icmp slt i32 %6, %8
  br i1 %cmp, label %for.body, label %for.end34

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i64 0, i64 0), i32 %9)
  store i32 0, i32* %j, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc13, %for.body
  %10 = load i32, i32* %k, align 4
  %11 = load i32, i32* %ncolmod, align 4
  %cmp4 = icmp slt i32 %10, %11
  br i1 %cmp4, label %for.body5, label %for.end15

for.body5:                                        ; preds = %for.cond3
  %12 = load i32, i32* %k, align 4
  %tobool = icmp ne i32 %12, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body5
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.26, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body5
  store i32 0, i32* %jj, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc, %if.end
  %13 = load i32, i32* %jj, align 4
  %cmp8 = icmp slt i32 %13, 6
  br i1 %cmp8, label %for.body9, label %for.end

for.body9:                                        ; preds = %for.cond7
  %14 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd = getelementptr inbounds %struct.FULL, %struct.FULL* %14, i32 0, i32 2
  %15 = load i32, i32* %j, align 4
  %idxprom = sext i32 %15 to i64
  %arrayidx = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd, i64 0, i64 %idxprom
  %16 = load float*, float** %arrayidx, align 8
  %17 = load i32, i32* %i, align 4
  %idx.ext = sext i32 %17 to i64
  %add.ptr = getelementptr inbounds float, float* %16, i64 %idx.ext
  %18 = load float, float* %add.ptr, align 4
  %conv = fpext float %18 to double
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.27, i64 0, i64 0), double %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body9
  %19 = load i32, i32* %jj, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* %jj, align 4
  %20 = load i32, i32* %j, align 4
  %inc11 = add nsw i32 %20, 1
  store i32 %inc11, i32* %j, align 4
  br label %for.cond7

for.end:                                          ; preds = %for.cond7
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.28, i64 0, i64 0))
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %21 = load i32, i32* %k, align 4
  %inc14 = add nsw i32 %21, 1
  store i32 %inc14, i32* %k, align 4
  br label %for.cond3

for.end15:                                        ; preds = %for.cond3
  store i32 0, i32* %jj, align 4
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc27, %for.end15
  %22 = load i32, i32* %jj, align 4
  %23 = load i32, i32* %ncolrem, align 4
  %cmp17 = icmp slt i32 %22, %23
  br i1 %cmp17, label %for.body19, label %for.end30

for.body19:                                       ; preds = %for.cond16
  %24 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd20 = getelementptr inbounds %struct.FULL, %struct.FULL* %24, i32 0, i32 2
  %25 = load i32, i32* %j, align 4
  %idxprom21 = sext i32 %25 to i64
  %arrayidx22 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd20, i64 0, i64 %idxprom21
  %26 = load float*, float** %arrayidx22, align 8
  %27 = load i32, i32* %i, align 4
  %idx.ext23 = sext i32 %27 to i64
  %add.ptr24 = getelementptr inbounds float, float* %26, i64 %idx.ext23
  %28 = load float, float* %add.ptr24, align 4
  %conv25 = fpext float %28 to double
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.27, i64 0, i64 0), double %conv25)
  br label %for.inc27

for.inc27:                                        ; preds = %for.body19
  %29 = load i32, i32* %jj, align 4
  %inc28 = add nsw i32 %29, 1
  store i32 %inc28, i32* %jj, align 4
  %30 = load i32, i32* %j, align 4
  %inc29 = add nsw i32 %30, 1
  store i32 %inc29, i32* %j, align 4
  br label %for.cond16

for.end30:                                        ; preds = %for.cond16
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.28, i64 0, i64 0))
  br label %for.inc32

for.inc32:                                        ; preds = %for.end30
  %31 = load i32, i32* %i, align 4
  %inc33 = add nsw i32 %31, 1
  store i32 %inc33, i32* %i, align 4
  br label %for.cond

for.end34:                                        ; preds = %for.cond
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.28, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @fvecdump(float* %vec, i32 %len, i8* %head) #0 {
entry:
  %vec.addr = alloca float*, align 8
  %len.addr = alloca i32, align 4
  %head.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %count = alloca i32, align 4
  %lenmod = alloca i32, align 4
  %lenrem = alloca i32, align 4
  store float* %vec, float** %vec.addr, align 8
  store i32 %len, i32* %len.addr, align 4
  store i8* %head, i8** %head.addr, align 8
  %0 = load i32, i32* %len.addr, align 4
  %div = sdiv i32 %0, 6
  store i32 %div, i32* %lenmod, align 4
  %1 = load i32, i32* %len.addr, align 4
  %2 = load i32, i32* %lenmod, align 4
  %mul = mul nsw i32 %2, 6
  %sub = sub nsw i32 %1, %mul
  store i32 %sub, i32* %lenrem, align 4
  %3 = load i8*, i8** %head.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.24, i64 0, i64 0), i8* %3)
  store i32 0, i32* %count, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %4 = load i32, i32* %j, align 4
  %5 = load i32, i32* %lenmod, align 4
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %count, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i64 0, i64 0), i32 %6)
  store i32 0, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %7 = load i32, i32* %i, align 4
  %cmp3 = icmp slt i32 %7, 6
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %8 = load float*, float** %vec.addr, align 8
  %9 = load float, float* %8, align 4
  %conv = fpext float %9 to double
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.27, i64 0, i64 0), double %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  %11 = load float*, float** %vec.addr, align 8
  %incdec.ptr = getelementptr inbounds float, float* %11, i32 1
  store float* %incdec.ptr, float** %vec.addr, align 8
  %12 = load i32, i32* %count, align 4
  %inc6 = add nsw i32 %12, 1
  store i32 %inc6, i32* %count, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.28, i64 0, i64 0))
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %13 = load i32, i32* %j, align 4
  %inc9 = add nsw i32 %13, 1
  store i32 %inc9, i32* %j, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  %14 = load i32, i32* %lenrem, align 4
  %tobool = icmp ne i32 %14, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end10
  %15 = load i32, i32* %count, align 4
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i64 0, i64 0), i32 %15)
  store i32 0, i32* %i, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc18, %if.then
  %16 = load i32, i32* %i, align 4
  %17 = load i32, i32* %lenrem, align 4
  %cmp13 = icmp slt i32 %16, %17
  br i1 %cmp13, label %for.body15, label %for.end21

for.body15:                                       ; preds = %for.cond12
  %18 = load float*, float** %vec.addr, align 8
  %19 = load float, float* %18, align 4
  %conv16 = fpext float %19 to double
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.27, i64 0, i64 0), double %conv16)
  br label %for.inc18

for.inc18:                                        ; preds = %for.body15
  %20 = load i32, i32* %i, align 4
  %inc19 = add nsw i32 %20, 1
  store i32 %inc19, i32* %i, align 4
  %21 = load float*, float** %vec.addr, align 8
  %incdec.ptr20 = getelementptr inbounds float, float* %21, i32 1
  store float* %incdec.ptr20, float** %vec.addr, align 8
  br label %for.cond12

for.end21:                                        ; preds = %for.cond12
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.28, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %for.end21, %for.end10
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.28, i64 0, i64 0))
  ret void
}

declare dso_local void @free(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @get_space(%struct.FULL* %a, float** %x, float** %b, float** %bt, i32** %ipvt) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca %struct.FULL*, align 8
  %x.addr = alloca float**, align 8
  %b.addr = alloca float**, align 8
  %bt.addr = alloca float**, align 8
  %ipvt.addr = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store %struct.FULL* %a, %struct.FULL** %a.addr, align 8
  store float** %x, float*** %x.addr, align 8
  store float** %b, float*** %b.addr, align 8
  store float** %bt, float*** %bt.addr, align 8
  store i32** %ipvt, i32*** %ipvt.addr, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %j, align 4
  %1 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd = getelementptr inbounds %struct.FULL, %struct.FULL* %1, i32 0, i32 1
  %2 = load i32, i32* %rd, align 4
  %cmp = icmp slt i32 %0, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd = getelementptr inbounds %struct.FULL, %struct.FULL* %3, i32 0, i32 0
  %4 = load i32, i32* %cd, align 8
  %conv = sext i32 %4 to i64
  %mul = mul i64 %conv, 4
  %call = call i8* (i64, ...) bitcast (i8* (...)* @malloc to i8* (i64, ...)*)(i64 %mul)
  %5 = bitcast i8* %call to float*
  %6 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd = getelementptr inbounds %struct.FULL, %struct.FULL* %6, i32 0, i32 2
  %7 = load i32, i32* %j, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd, i64 0, i64 %idxprom
  store float* %5, float** %arrayidx, align 8
  %8 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd1 = getelementptr inbounds %struct.FULL, %struct.FULL* %8, i32 0, i32 2
  %9 = load i32, i32* %j, align 4
  %idxprom2 = sext i32 %9 to i64
  %arrayidx3 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd1, i64 0, i64 %idxprom2
  %10 = load float*, float** %arrayidx3, align 8
  %cmp4 = icmp eq float* %10, null
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.22, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %j, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd7 = getelementptr inbounds %struct.FULL, %struct.FULL* %12, i32 0, i32 0
  %13 = load i32, i32* %cd7, align 8
  %conv8 = sext i32 %13 to i64
  %mul9 = mul i64 %conv8, 4
  %call10 = call i8* (i64, ...) bitcast (i8* (...)* @malloc to i8* (i64, ...)*)(i64 %mul9)
  %14 = bitcast i8* %call10 to float*
  %15 = load float**, float*** %x.addr, align 8
  store float* %14, float** %15, align 8
  %16 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd11 = getelementptr inbounds %struct.FULL, %struct.FULL* %16, i32 0, i32 0
  %17 = load i32, i32* %cd11, align 8
  %conv12 = sext i32 %17 to i64
  %mul13 = mul i64 %conv12, 4
  %call14 = call i8* (i64, ...) bitcast (i8* (...)* @malloc to i8* (i64, ...)*)(i64 %mul13)
  %18 = bitcast i8* %call14 to float*
  %19 = load float**, float*** %b.addr, align 8
  store float* %18, float** %19, align 8
  %20 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd15 = getelementptr inbounds %struct.FULL, %struct.FULL* %20, i32 0, i32 0
  %21 = load i32, i32* %cd15, align 8
  %conv16 = sext i32 %21 to i64
  %mul17 = mul i64 %conv16, 4
  %call18 = call i8* (i64, ...) bitcast (i8* (...)* @malloc to i8* (i64, ...)*)(i64 %mul17)
  %22 = bitcast i8* %call18 to float*
  %23 = load float**, float*** %bt.addr, align 8
  store float* %22, float** %23, align 8
  %24 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd19 = getelementptr inbounds %struct.FULL, %struct.FULL* %24, i32 0, i32 0
  %25 = load i32, i32* %cd19, align 8
  %conv20 = sext i32 %25 to i64
  %mul21 = mul i64 %conv20, 4
  %call22 = call i8* (i64, ...) bitcast (i8* (...)* @malloc to i8* (i64, ...)*)(i64 %mul21)
  %26 = bitcast i8* %call22 to i32*
  %27 = load i32**, i32*** %ipvt.addr, align 8
  store i32* %26, i32** %27, align 8
  %28 = load float**, float*** %x.addr, align 8
  %29 = load float*, float** %28, align 8
  %cmp23 = icmp eq float* %29, null
  br i1 %cmp23, label %if.then33, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %30 = load float**, float*** %b.addr, align 8
  %31 = load float*, float** %30, align 8
  %cmp25 = icmp eq float* %31, null
  br i1 %cmp25, label %if.then33, label %lor.lhs.false27

lor.lhs.false27:                                  ; preds = %lor.lhs.false
  %32 = load float**, float*** %bt.addr, align 8
  %33 = load float*, float** %32, align 8
  %cmp28 = icmp eq float* %33, null
  br i1 %cmp28, label %if.then33, label %lor.lhs.false30

lor.lhs.false30:                                  ; preds = %lor.lhs.false27
  %34 = load i32**, i32*** %ipvt.addr, align 8
  %35 = load i32*, i32** %34, align 8
  %cmp31 = icmp eq i32* %35, null
  br i1 %cmp31, label %if.then33, label %if.end35

if.then33:                                        ; preds = %lor.lhs.false30, %lor.lhs.false27, %lor.lhs.false, %for.end
  %call34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.23, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end35:                                         ; preds = %lor.lhs.false30
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end35, %if.then33, %if.then
  %36 = load i32, i32* %retval, align 4
  ret i32 %36
}

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @matvec(%struct.FULL* %a, float* %x, float* %b, i32 %job) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca %struct.FULL*, align 8
  %x.addr = alloca float*, align 8
  %b.addr = alloca float*, align 8
  %job.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %px = alloca float*, align 8
  %pb = alloca float*, align 8
  %col = alloca float*, align 8
  %row = alloca float*, align 8
  store %struct.FULL* %a, %struct.FULL** %a.addr, align 8
  store float* %x, float** %x.addr, align 8
  store float* %b, float** %b.addr, align 8
  store i32 %job, i32* %job.addr, align 4
  %0 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd = getelementptr inbounds %struct.FULL, %struct.FULL* %0, i32 0, i32 0
  %1 = load i32, i32* %cd, align 8
  %cmp = icmp slt i32 %1, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd = getelementptr inbounds %struct.FULL, %struct.FULL* %2, i32 0, i32 1
  %3 = load i32, i32* %rd, align 4
  %cmp1 = icmp slt i32 %3, 1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i32, i32* %job.addr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then2, label %if.end14

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  %5 = load float*, float** %b.addr, align 8
  store float* %5, float** %pb, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %if.then2
  %6 = load i32, i32* %i, align 4
  %7 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd3 = getelementptr inbounds %struct.FULL, %struct.FULL* %7, i32 0, i32 1
  %8 = load i32, i32* %rd3, align 4
  %cmp4 = icmp slt i32 %6, %8
  br i1 %cmp4, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  %9 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd = getelementptr inbounds %struct.FULL, %struct.FULL* %9, i32 0, i32 2
  %10 = load i32, i32* %i, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd, i64 0, i64 %idxprom
  %11 = load float*, float** %arrayidx, align 8
  store float* %11, float** %row, align 8
  %12 = load float*, float** %x.addr, align 8
  store float* %12, float** %px, align 8
  %13 = load float*, float** %pb, align 8
  store float 0.000000e+00, float* %13, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body
  %14 = load i32, i32* %j, align 4
  %15 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd6 = getelementptr inbounds %struct.FULL, %struct.FULL* %15, i32 0, i32 0
  %16 = load i32, i32* %cd6, align 8
  %cmp7 = icmp slt i32 %14, %16
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond5
  %17 = load float*, float** %row, align 8
  %18 = load float, float* %17, align 4
  %19 = load float*, float** %px, align 8
  %20 = load float, float* %19, align 4
  %mul = fmul float %18, %20
  %21 = load float*, float** %pb, align 8
  %22 = load float, float* %21, align 4
  %add = fadd float %22, %mul
  store float %add, float* %21, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %23 = load i32, i32* %j, align 4
  %inc = add nsw i32 %23, 1
  store i32 %inc, i32* %j, align 4
  %24 = load float*, float** %px, align 8
  %incdec.ptr = getelementptr inbounds float, float* %24, i32 1
  store float* %incdec.ptr, float** %px, align 8
  %25 = load float*, float** %row, align 8
  %incdec.ptr9 = getelementptr inbounds float, float* %25, i32 1
  store float* %incdec.ptr9, float** %row, align 8
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %26 = load i32, i32* %i, align 4
  %inc11 = add nsw i32 %26, 1
  store i32 %inc11, i32* %i, align 4
  %27 = load float*, float** %pb, align 8
  %incdec.ptr12 = getelementptr inbounds float, float* %27, i32 1
  store float* %incdec.ptr12, float** %pb, align 8
  br label %for.cond

for.end13:                                        ; preds = %for.cond
  store i32 0, i32* %retval, align 4
  br label %return

if.end14:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  %28 = load float*, float** %x.addr, align 8
  store float* %28, float** %px, align 8
  %29 = load float*, float** %b.addr, align 8
  store float* %29, float** %pb, align 8
  %30 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd15 = getelementptr inbounds %struct.FULL, %struct.FULL* %30, i32 0, i32 2
  %arrayidx16 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd15, i64 0, i64 0
  %31 = load float*, float** %arrayidx16, align 8
  store float* %31, float** %col, align 8
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc22, %if.end14
  %32 = load i32, i32* %i, align 4
  %33 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd18 = getelementptr inbounds %struct.FULL, %struct.FULL* %33, i32 0, i32 1
  %34 = load i32, i32* %rd18, align 4
  %cmp19 = icmp slt i32 %32, %34
  br i1 %cmp19, label %for.body20, label %for.end26

for.body20:                                       ; preds = %for.cond17
  %35 = load float*, float** %col, align 8
  %36 = load float, float* %35, align 4
  %37 = load float*, float** %px, align 8
  %38 = load float, float* %37, align 4
  %mul21 = fmul float %36, %38
  %39 = load float*, float** %pb, align 8
  store float %mul21, float* %39, align 4
  br label %for.inc22

for.inc22:                                        ; preds = %for.body20
  %40 = load i32, i32* %i, align 4
  %inc23 = add nsw i32 %40, 1
  store i32 %inc23, i32* %i, align 4
  %41 = load float*, float** %pb, align 8
  %incdec.ptr24 = getelementptr inbounds float, float* %41, i32 1
  store float* %incdec.ptr24, float** %pb, align 8
  %42 = load float*, float** %col, align 8
  %incdec.ptr25 = getelementptr inbounds float, float* %42, i32 1
  store float* %incdec.ptr25, float** %col, align 8
  br label %for.cond17

for.end26:                                        ; preds = %for.cond17
  store i32 1, i32* %j, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc45, %for.end26
  %43 = load i32, i32* %j, align 4
  %44 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd28 = getelementptr inbounds %struct.FULL, %struct.FULL* %44, i32 0, i32 0
  %45 = load i32, i32* %cd28, align 8
  %cmp29 = icmp slt i32 %43, %45
  br i1 %cmp29, label %for.body30, label %for.end47

for.body30:                                       ; preds = %for.cond27
  store i32 0, i32* %i, align 4
  %46 = load float*, float** %x.addr, align 8
  %47 = load i32, i32* %j, align 4
  %idx.ext = sext i32 %47 to i64
  %add.ptr = getelementptr inbounds float, float* %46, i64 %idx.ext
  store float* %add.ptr, float** %px, align 8
  %48 = load float*, float** %b.addr, align 8
  store float* %48, float** %pb, align 8
  %49 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd31 = getelementptr inbounds %struct.FULL, %struct.FULL* %49, i32 0, i32 2
  %50 = load i32, i32* %j, align 4
  %idxprom32 = sext i32 %50 to i64
  %arrayidx33 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd31, i64 0, i64 %idxprom32
  %51 = load float*, float** %arrayidx33, align 8
  store float* %51, float** %col, align 8
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc40, %for.body30
  %52 = load i32, i32* %i, align 4
  %53 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd35 = getelementptr inbounds %struct.FULL, %struct.FULL* %53, i32 0, i32 1
  %54 = load i32, i32* %rd35, align 4
  %cmp36 = icmp slt i32 %52, %54
  br i1 %cmp36, label %for.body37, label %for.end44

for.body37:                                       ; preds = %for.cond34
  %55 = load float*, float** %col, align 8
  %56 = load float, float* %55, align 4
  %57 = load float*, float** %px, align 8
  %58 = load float, float* %57, align 4
  %mul38 = fmul float %56, %58
  %59 = load float*, float** %pb, align 8
  %60 = load float, float* %59, align 4
  %add39 = fadd float %60, %mul38
  store float %add39, float* %59, align 4
  br label %for.inc40

for.inc40:                                        ; preds = %for.body37
  %61 = load i32, i32* %i, align 4
  %inc41 = add nsw i32 %61, 1
  store i32 %inc41, i32* %i, align 4
  %62 = load float*, float** %pb, align 8
  %incdec.ptr42 = getelementptr inbounds float, float* %62, i32 1
  store float* %incdec.ptr42, float** %pb, align 8
  %63 = load float*, float** %col, align 8
  %incdec.ptr43 = getelementptr inbounds float, float* %63, i32 1
  store float* %incdec.ptr43, float** %col, align 8
  br label %for.cond34

for.end44:                                        ; preds = %for.cond34
  br label %for.inc45

for.inc45:                                        ; preds = %for.end44
  %64 = load i32, i32* %j, align 4
  %inc46 = add nsw i32 %64, 1
  store i32 %inc46, i32* %j, align 4
  br label %for.cond27

for.end47:                                        ; preds = %for.cond27
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end47, %for.end13, %if.then
  %65 = load i32, i32* %retval, align 4
  ret i32 %65
}

declare dso_local i8* @malloc(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @ivecdump(i32* %vec, i32 %len, i8* %head) #0 {
entry:
  %vec.addr = alloca i32*, align 8
  %len.addr = alloca i32, align 4
  %head.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %count = alloca i32, align 4
  %lenmod = alloca i32, align 4
  %lenrem = alloca i32, align 4
  store i32* %vec, i32** %vec.addr, align 8
  store i32 %len, i32* %len.addr, align 4
  store i8* %head, i8** %head.addr, align 8
  %0 = load i32, i32* %len.addr, align 4
  %div = sdiv i32 %0, 9
  store i32 %div, i32* %lenmod, align 4
  %1 = load i32, i32* %len.addr, align 4
  %2 = load i32, i32* %lenmod, align 4
  %mul = mul nsw i32 %2, 6
  %sub = sub nsw i32 %1, %mul
  store i32 %sub, i32* %lenrem, align 4
  %3 = load i8*, i8** %head.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.24, i64 0, i64 0), i8* %3)
  store i32 0, i32* %count, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %4 = load i32, i32* %j, align 4
  %5 = load i32, i32* %lenmod, align 4
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %count, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i64 0, i64 0), i32 %6)
  store i32 0, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %7 = load i32, i32* %i, align 4
  %cmp3 = icmp slt i32 %7, 9
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %8 = load i32*, i32** %vec.addr, align 8
  %9 = load i32, i32* %8, align 4
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.29, i64 0, i64 0), i32 %9)
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  %11 = load i32*, i32** %vec.addr, align 8
  %incdec.ptr = getelementptr inbounds i32, i32* %11, i32 1
  store i32* %incdec.ptr, i32** %vec.addr, align 8
  %12 = load i32, i32* %count, align 4
  %inc6 = add nsw i32 %12, 1
  store i32 %inc6, i32* %count, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.28, i64 0, i64 0))
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %13 = load i32, i32* %j, align 4
  %inc9 = add nsw i32 %13, 1
  store i32 %inc9, i32* %j, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  %14 = load i32, i32* %lenrem, align 4
  %tobool = icmp ne i32 %14, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end10
  %15 = load i32, i32* %count, align 4
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i64 0, i64 0), i32 %15)
  store i32 0, i32* %i, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc16, %if.then
  %16 = load i32, i32* %i, align 4
  %17 = load i32, i32* %lenrem, align 4
  %cmp13 = icmp slt i32 %16, %17
  br i1 %cmp13, label %for.body14, label %for.end19

for.body14:                                       ; preds = %for.cond12
  %18 = load i32*, i32** %vec.addr, align 8
  %19 = load i32, i32* %18, align 4
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.29, i64 0, i64 0), i32 %19)
  br label %for.inc16

for.inc16:                                        ; preds = %for.body14
  %20 = load i32, i32* %i, align 4
  %inc17 = add nsw i32 %20, 1
  store i32 %inc17, i32* %i, align 4
  %21 = load i32*, i32** %vec.addr, align 8
  %incdec.ptr18 = getelementptr inbounds i32, i32* %21, i32 1
  store i32* %incdec.ptr18, i32** %vec.addr, align 8
  br label %for.cond12

for.end19:                                        ; preds = %for.cond12
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.28, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %for.end19, %for.end10
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.28, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sgefa(%struct.FULL* %a, i32* %ipvt) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca %struct.FULL*, align 8
  %ipvt.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %nm1 = alloca i32, align 4
  %info = alloca i32, align 4
  %n = alloca i32, align 4
  %t = alloca float, align 4
  %akk = alloca float*, align 8
  %alk = alloca float*, align 8
  %aij = alloca float*, align 8
  %mik = alloca float*, align 8
  store %struct.FULL* %a, %struct.FULL** %a.addr, align 8
  store i32* %ipvt, i32** %ipvt.addr, align 8
  %0 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd = getelementptr inbounds %struct.FULL, %struct.FULL* %0, i32 0, i32 0
  %1 = load i32, i32* %cd, align 8
  %2 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %rd = getelementptr inbounds %struct.FULL, %struct.FULL* %2, i32 0, i32 1
  %3 = load i32, i32* %rd, align 4
  %cmp = icmp ne i32 %1, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd1 = getelementptr inbounds %struct.FULL, %struct.FULL* %4, i32 0, i32 0
  %5 = load i32, i32* %cd1, align 8
  store i32 %5, i32* %n, align 4
  %6 = load i32, i32* %n, align 4
  %sub = sub nsw i32 %6, 1
  store i32 %sub, i32* %nm1, align 4
  %7 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd = getelementptr inbounds %struct.FULL, %struct.FULL* %7, i32 0, i32 2
  %arrayidx = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd, i64 0, i64 0
  %8 = load float*, float** %arrayidx, align 8
  store float* %8, float** %akk, align 8
  store i32 0, i32* %info, align 4
  %9 = load i32, i32* %n, align 4
  %cmp2 = icmp slt i32 %9, 2
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  br label %CLEAN_UP

if.end4:                                          ; preds = %if.end
  store i32 0, i32* %k, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc86, %if.end4
  %10 = load i32, i32* %k, align 4
  %11 = load i32, i32* %nm1, align 4
  %cmp5 = icmp slt i32 %10, %11
  br i1 %cmp5, label %for.body, label %for.end89

for.body:                                         ; preds = %for.cond
  %12 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd6 = getelementptr inbounds %struct.FULL, %struct.FULL* %12, i32 0, i32 2
  %13 = load i32, i32* %k, align 4
  %idxprom = sext i32 %13 to i64
  %arrayidx7 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd6, i64 0, i64 %idxprom
  %14 = load float*, float** %arrayidx7, align 8
  %15 = load i32, i32* %k, align 4
  %idx.ext = sext i32 %15 to i64
  %add.ptr = getelementptr inbounds float, float* %14, i64 %idx.ext
  store float* %add.ptr, float** %akk, align 8
  %16 = load i32, i32* %n, align 4
  %17 = load i32, i32* %k, align 4
  %sub8 = sub nsw i32 %16, %17
  %18 = load float*, float** %akk, align 8
  %call = call i32 (i32, float*, i32, ...) bitcast (i32 (i32, float*, i32)* @isamax to i32 (i32, float*, i32, ...)*)(i32 %sub8, float* %18, i32 1)
  %19 = load i32, i32* %k, align 4
  %add = add nsw i32 %call, %19
  store i32 %add, i32* %l, align 4
  %20 = load i32, i32* %l, align 4
  %21 = load i32*, i32** %ipvt.addr, align 8
  store i32 %20, i32* %21, align 4
  %22 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd9 = getelementptr inbounds %struct.FULL, %struct.FULL* %22, i32 0, i32 2
  %23 = load i32, i32* %k, align 4
  %idxprom10 = sext i32 %23 to i64
  %arrayidx11 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd9, i64 0, i64 %idxprom10
  %24 = load float*, float** %arrayidx11, align 8
  %25 = load i32, i32* %l, align 4
  %idx.ext12 = sext i32 %25 to i64
  %add.ptr13 = getelementptr inbounds float, float* %24, i64 %idx.ext12
  store float* %add.ptr13, float** %alk, align 8
  %26 = load float*, float** %alk, align 8
  %27 = load float, float* %26, align 4
  %conv = fpext float %27 to double
  %cmp14 = fcmp oeq double %conv, 0.000000e+00
  br i1 %cmp14, label %if.then16, label %if.end17

if.then16:                                        ; preds = %for.body
  %28 = load i32, i32* %k, align 4
  store i32 %28, i32* %info, align 4
  br label %for.inc86

if.end17:                                         ; preds = %for.body
  %29 = load i32, i32* %l, align 4
  %30 = load i32, i32* %k, align 4
  %cmp18 = icmp ne i32 %29, %30
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end17
  %31 = load float*, float** %alk, align 8
  %32 = load float, float* %31, align 4
  store float %32, float* %t, align 4
  %33 = load float*, float** %akk, align 8
  %34 = load float, float* %33, align 4
  %35 = load float*, float** %alk, align 8
  store float %34, float* %35, align 4
  %36 = load float, float* %t, align 4
  %37 = load float*, float** %akk, align 8
  store float %36, float* %37, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.end17
  %38 = load float*, float** %akk, align 8
  %39 = load float, float* %38, align 4
  %conv22 = fpext float %39 to double
  %div = fdiv double -1.000000e+00, %conv22
  %conv23 = fptrunc double %div to float
  store float %conv23, float* %t, align 4
  %40 = load i32, i32* %k, align 4
  %add24 = add nsw i32 %40, 1
  store i32 %add24, i32* %i, align 4
  %41 = load float*, float** %akk, align 8
  %add.ptr25 = getelementptr inbounds float, float* %41, i64 1
  store float* %add.ptr25, float** %mik, align 8
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc, %if.end21
  %42 = load i32, i32* %i, align 4
  %43 = load i32, i32* %n, align 4
  %cmp27 = icmp slt i32 %42, %43
  br i1 %cmp27, label %for.body29, label %for.end

for.body29:                                       ; preds = %for.cond26
  %44 = load float, float* %t, align 4
  %45 = load float*, float** %mik, align 8
  %46 = load float, float* %45, align 4
  %mul = fmul float %46, %44
  store float %mul, float* %45, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body29
  %47 = load i32, i32* %i, align 4
  %inc = add nsw i32 %47, 1
  store i32 %inc, i32* %i, align 4
  %48 = load float*, float** %mik, align 8
  %incdec.ptr = getelementptr inbounds float, float* %48, i32 1
  store float* %incdec.ptr, float** %mik, align 8
  br label %for.cond26

for.end:                                          ; preds = %for.cond26
  %49 = load i32, i32* %k, align 4
  %add30 = add nsw i32 %49, 1
  store i32 %add30, i32* %j, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc83, %for.end
  %50 = load i32, i32* %j, align 4
  %51 = load i32, i32* %n, align 4
  %cmp32 = icmp slt i32 %50, %51
  br i1 %cmp32, label %for.body34, label %for.end85

for.body34:                                       ; preds = %for.cond31
  %52 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd35 = getelementptr inbounds %struct.FULL, %struct.FULL* %52, i32 0, i32 2
  %53 = load i32, i32* %j, align 4
  %idxprom36 = sext i32 %53 to i64
  %arrayidx37 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd35, i64 0, i64 %idxprom36
  %54 = load float*, float** %arrayidx37, align 8
  %55 = load i32, i32* %k, align 4
  %idx.ext38 = sext i32 %55 to i64
  %add.ptr39 = getelementptr inbounds float, float* %54, i64 %idx.ext38
  %56 = load float, float* %add.ptr39, align 4
  store float %56, float* %t, align 4
  %57 = load i32, i32* %l, align 4
  %58 = load i32, i32* %k, align 4
  %cmp40 = icmp ne i32 %57, %58
  br i1 %cmp40, label %if.then42, label %if.end63

if.then42:                                        ; preds = %for.body34
  %59 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd43 = getelementptr inbounds %struct.FULL, %struct.FULL* %59, i32 0, i32 2
  %60 = load i32, i32* %j, align 4
  %idxprom44 = sext i32 %60 to i64
  %arrayidx45 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd43, i64 0, i64 %idxprom44
  %61 = load float*, float** %arrayidx45, align 8
  %62 = load i32, i32* %l, align 4
  %idx.ext46 = sext i32 %62 to i64
  %add.ptr47 = getelementptr inbounds float, float* %61, i64 %idx.ext46
  %63 = load float, float* %add.ptr47, align 4
  %64 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd48 = getelementptr inbounds %struct.FULL, %struct.FULL* %64, i32 0, i32 2
  %65 = load i32, i32* %j, align 4
  %idxprom49 = sext i32 %65 to i64
  %arrayidx50 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd48, i64 0, i64 %idxprom49
  %66 = load float*, float** %arrayidx50, align 8
  %67 = load i32, i32* %k, align 4
  %idx.ext51 = sext i32 %67 to i64
  %add.ptr52 = getelementptr inbounds float, float* %66, i64 %idx.ext51
  store float %63, float* %add.ptr52, align 4
  %68 = load float, float* %t, align 4
  %69 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd53 = getelementptr inbounds %struct.FULL, %struct.FULL* %69, i32 0, i32 2
  %70 = load i32, i32* %j, align 4
  %idxprom54 = sext i32 %70 to i64
  %arrayidx55 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd53, i64 0, i64 %idxprom54
  %71 = load float*, float** %arrayidx55, align 8
  %72 = load i32, i32* %l, align 4
  %idx.ext56 = sext i32 %72 to i64
  %add.ptr57 = getelementptr inbounds float, float* %71, i64 %idx.ext56
  store float %68, float* %add.ptr57, align 4
  %73 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd58 = getelementptr inbounds %struct.FULL, %struct.FULL* %73, i32 0, i32 2
  %74 = load i32, i32* %j, align 4
  %idxprom59 = sext i32 %74 to i64
  %arrayidx60 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd58, i64 0, i64 %idxprom59
  %75 = load float*, float** %arrayidx60, align 8
  %76 = load i32, i32* %k, align 4
  %idx.ext61 = sext i32 %76 to i64
  %add.ptr62 = getelementptr inbounds float, float* %75, i64 %idx.ext61
  %77 = load float, float* %add.ptr62, align 4
  store float %77, float* %t, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.then42, %for.body34
  %78 = load i32, i32* %k, align 4
  %add64 = add nsw i32 %78, 1
  store i32 %add64, i32* %i, align 4
  %79 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd65 = getelementptr inbounds %struct.FULL, %struct.FULL* %79, i32 0, i32 2
  %80 = load i32, i32* %j, align 4
  %idxprom66 = sext i32 %80 to i64
  %arrayidx67 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd65, i64 0, i64 %idxprom66
  %81 = load float*, float** %arrayidx67, align 8
  %82 = load i32, i32* %k, align 4
  %idx.ext68 = sext i32 %82 to i64
  %add.ptr69 = getelementptr inbounds float, float* %81, i64 %idx.ext68
  %add.ptr70 = getelementptr inbounds float, float* %add.ptr69, i64 1
  store float* %add.ptr70, float** %aij, align 8
  %83 = load float*, float** %akk, align 8
  %add.ptr71 = getelementptr inbounds float, float* %83, i64 1
  store float* %add.ptr71, float** %mik, align 8
  br label %for.cond72

for.cond72:                                       ; preds = %for.inc78, %if.end63
  %84 = load i32, i32* %i, align 4
  %85 = load i32, i32* %n, align 4
  %cmp73 = icmp slt i32 %84, %85
  br i1 %cmp73, label %for.body75, label %for.end82

for.body75:                                       ; preds = %for.cond72
  %86 = load float, float* %t, align 4
  %87 = load float*, float** %mik, align 8
  %88 = load float, float* %87, align 4
  %mul76 = fmul float %86, %88
  %89 = load float*, float** %aij, align 8
  %90 = load float, float* %89, align 4
  %add77 = fadd float %90, %mul76
  store float %add77, float* %89, align 4
  br label %for.inc78

for.inc78:                                        ; preds = %for.body75
  %91 = load i32, i32* %i, align 4
  %inc79 = add nsw i32 %91, 1
  store i32 %inc79, i32* %i, align 4
  %92 = load float*, float** %aij, align 8
  %incdec.ptr80 = getelementptr inbounds float, float* %92, i32 1
  store float* %incdec.ptr80, float** %aij, align 8
  %93 = load float*, float** %mik, align 8
  %incdec.ptr81 = getelementptr inbounds float, float* %93, i32 1
  store float* %incdec.ptr81, float** %mik, align 8
  br label %for.cond72

for.end82:                                        ; preds = %for.cond72
  br label %for.inc83

for.inc83:                                        ; preds = %for.end82
  %94 = load i32, i32* %j, align 4
  %inc84 = add nsw i32 %94, 1
  store i32 %inc84, i32* %j, align 4
  br label %for.cond31

for.end85:                                        ; preds = %for.cond31
  br label %for.inc86

for.inc86:                                        ; preds = %for.end85, %if.then16
  %95 = load i32, i32* %k, align 4
  %inc87 = add nsw i32 %95, 1
  store i32 %inc87, i32* %k, align 4
  %96 = load i32*, i32** %ipvt.addr, align 8
  %incdec.ptr88 = getelementptr inbounds i32, i32* %96, i32 1
  store i32* %incdec.ptr88, i32** %ipvt.addr, align 8
  br label %for.cond

for.end89:                                        ; preds = %for.cond
  br label %CLEAN_UP

CLEAN_UP:                                         ; preds = %for.end89, %if.then3
  %97 = load i32, i32* %nm1, align 4
  %98 = load i32*, i32** %ipvt.addr, align 8
  store i32 %97, i32* %98, align 4
  %99 = load float*, float** %akk, align 8
  %100 = load float, float* %99, align 4
  %conv90 = fpext float %100 to double
  %cmp91 = fcmp oeq double %conv90, 0.000000e+00
  br i1 %cmp91, label %if.then93, label %if.end94

if.then93:                                        ; preds = %CLEAN_UP
  %101 = load i32, i32* %n, align 4
  store i32 %101, i32* %info, align 4
  br label %if.end94

if.end94:                                         ; preds = %if.then93, %CLEAN_UP
  %102 = load i32, i32* %info, align 4
  store i32 %102, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end94, %if.then
  %103 = load i32, i32* %retval, align 4
  ret i32 %103
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sgesl(%struct.FULL* %a, i32* %ipvt, float* %b, i32 %job) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca %struct.FULL*, align 8
  %ipvt.addr = alloca i32*, align 8
  %b.addr = alloca float*, align 8
  %job.addr = alloca i32, align 4
  %t = alloca float, align 4
  %akk = alloca float*, align 8
  %mik = alloca float*, align 8
  %uik = alloca float*, align 8
  %bi = alloca float*, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %n = alloca i32, align 4
  %nm1 = alloca i32, align 4
  store %struct.FULL* %a, %struct.FULL** %a.addr, align 8
  store i32* %ipvt, i32** %ipvt.addr, align 8
  store float* %b, float** %b.addr, align 8
  store i32 %job, i32* %job.addr, align 4
  %0 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %cd = getelementptr inbounds %struct.FULL, %struct.FULL* %0, i32 0, i32 0
  %1 = load i32, i32* %cd, align 8
  store i32 %1, i32* %n, align 4
  %2 = load i32, i32* %n, align 4
  %sub = sub nsw i32 %2, 1
  store i32 %sub, i32* %nm1, align 4
  %3 = load i32, i32* %job.addr, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end51

if.then:                                          ; preds = %entry
  store i32 0, i32* %k, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %if.then
  %4 = load i32, i32* %k, align 4
  %5 = load i32, i32* %nm1, align 4
  %cmp1 = icmp slt i32 %4, %5
  br i1 %cmp1, label %for.body, label %for.end22

for.body:                                         ; preds = %for.cond
  %6 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd = getelementptr inbounds %struct.FULL, %struct.FULL* %6, i32 0, i32 2
  %7 = load i32, i32* %k, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd, i64 0, i64 %idxprom
  %8 = load float*, float** %arrayidx, align 8
  %9 = load i32, i32* %k, align 4
  %idx.ext = sext i32 %9 to i64
  %add.ptr = getelementptr inbounds float, float* %8, i64 %idx.ext
  store float* %add.ptr, float** %akk, align 8
  %10 = load i32*, i32** %ipvt.addr, align 8
  %11 = load i32, i32* %10, align 4
  store i32 %11, i32* %l, align 4
  %12 = load float*, float** %b.addr, align 8
  %13 = load i32, i32* %l, align 4
  %idxprom2 = sext i32 %13 to i64
  %arrayidx3 = getelementptr inbounds float, float* %12, i64 %idxprom2
  %14 = load float, float* %arrayidx3, align 4
  store float %14, float* %t, align 4
  %15 = load i32, i32* %l, align 4
  %16 = load i32, i32* %k, align 4
  %cmp4 = icmp ne i32 %15, %16
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %for.body
  %17 = load float*, float** %b.addr, align 8
  %18 = load i32, i32* %k, align 4
  %idxprom6 = sext i32 %18 to i64
  %arrayidx7 = getelementptr inbounds float, float* %17, i64 %idxprom6
  %19 = load float, float* %arrayidx7, align 4
  %20 = load float*, float** %b.addr, align 8
  %21 = load i32, i32* %l, align 4
  %idxprom8 = sext i32 %21 to i64
  %arrayidx9 = getelementptr inbounds float, float* %20, i64 %idxprom8
  store float %19, float* %arrayidx9, align 4
  %22 = load float, float* %t, align 4
  %23 = load float*, float** %b.addr, align 8
  %24 = load i32, i32* %k, align 4
  %idxprom10 = sext i32 %24 to i64
  %arrayidx11 = getelementptr inbounds float, float* %23, i64 %idxprom10
  store float %22, float* %arrayidx11, align 4
  br label %if.end

if.end:                                           ; preds = %if.then5, %for.body
  %25 = load i32, i32* %k, align 4
  %add = add nsw i32 %25, 1
  store i32 %add, i32* %i, align 4
  %26 = load float*, float** %akk, align 8
  %add.ptr12 = getelementptr inbounds float, float* %26, i64 1
  store float* %add.ptr12, float** %mik, align 8
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc, %if.end
  %27 = load i32, i32* %i, align 4
  %28 = load i32, i32* %n, align 4
  %cmp14 = icmp slt i32 %27, %28
  br i1 %cmp14, label %for.body15, label %for.end

for.body15:                                       ; preds = %for.cond13
  %29 = load float*, float** %mik, align 8
  %30 = load float, float* %29, align 4
  %31 = load float, float* %t, align 4
  %mul = fmul float %30, %31
  %32 = load float*, float** %b.addr, align 8
  %33 = load i32, i32* %i, align 4
  %idxprom16 = sext i32 %33 to i64
  %arrayidx17 = getelementptr inbounds float, float* %32, i64 %idxprom16
  %34 = load float, float* %arrayidx17, align 4
  %add18 = fadd float %34, %mul
  store float %add18, float* %arrayidx17, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body15
  %35 = load i32, i32* %i, align 4
  %inc = add nsw i32 %35, 1
  store i32 %inc, i32* %i, align 4
  %36 = load float*, float** %mik, align 8
  %incdec.ptr = getelementptr inbounds float, float* %36, i32 1
  store float* %incdec.ptr, float** %mik, align 8
  br label %for.cond13

for.end:                                          ; preds = %for.cond13
  br label %for.inc19

for.inc19:                                        ; preds = %for.end
  %37 = load i32, i32* %k, align 4
  %inc20 = add nsw i32 %37, 1
  store i32 %inc20, i32* %k, align 4
  %38 = load i32*, i32** %ipvt.addr, align 8
  %incdec.ptr21 = getelementptr inbounds i32, i32* %38, i32 1
  store i32* %incdec.ptr21, i32** %ipvt.addr, align 8
  br label %for.cond

for.end22:                                        ; preds = %for.cond
  %39 = load i32, i32* %nm1, align 4
  store i32 %39, i32* %k, align 4
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc49, %for.end22
  %40 = load i32, i32* %k, align 4
  %cmp24 = icmp sge i32 %40, 0
  br i1 %cmp24, label %for.body25, label %for.end50

for.body25:                                       ; preds = %for.cond23
  %41 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd26 = getelementptr inbounds %struct.FULL, %struct.FULL* %41, i32 0, i32 2
  %42 = load i32, i32* %k, align 4
  %idxprom27 = sext i32 %42 to i64
  %arrayidx28 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd26, i64 0, i64 %idxprom27
  %43 = load float*, float** %arrayidx28, align 8
  %44 = load i32, i32* %k, align 4
  %idx.ext29 = sext i32 %44 to i64
  %add.ptr30 = getelementptr inbounds float, float* %43, i64 %idx.ext29
  store float* %add.ptr30, float** %akk, align 8
  %45 = load float*, float** %akk, align 8
  %46 = load float, float* %45, align 4
  %47 = load float*, float** %b.addr, align 8
  %48 = load i32, i32* %k, align 4
  %idxprom31 = sext i32 %48 to i64
  %arrayidx32 = getelementptr inbounds float, float* %47, i64 %idxprom31
  %49 = load float, float* %arrayidx32, align 4
  %div = fdiv float %49, %46
  store float %div, float* %arrayidx32, align 4
  store i32 0, i32* %i, align 4
  %50 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd33 = getelementptr inbounds %struct.FULL, %struct.FULL* %50, i32 0, i32 2
  %51 = load i32, i32* %k, align 4
  %idxprom34 = sext i32 %51 to i64
  %arrayidx35 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd33, i64 0, i64 %idxprom34
  %52 = load float*, float** %arrayidx35, align 8
  store float* %52, float** %uik, align 8
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc45, %for.body25
  %53 = load i32, i32* %i, align 4
  %54 = load i32, i32* %k, align 4
  %cmp37 = icmp slt i32 %53, %54
  br i1 %cmp37, label %for.body38, label %for.end48

for.body38:                                       ; preds = %for.cond36
  %55 = load float*, float** %uik, align 8
  %56 = load float, float* %55, align 4
  %57 = load float*, float** %b.addr, align 8
  %58 = load i32, i32* %k, align 4
  %idxprom39 = sext i32 %58 to i64
  %arrayidx40 = getelementptr inbounds float, float* %57, i64 %idxprom39
  %59 = load float, float* %arrayidx40, align 4
  %mul41 = fmul float %56, %59
  %60 = load float*, float** %b.addr, align 8
  %61 = load i32, i32* %i, align 4
  %idxprom42 = sext i32 %61 to i64
  %arrayidx43 = getelementptr inbounds float, float* %60, i64 %idxprom42
  %62 = load float, float* %arrayidx43, align 4
  %sub44 = fsub float %62, %mul41
  store float %sub44, float* %arrayidx43, align 4
  br label %for.inc45

for.inc45:                                        ; preds = %for.body38
  %63 = load i32, i32* %i, align 4
  %inc46 = add nsw i32 %63, 1
  store i32 %inc46, i32* %i, align 4
  %64 = load float*, float** %uik, align 8
  %incdec.ptr47 = getelementptr inbounds float, float* %64, i32 1
  store float* %incdec.ptr47, float** %uik, align 8
  br label %for.cond36

for.end48:                                        ; preds = %for.cond36
  br label %for.inc49

for.inc49:                                        ; preds = %for.end48
  %65 = load i32, i32* %k, align 4
  %dec = add nsw i32 %65, -1
  store i32 %dec, i32* %k, align 4
  br label %for.cond23

for.end50:                                        ; preds = %for.cond23
  store i32 0, i32* %retval, align 4
  br label %return

if.end51:                                         ; preds = %entry
  store i32 0, i32* %k, align 4
  br label %for.cond52

for.cond52:                                       ; preds = %for.inc79, %if.end51
  %66 = load i32, i32* %k, align 4
  %67 = load i32, i32* %n, align 4
  %cmp53 = icmp slt i32 %66, %67
  br i1 %cmp53, label %for.body54, label %for.end81

for.body54:                                       ; preds = %for.cond52
  %68 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd55 = getelementptr inbounds %struct.FULL, %struct.FULL* %68, i32 0, i32 2
  %69 = load i32, i32* %k, align 4
  %idxprom56 = sext i32 %69 to i64
  %arrayidx57 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd55, i64 0, i64 %idxprom56
  %70 = load float*, float** %arrayidx57, align 8
  %71 = load i32, i32* %k, align 4
  %idx.ext58 = sext i32 %71 to i64
  %add.ptr59 = getelementptr inbounds float, float* %70, i64 %idx.ext58
  store float* %add.ptr59, float** %akk, align 8
  store i32 0, i32* %i, align 4
  store float 0.000000e+00, float* %t, align 4
  %72 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd60 = getelementptr inbounds %struct.FULL, %struct.FULL* %72, i32 0, i32 2
  %73 = load i32, i32* %k, align 4
  %idxprom61 = sext i32 %73 to i64
  %arrayidx62 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd60, i64 0, i64 %idxprom61
  %74 = load float*, float** %arrayidx62, align 8
  store float* %74, float** %uik, align 8
  %75 = load float*, float** %b.addr, align 8
  store float* %75, float** %bi, align 8
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc68, %for.body54
  %76 = load i32, i32* %i, align 4
  %77 = load i32, i32* %k, align 4
  %cmp64 = icmp slt i32 %76, %77
  br i1 %cmp64, label %for.body65, label %for.end72

for.body65:                                       ; preds = %for.cond63
  %78 = load float*, float** %uik, align 8
  %79 = load float, float* %78, align 4
  %80 = load float*, float** %bi, align 8
  %81 = load float, float* %80, align 4
  %mul66 = fmul float %79, %81
  %82 = load float, float* %t, align 4
  %add67 = fadd float %82, %mul66
  store float %add67, float* %t, align 4
  br label %for.inc68

for.inc68:                                        ; preds = %for.body65
  %83 = load i32, i32* %i, align 4
  %inc69 = add nsw i32 %83, 1
  store i32 %inc69, i32* %i, align 4
  %84 = load float*, float** %uik, align 8
  %incdec.ptr70 = getelementptr inbounds float, float* %84, i32 1
  store float* %incdec.ptr70, float** %uik, align 8
  %85 = load float*, float** %bi, align 8
  %incdec.ptr71 = getelementptr inbounds float, float* %85, i32 1
  store float* %incdec.ptr71, float** %bi, align 8
  br label %for.cond63

for.end72:                                        ; preds = %for.cond63
  %86 = load float*, float** %b.addr, align 8
  %87 = load i32, i32* %k, align 4
  %idxprom73 = sext i32 %87 to i64
  %arrayidx74 = getelementptr inbounds float, float* %86, i64 %idxprom73
  %88 = load float, float* %arrayidx74, align 4
  %89 = load float, float* %t, align 4
  %sub75 = fsub float %88, %89
  %90 = load float*, float** %akk, align 8
  %91 = load float, float* %90, align 4
  %div76 = fdiv float %sub75, %91
  %92 = load float*, float** %b.addr, align 8
  %93 = load i32, i32* %k, align 4
  %idxprom77 = sext i32 %93 to i64
  %arrayidx78 = getelementptr inbounds float, float* %92, i64 %idxprom77
  store float %div76, float* %arrayidx78, align 4
  br label %for.inc79

for.inc79:                                        ; preds = %for.end72
  %94 = load i32, i32* %k, align 4
  %inc80 = add nsw i32 %94, 1
  store i32 %inc80, i32* %k, align 4
  br label %for.cond52

for.end81:                                        ; preds = %for.cond52
  %95 = load i32, i32* %n, align 4
  %sub82 = sub nsw i32 %95, 2
  %96 = load i32*, i32** %ipvt.addr, align 8
  %idx.ext83 = sext i32 %sub82 to i64
  %add.ptr84 = getelementptr inbounds i32, i32* %96, i64 %idx.ext83
  store i32* %add.ptr84, i32** %ipvt.addr, align 8
  %97 = load i32, i32* %n, align 4
  %sub85 = sub nsw i32 %97, 2
  store i32 %sub85, i32* %k, align 4
  br label %for.cond86

for.cond86:                                       ; preds = %for.inc123, %for.end81
  %98 = load i32, i32* %k, align 4
  %cmp87 = icmp sge i32 %98, 0
  br i1 %cmp87, label %for.body88, label %for.end126

for.body88:                                       ; preds = %for.cond86
  %99 = load i32, i32* %k, align 4
  %add89 = add nsw i32 %99, 1
  store i32 %add89, i32* %i, align 4
  store float 0.000000e+00, float* %t, align 4
  %100 = load %struct.FULL*, %struct.FULL** %a.addr, align 8
  %pd90 = getelementptr inbounds %struct.FULL, %struct.FULL* %100, i32 0, i32 2
  %101 = load i32, i32* %k, align 4
  %idxprom91 = sext i32 %101 to i64
  %arrayidx92 = getelementptr inbounds [1000 x float*], [1000 x float*]* %pd90, i64 0, i64 %idxprom91
  %102 = load float*, float** %arrayidx92, align 8
  %103 = load i32, i32* %k, align 4
  %idx.ext93 = sext i32 %103 to i64
  %add.ptr94 = getelementptr inbounds float, float* %102, i64 %idx.ext93
  %add.ptr95 = getelementptr inbounds float, float* %add.ptr94, i64 1
  store float* %add.ptr95, float** %mik, align 8
  %104 = load float*, float** %b.addr, align 8
  %105 = load i32, i32* %k, align 4
  %idx.ext96 = sext i32 %105 to i64
  %add.ptr97 = getelementptr inbounds float, float* %104, i64 %idx.ext96
  %add.ptr98 = getelementptr inbounds float, float* %add.ptr97, i64 1
  store float* %add.ptr98, float** %bi, align 8
  br label %for.cond99

for.cond99:                                       ; preds = %for.inc104, %for.body88
  %106 = load i32, i32* %i, align 4
  %107 = load i32, i32* %n, align 4
  %cmp100 = icmp slt i32 %106, %107
  br i1 %cmp100, label %for.body101, label %for.end108

for.body101:                                      ; preds = %for.cond99
  %108 = load float*, float** %mik, align 8
  %109 = load float, float* %108, align 4
  %110 = load float*, float** %bi, align 8
  %111 = load float, float* %110, align 4
  %mul102 = fmul float %109, %111
  %112 = load float, float* %t, align 4
  %add103 = fadd float %112, %mul102
  store float %add103, float* %t, align 4
  br label %for.inc104

for.inc104:                                       ; preds = %for.body101
  %113 = load i32, i32* %i, align 4
  %inc105 = add nsw i32 %113, 1
  store i32 %inc105, i32* %i, align 4
  %114 = load float*, float** %mik, align 8
  %incdec.ptr106 = getelementptr inbounds float, float* %114, i32 1
  store float* %incdec.ptr106, float** %mik, align 8
  %115 = load float*, float** %bi, align 8
  %incdec.ptr107 = getelementptr inbounds float, float* %115, i32 1
  store float* %incdec.ptr107, float** %bi, align 8
  br label %for.cond99

for.end108:                                       ; preds = %for.cond99
  %116 = load float, float* %t, align 4
  %117 = load float*, float** %b.addr, align 8
  %118 = load i32, i32* %k, align 4
  %idxprom109 = sext i32 %118 to i64
  %arrayidx110 = getelementptr inbounds float, float* %117, i64 %idxprom109
  %119 = load float, float* %arrayidx110, align 4
  %add111 = fadd float %119, %116
  store float %add111, float* %arrayidx110, align 4
  %120 = load i32*, i32** %ipvt.addr, align 8
  %121 = load i32, i32* %120, align 4
  store i32 %121, i32* %l, align 4
  %122 = load i32, i32* %l, align 4
  %123 = load i32, i32* %k, align 4
  %cmp112 = icmp eq i32 %122, %123
  br i1 %cmp112, label %if.then113, label %if.end114

if.then113:                                       ; preds = %for.end108
  br label %for.inc123

if.end114:                                        ; preds = %for.end108
  %124 = load float*, float** %b.addr, align 8
  %125 = load i32, i32* %l, align 4
  %idxprom115 = sext i32 %125 to i64
  %arrayidx116 = getelementptr inbounds float, float* %124, i64 %idxprom115
  %126 = load float, float* %arrayidx116, align 4
  store float %126, float* %t, align 4
  %127 = load float*, float** %b.addr, align 8
  %128 = load i32, i32* %k, align 4
  %idxprom117 = sext i32 %128 to i64
  %arrayidx118 = getelementptr inbounds float, float* %127, i64 %idxprom117
  %129 = load float, float* %arrayidx118, align 4
  %130 = load float*, float** %b.addr, align 8
  %131 = load i32, i32* %l, align 4
  %idxprom119 = sext i32 %131 to i64
  %arrayidx120 = getelementptr inbounds float, float* %130, i64 %idxprom119
  store float %129, float* %arrayidx120, align 4
  %132 = load float, float* %t, align 4
  %133 = load float*, float** %b.addr, align 8
  %134 = load i32, i32* %k, align 4
  %idxprom121 = sext i32 %134 to i64
  %arrayidx122 = getelementptr inbounds float, float* %133, i64 %idxprom121
  store float %132, float* %arrayidx122, align 4
  br label %for.inc123

for.inc123:                                       ; preds = %if.end114, %if.then113
  %135 = load i32, i32* %k, align 4
  %dec124 = add nsw i32 %135, -1
  store i32 %dec124, i32* %k, align 4
  %136 = load i32*, i32** %ipvt.addr, align 8
  %incdec.ptr125 = getelementptr inbounds i32, i32* %136, i32 -1
  store i32* %incdec.ptr125, i32** %ipvt.addr, align 8
  br label %for.cond86

for.end126:                                       ; preds = %for.cond86
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end126, %for.end50
  %137 = load i32, i32* %retval, align 4
  ret i32 %137
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn }

!llvm.ident = !{!0, !0, !0, !0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 9.0.0 (https://github.com/llvm/llvm-project.git 5917097ca4f32811a55cc637ad8556143497c1e6)"}
!1 = !{i32 1, !"wchar_size", i32 4}
