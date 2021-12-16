uses HigherOrderFuncs;

begin
  ReadDivisor;
  var a:= ReadArrInteger(5);
  println('a', a);
  println('new a:', Filter(a, IsDivisible));
end.
{Логи:
div: 4
a [1,2,3,4,5] 
new a: [4]

a [3,9,12,1,2] 
new a: [3,9,12] 
}