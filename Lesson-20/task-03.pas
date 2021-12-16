uses MySeqs;

begin
  var n := ReadInteger('N:');
  var arr := ReadArrInteger(n);
  var k := ReadInteger('k:');
  
  println('Удалить из массива элемент с порядковым номером K.:', task3(arr, k));
end.
{Логи:
N: 5
1 2 3 4 5
k: 2
Удалить из массива элемент с порядковым номером K.: [1,3,4,5] 

}