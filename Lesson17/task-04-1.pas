uses HigherOrderFuncs;

begin
  //ReadDivisor;
  var a:= ReadArrInteger(3);
  var b:= ReadArrInteger(3);
  println('a', a);
  println('b', b);
  println('new a:', IntZipWith(a, b, min));
end.
{Логи:
a [-10,5,0,22] 
b [10,-5,0,-22] 
new a: [-10,-5,0,-22] 

a [1,2,3] 
b [3,2,1] 
new a: [1,2,1] 
}