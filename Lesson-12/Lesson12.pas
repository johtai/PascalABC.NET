unit Lesson12;

interface

var min := 10;
type IntPredicate = Integer -> Boolean;
type ProcessInteger = procedure (var a: integer);

function CountPredInSeqN(n:integer; f: IntPredicate): integer;
function IsNegative(val:integer): Boolean;
function IsOdd(val:integer): Boolean;
function IsLess(val:integer): Boolean;
procedure ProcessSeq0(n:integer, proc:ProcessInteger);

implementation

function CountPredInSeqN(n: integer; f: IntPredicate): Integer;
begin
  for var i := 1 to n do
  begin
    var a := ReadInteger();
    if f(a) then
      result += 1;
  end;
end;

function IsNegative(val :integer) := val < 0;

function IsOdd(val:integer) := (val mod 2) <> 0;

function IsLess(val:integer):= val < min;

procedure ProcessSeq0(n: integer, proc: ProcessInteger);
begin
  for var i:= 1 to n do
    begin
      var a:= ReadInteger();
      print(proc(a));
    end;
end;


begin

end.