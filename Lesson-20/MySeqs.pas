unit MySeqs;


function task1(arr: array of integer; K, L: integer): real;
begin
  l -= 1;
  k -= 1;
  var s := 0;
  var c := 0;
  for var i := 0 to l + 1 do
    if (i > k) and (i < l) then
    begin
      s += arr[i];
      c += 1;
    end;
  result := s / c;
end;

function task2(a: array of integer): array of integer;
begin
  var last := a[a.Length - 1];
  for var i := 1 to a.Length - 1 do
    a[a.Length - i] := a[a.Length - i - 1];
  a[0] := last;
  result := a;
end;


function task3(a: array of integer; k: integer): array of integer;
begin
  var new_a := new integer[a.Length - 1];
  k -= 1;
  var get_k := False;
  
  for var i := 0 to a.length - 2 do
  begin
    if (i <> k) and (get_k = False) then
      new_a[i] := a[i]
    else
      begin
      new_a[i] := a[i + 1];
      get_k := True;
      end;
  end;
  result := new_a; 
end;

function task4(seq: sequence of integer):real;
begin
  result := seq.Aggregate(1, (x, y) -> x * (y mod 10));
end;

function task5(seq: sequence of integer):real;
begin
  result := seq.Select(x -> 1 / x).Sum();
end;

function task61: sequence of integer;
begin
  result := SeqGen(10, 1, x -> x * 3);
end;

function task62(): sequence of real;
begin
  result := SeqGen(15, 2.0, x -> x / 2);
end;

function task63(N: integer): sequence of real;
begin
  result := SeqGen(N, 5.0 ,x -> x / 2 - 1);
end;

function task64(N : integer): sequence of real;
begin
  result := SeqGen(N, 2.0, x -> (x + 1) * x )
end;

function task65(N : integer): sequence of integer;
begin
  result := SeqGen(N, 1, 2,(x, y) -> y + 2 * x);
end;

function task66(N : integer): sequence of real;
begin
  result := SeqGen(N, 1.0, 2.0,(x, y) -> (x + y) / 2);
end;

function task67(N : integer): sequence of real;
begin
  result := SeqGen(N, 1.0, 11.1, (x, y) -> x / y + 8);
end;
begin
  
end.