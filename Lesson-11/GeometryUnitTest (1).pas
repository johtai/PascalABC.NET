uses NUnitABC;
uses Geometry;

[Test]
procedure TestLeng();
begin
  Assert.AreEqual(Leng(0, 0, 0, 5), 5);
  Assert.AreEqual(Leng(1, 3, 2, 3), 1);
end;

[Test]
procedure TestPerim();
begin
  Assert.AreEqual(Perim(1, 1, 2, 2, 0, 3), 5.886, 0.001);
end;

[Test]
procedure TestArea();
begin
  Assert.AreEqual(Area(0, 0, 0, 2, 2, 0), 2, 0.0001);
end;

[Test]
procedure TestDist();
begin
  Assert.AreEqual(Dist(0, 5, 0, 0, 5, 0), 5);
end;

[Test]
procedure TestHeights();
begin
  var hA, hB, hC: real;
  
  Heights(1, 1, 2, 2, 0, 3, hA, hB, hC);
  Assert.AreEqual(hA, 1.342, 0.001);
  Assert.AreEqual(hB, 1.342, 0.001);
  Assert.AreEqual(hC, 2.121, 0.001);
end;

begin
  
end.