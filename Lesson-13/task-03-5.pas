{ Вычислить максимальный элемент последовательности среди отрицательных.
Логи:
1 2 -2 -3 -4 -3 0
output: -2 }
uses Lesson13;

begin
  var pred: IntPredicate := x -> x < 0;
  var op: IntBinOp := (x, y) -> x > y ? x : y;
  var initVal := -10000000;
  
  CondFoldSeq0(pred, op, initVal);
  print('output:',initVal);
  
end.