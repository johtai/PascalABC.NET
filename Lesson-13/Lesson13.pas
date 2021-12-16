unit Lesson13;
///Модуль содержит подпрограммы для занятия 13

interface

type IntBinOp = (integer, integer)-> integer;
type IntPredicate = integer -> boolean;
function CondFoldSeq0(pred: IntPredicate; op: IntBinOp; var initVal: integer): integer;

implementation

function CondFoldSeq0(pred: IntPredicate; op: IntBinOp; var initVal: integer): integer;
begin
  var a := 1;
  while a <> 0 do
  begin
    a := ReadInteger;
    if pred(a) then initVal := op(a, initVal);
    //println(a, pred(a), initVal, op(a, initVal));
  end;
end;

initialization

  
end.
