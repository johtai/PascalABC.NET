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
  
  println('ABC:', Perim(xA, yA, xB, yB, xC, yC));
  println('ABD:', Perim(xA, yA, xB, yB, xD, yD));
  println('ACD:', Perim(xA, yA, xC, yC, xD, yD));
end.