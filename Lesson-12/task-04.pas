uses Lesson12;

begin
  var a := ReadInteger();
  var count := CountPredInSeqN(a, IsLess);
  println(count);
end.
{2
1
11
1 
}