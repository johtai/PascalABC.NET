{Вычислить сумму всех элементов последовательности.
Логи:
3 4 5 -5 -4 -3 1 0
output: 1

3 4 5 -5 -4 -3 1 4 0
output: 5}
uses Lesson13;

begin
  var pred: IntPredicate := x -> x <> 0;
  var op: IntBinOp := (x, y) -> x + y;
  var initVal := 0;
  
  CondFoldSeq0(pred, op, initVal);
  print('output:',initVal);
  
end.