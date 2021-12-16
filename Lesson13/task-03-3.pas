{Вычислить произведение одноразрядных чисел. Для пустой последовательности
Логи:
3 4 5 -5 -4 -3 1 0
output: 1

2 3 4 -5 123 0
output: 24}
uses Lesson13;

begin
  var pred: IntPredicate := x -> (x < 9) and (x > 0);
  var op: IntBinOp := (x, y) -> x * y;
  var initVal := 1;
  
  CondFoldSeq0(pred, op, initVal);
  print('output:',initVal);
  
end.