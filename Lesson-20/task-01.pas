uses MySeqs;

begin
  var n := ReadInteger('N:');
  var arr := ReadArrInteger(n);
  var k := ReadInteger('k:');
  var l := ReadInteger('l:');
  
  println('среднее арифметическое:', task1(arr, k, l));
end.
{Логи:
N: 5
1 2 3 4 5
k: 2
l: 4
среднее арифметическое: 3 
}