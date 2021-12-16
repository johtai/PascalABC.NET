uses Geometry;

begin
  var xP := ReadReal;
  var yP := ReadReal;
  var xA := ReadReal;
  var yA := ReadReal;
  var xB := ReadReal;
  var yB := ReadReal;
  var xC := ReadReal;
  var yC := ReadReal;
  
  //var hA, hB, hC: real;
  
  println('AB:', Dist(xP, yP, xA, yA, xB, yB));
  println('AC:', Dist(xP, yP, xA, yA, xC, yC));
  println('BC:', Dist(xP, yP, xB, yB, xC, yC));
end.