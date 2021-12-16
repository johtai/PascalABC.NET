uses DynArrs;

begin
  var arr := new integer[0];
  //for var i := 0 to n - 1 do
  //  arr[i] := ReadInteger($'a({i}):');
  //println(arr);
  //PrintArray(arr, '; ');
  println('before:', arr);
  DoubleArr(arr);
  println('after:', arr);
end.
{Логи:
before: [3,5,7,2,0] 
after: [3,5,7,2,0,3,5,7,2,0] 

before: [0] 
after: [0,0] 
}