uses NUnitABC;
uses Lesson12;

[Test]
procedure TestNegative();
begin
  Assert.AreEqual(IsNegative(-4), True);
  Assert.AreEqual(IsNegative(5), False);
end;

[Test]
procedure TestLess();
begin
  Assert.AreEqual(IsLess(4), True);
  Assert.AreEqual(IsLess(11), False);
end;

begin
  
end.