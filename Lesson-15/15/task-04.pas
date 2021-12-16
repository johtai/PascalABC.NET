uses DynArrs;

begin
  var n:= ReadInteger();
  println(MakeFibArr(n));
  
  //println(MakeFibArr(10));
  //println(MakeFibArr(3));
  //println(MakeFibArr(1));
end.
{Логи:
[1,1,2,3,5,8,13,21,34,55] 
[1,1,2] 
[1] 
}