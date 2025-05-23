; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable willreturn
define dso_local i32 @foo2(i32 %a, i32 %b, i32* nocapture %c, i32* nocapture %d, i32 %count) local_unnamed_addr #0 {
entry:
  %cmp = icmp slt i32 %a, %b
  %0 = load i32, i32* %d, align 4, !tbaa !2
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %add2 = add nsw i32 %0, %a
  %idxprom = sext i32 %add2 to i64
  %arrayidx3 = getelementptr inbounds i32, i32* %c, i64 %idxprom
  %1 = load i32, i32* %arrayidx3, align 4, !tbaa !2
  store i32 %1, i32* %c, align 4, !tbaa !2
  br label %if.end

if.else:                                          ; preds = %entry
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* %d, align 4, !tbaa !2
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %a.pn = phi i32 [ %a, %if.then ], [ %b, %if.else ]
  %mul = mul nsw i32 %b, %a
  %rem = srem i32 %a, %b
  %idx.ext = sext i32 %count to i64
  %add.ptr = getelementptr inbounds i32, i32* %c, i64 %idx.ext
  %2 = load i32, i32* %add.ptr, align 4, !tbaa !2
  %add = add i32 %a.pn, %mul
  %addtmp.0 = add i32 %add, %rem
  %add6 = add i32 %addtmp.0, %2
  ret i32 %add6
}

; Function Attrs: norecurse nounwind readnone uwtable willreturn
define dso_local i32 @main() local_unnamed_addr #1 {
entry:
  ret i32 0
}

attributes #0 = { nofree norecurse nounwind uwtable willreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind readnone uwtable willreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
