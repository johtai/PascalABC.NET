uses Lesson13;

begin
var pred: IntPredicate := x -> True;
var max:=integer.MinValue;
var op: IntBinOp := (x, y) -> begin result:=abs(x)>max ? 0 : x+y; if(abs(x)>max) then max:=abs(x); end;
var initVal := 0;
CondFoldSeq0(pred, op, initVal);
print(initVal);
end.