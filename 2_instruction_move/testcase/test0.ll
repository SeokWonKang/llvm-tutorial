; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo2(i32 %a, i32 %b) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %addtmp = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %1 = load i32, i32* %b.addr, align 4
  %mul = mul nsw i32 %0, %1
  %2 = load i32, i32* %a.addr, align 4
  %3 = load i32, i32* %b.addr, align 4
  %rem = srem i32 %2, %3
  %add = add nsw i32 %mul, %rem
  store i32 %add, i32* %addtmp, align 4
  %4 = load i32, i32* %a.addr, align 4
  %5 = load i32, i32* %b.addr, align 4
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %6 = load i32, i32* %a.addr, align 4
  %7 = load i32, i32* %addtmp, align 4
  %add1 = add nsw i32 %7, %6
  store i32 %add1, i32* %addtmp, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %8 = load i32, i32* %b.addr, align 4
  %9 = load i32, i32* %addtmp, align 4
  %add2 = add nsw i32 %9, %8
  store i32 %add2, i32* %addtmp, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %addtmp, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)"}
