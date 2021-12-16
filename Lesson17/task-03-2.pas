uses HigherOrderFuncs;

begin
  //ReadDivisor;
  var a:= ReadArrInteger(4);
  println('a', a);
  println('new a:', Filter(a, IsPositive));
end.
{Логи:
a [-10,5,0,22] 
new a: [5,22] 

a [1,-2,0,4] 
new a: [1,4] 
}