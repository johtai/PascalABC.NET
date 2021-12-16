uses DynArrs;

begin
  var n:= ReadInteger('N:');
  var arr := new integer[n];
  for var i := 0 to n - 1 do
    arr[i] := ReadInteger($'a({i}):');
  //println(arr);
  PrintElemsLessLeft(arr);
end.
{Логи:
N: 5
a(0): 4
a(1): 5
a(2): 3
a(3): 2
a(4): 1
2 3 4 

N: 3
a(0): 1
a(1): 2
a(2): 3 

N: 5
a(0): -100
a(1): -10000
a(2): 1
a(3): 2
a(4): 3
1 
}