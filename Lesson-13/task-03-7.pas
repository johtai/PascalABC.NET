{Дана последовательность ненулевых целых чисел, признак завершения которой — число 0. Вычислить сумму после максимального по модулю элемента. Если такой суммы нет вывести 0. Выполните эту задачу за один проход.
Логи:
1 2 3 4 5 1 2 3 4 0
output: 10}
uses Lesson13;

begin
var pred: IntPredicate := x -> x <> 0;
var max := -10000000;
var op: IntBinOp := (x, y) -> begin result := abs(x)> max ? 0 : x + y; if (abs(x) > max) then max := abs(x); end;
var initVal := 0;

CondFoldSeq0(pred, op, initVal);
print('output:', initVal);
end.