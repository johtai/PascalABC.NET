uses Matrix;

begin
  var arr:= ReadArrInteger(5);
  var m := ReadRepLineIntMatrix(3, 5, arr);
  printLnMatrix(m, ', ');
end.
{Логи:
   1,   -2,    3,   -4,    5
   1,   -2,    3,   -4,    5
   1,   -2,    3,   -4,    5
}