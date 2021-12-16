uses Geometry;

begin
  var xA := ReadReal;
  var yA := ReadReal;
  var xB := ReadReal;
  var yB := ReadReal;
  var xC := ReadReal;
  var yC := ReadReal;
  var xD := ReadReal;
  var yD := ReadReal;
  var hA, hB, hC: real;
  
  Heights(xA, yA, xB, yB, xC, yC, hA, hB, hC);
  println('ABC:', hA, hB, hC);
  Heights(xA, yA, xB, yB, xD, yD, hA, hB, hC);
  println('ABD:', hA, hB, hC);
  Heights(xA, yA, xC, yC, xD, yD, hA, hB, hC);
  println('ACD:', hA, hB, hC);
end.