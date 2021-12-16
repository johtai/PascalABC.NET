uses Matrix;

begin
  var a := MakeRepMatrix(1,3, 5);
  var sum := 0;
  var mul := 1;
  
  printLnMatrix(a, ', ');
  MatrixSumAndProd(a ,sum, mul);
  println('sum:', sum);
  println('mul:', mul);
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