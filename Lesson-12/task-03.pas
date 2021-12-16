uses Lesson12;

begin
  var a := ReadInteger('N:');
  var count := CountPredInSeqN(a, IsOdd);
  println('C:', count);
end.
{Логи:
N: 2
2
4
C: 0 

N: 3
1
3
5
C: 3 
}