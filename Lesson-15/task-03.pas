uses DynArrs;

begin
  var arr := new real[2](4.1, 3.2);
  //for var i := 0 to n - 1 do
  //  arr[i] := ReadInteger($'a({i}):');
  //println(arr);
  PrintArray(arr, ' +++');
end.
{Логи:
3;  5;  7;  2;  0
True;  False;  False
<empty>
4.1 +++ 3.2 
}