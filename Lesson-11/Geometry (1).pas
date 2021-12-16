unit Geometry;

function Leng(xa, ya, xb, yb: real): real;
  begin
    result := sqrt((xa - xb) ** 2 + (ya - yb) ** 2);
  end;
  
function Perim(xA, yA, xB, yB, xC, yC: real): real;
  begin
    var a:= Leng(xA, yA, xB, yB);
    var b:= Leng(xB, yB, xC, yC);
    var c:= Leng(xC, yC, xA, yA);
    
    result := a + b + c;
  end;
  
function Area(xA, yA, xB, yB, xC, yC: real): real;
  begin
    var p:= Perim(xA, yA, xB, yB, xC, yC) / 2;
    var a:= Leng(xA, yA, xB, yB);
    var b:= Leng(xB, yB, xC, yC);
    var c:= Leng(xC, yC, xA, yA);
    
    result := sqrt(p * (p - a) * (p - b) * (p - c));
  end;
  
function Dist(xP, yP, xA, yA, xB, yB: real): real;
  begin
    //println(Area(xP, yP, xA, yA, xB, yB), Leng(xA, yA, xB, yB));
    result := ((2 * Area(xP, yP, xA, yA, xB, yB)) / Leng(xA, yA, xB, yB));
  end;
  
procedure Heights(xA, yA, xB, yB, xC, yC: real; var hA, hB, hC :real);
  begin
    hA := Dist(xA, yA, xB, yB, xC, yC);
    hB := Dist(xB, yB, xA, yA, xC, yC);
    hC := Dist(xC, yC, xB, yB, xA, yA);
  end;

begin

end.