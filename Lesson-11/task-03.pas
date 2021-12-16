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
  //var hA, hB, hC: real;
  
  println('ABC:', Area(xA, yA, xB, yB, xC, yC));
  println('ABD:', Area(xA, yA, xB, yB, xD, yD));
  println('ACD:', Area(xA, yA, xC, yC, xD, yD));
end.