uses Geometry;

begin
  var xA := ReadReal('xA:');
  var yA := ReadReal('yA:');
  var xB := ReadReal('xB:');
  var yB := ReadReal('yB:');
  var xB := ReadReal('xC:');
  var yB := ReadReal('yC:');
  var xB := ReadReal('xD:');
  var yB := ReadReal('yD:');
  //var xC := ReadReal;
  //var yC := ReadReal;
  //var hA, hB, hC: real;
  
  println('AB', Leng(xA, yA, xB, yB));
  println('AC', Leng(xA, yA, xC, yC));
  println('AD', Leng(xA, yA, xD, yD));
end.