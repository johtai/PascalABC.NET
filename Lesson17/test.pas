uses HigherOrderFuncs;

begin
  //ReadDivisor;
  var a:= new integer[4](-10,5, 0, 22);
  println('a', a);
  println('new a:', Filter(a, IsPositive));
end.
{Логи:
a [-10,5,0,22] 
new a: [5,22] 

}