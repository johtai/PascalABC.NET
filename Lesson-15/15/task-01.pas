uses DynArrs;

begin
  var a:= new integer[5](1, 2, 3, 4, 5);
  println(a.Length, ArraySum(a));
  a:= new integer[0];
  println(a.Length, ArraySum(a));
  a:= new integer[2](-100, 6);
  println(a.Length, ArraySum(a));
end.