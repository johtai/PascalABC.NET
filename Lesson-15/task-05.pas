uses DynArrs;

begin
  var arr := new integer[2](1, 2);
  println(arr);
  println('CountTwoDigit:',CountTwoDigit(arr));
end.
{Логи:
[4,65,22,331,9] 
CountTwoDigit: 2 

[1,2] 
CountTwoDigit: 0 
}


{addelem(var a:array of integer, count: integer, x:integer)
a[count]:= x
count += 1}