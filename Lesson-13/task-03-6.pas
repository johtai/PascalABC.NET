{ Вычислить произведение после последнего отрицательного. Если такого произведения нет вывести 1.
Логи:
-1 2 3 4 0
output: 24}
uses Lesson13;

begin
var pred: IntPredicate := x -> x <> 0;
var op: IntBinOp := (x, y) -> x > 0 ? x * y : 1;
var initVal := 1;

CondFoldSeq0(pred, op, initVal);
print('output:', initVal);
end.