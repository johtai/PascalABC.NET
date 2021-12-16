{Вычислить сумму положительных элементов последовательности.
Логи:
2 3 -4 -6 0
output: 5}
uses Lesson13;

begin
  var pred: IntPredicate := x -> x > 0;
  var op: IntBinOp := (x, y) -> x + y;
  var initVal := 0;
  
  CondFoldSeq0(pred, op, initVal);
  print('output:',initVal);
  
end.