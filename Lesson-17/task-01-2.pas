uses HigherOrderFuncs;

begin
  var a:= ReadArrInteger(5);
  println('a', a);
  println('new a:', IntMap(a, MaxSqrDivisor));
end.
{Логи:
a [25,50,80] 
new a: [5,5,4] 

a [10,32,49,14,7] 
new a: [1,4,7,1,1]
}