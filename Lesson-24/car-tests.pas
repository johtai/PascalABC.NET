uses NUnitABC, CarUnit;

[Test]
procedure Test1;
begin
  var a := new Car('000', 5000, 100);
  a.UpdateMileageWithFuel(100, 10);
  Assert.AreEqual(a.mil, 5100);
end;

begin

end.