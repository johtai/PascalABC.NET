uses HigherOrderFuncs;

begin
  ReadDivisor;
  var a:= ReadArrInteger(5);
  println('a', a);
  println('new a:', IntFilter(a, IsDivisible));
end.
{Логи:
div: 10
a [10,2,30,4,5] 
new a: [10,30] 

div: 10
a [1,2,3,4,5] 
new a: [] 
}