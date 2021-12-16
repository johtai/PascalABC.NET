uses HigherOrderFuncs;

begin
  var a:= ReadArrInteger(5);
  println('old a', a);
  println('new a:', IntMap(a, DoubleVal));
end.
{Логи:
old a [40,36,49,89,67] 
new a: [80,72,98,178,134] 

old a [97,40,74,3,80] 
new a: [194,80,148,6,160] 
}