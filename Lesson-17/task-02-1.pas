uses HigherOrderFuncs;

begin
  var a:= ReadArrInteger(5);
  println('a', a);
  println('new a:', IntFilter(a, IsPositive));
end.
{Логи:
a [-1,-5,-100,0,4] 
new a: [4] 

a [1,2,3,4,5] 
new a: [1,2,3,4,5] 
}