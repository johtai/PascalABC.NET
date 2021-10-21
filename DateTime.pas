
function IsLeapYear(year: integer): boolean;
begin
  result := False;
  if ((year mod 4 = 0) and (year mod 100 <> 0)) 
      or (year mod 400 = 0) then result := True;
end;

function LaterInYear(d1, m1, d2, m2: integer): (integer,integer);
begin
  if m1 = m2 then
    if d1 > d2 then
      result := (d1, m1)
    else
      result := (d2, m2);
      
  if m2 > m1 then
    result := (d1, m1)
  else
    result := (d2, m2);
end;

function DaysInYear(year:integer ): integer;
begin
  if isLeapYear(year) then
    result := 366
  else result := 365;
end;

function DaysInYearRange(y1, y2: integer):integer;
begin
  result := 0;
  for var y := y1 to y2 do
  begin
    result += DaysInYear(y);
  end;
end;

function SeconsInHours(h:integer): integer;
begin
  result := h * 360;
end;

begin
  //println(DateTime.Now.Year)
end.