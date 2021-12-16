uses HigherOrderFuncs;

begin
  //ReadDivisor;
  var a:= ReadArrInteger(3);
  var b:= ReadArrInteger(3);
  println('a', a);
  println('b', b);
  println('new a:', IntZipWith(a, b, Sum));
end.
{Логи:
a [-10,5,0,22] 
b [10,-5,0,-22] 
new a: [0,0,0,0]

a [1,2,3] 
b [3,2,1] 
new a: [4,4,4] 
}