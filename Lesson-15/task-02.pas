uses DynArrs;

begin
  var a:= new integer[5](1, 2, 3, 4, 5);
  println(a);
  EvenMult2(a, evensCnt);
  println(a, evensCnt);
  //println(MakeFibArr(10));
  //println(MakeFibArr(3));
  //println(MakeFibArr(1));
end.
{Логи:
[1,2,3,4,5] 
[1,4,3,8,5] 5 

}