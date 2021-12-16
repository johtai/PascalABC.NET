uses MySeqs;

begin
  var n := ReadInteger('N:');
  var a := ReadArrInteger(n);
  
  println('циклический сдвиг элементов массива вправо:', task2(a));
end.
{Логи:
N: 5
1 2 3 4 5
циклический сдвиг элементов массива вправо: [5,1,2,3,4] 

}