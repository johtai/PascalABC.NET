uses Lesson12;

begin
  var a := ReadInteger('N:');
  var count := CountPredInSeqN(a, IsNegative);
  println('C:', count);
end.
{ Логи:
N: 5
1
2
3
-5
-2
C: 2

N: 2
-1
-2
C: 2 

0
C: 0 

N: 1
1
C: 0 
}