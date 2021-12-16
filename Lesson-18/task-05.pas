uses Matrix;

begin
  var a := MakeMatrix(2, 3, 1, 2, 3, 4, 5, 6);
  println('a:', a);
  println(MinAmongMaxInColumns);
end.

{Логи:
1,    1,    1
1,    1,    1
sum: 6 
mul: 1 

5,    5,    5
sum: 15 
mul: 125 
}