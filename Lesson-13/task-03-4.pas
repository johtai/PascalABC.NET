{Вычислить количество чётных элементов.
Логи:
1 2 3 4 5 6 7 8 0
output: 4}
uses Lesson13;

begin
  var pred: IntPredicate := x -> (x mod 2 = 0) and (x <> 0);
  var op: IntBinOp := (x, y) -> y + 1;
  var initVal := 0;
  
  CondFoldSeq0(pred, op, initVal);
  print('output:',initVal);
  
end.