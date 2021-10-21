begin
  function IsLeapYear(year: integer): integer;
  begin
    result := False;
    if ((year mod 4 = 0) and (year mod 100 <> 0)) 
        or (year mod 400 = 0) then result := True;
  end;
end.