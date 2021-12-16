uses DynArrs;

begin
  //var a:= new integer[5](1, 2, 3, 4, 5);
  println(MakeOddArr(5));
  println(MakeOddArr(0));
  var arr: array of integer;
  FillOddArr(4, arr);
end.
{Логи:
[1,3,5,7,9] 
[1,3,5,7] 
}