uses carUnit;

begin
  randomize;
  
  var a, b, c, d, e, f: Car;
  var r : integer;
  
  a := new Car('000', 5000, 100);
  b := new Car('123', 4567, 80);
  c := new Car('235', 17564, 567);
  d := new Car('345', 5467, 345);
  e := new Car('765', 8768, 234);
  f := new Car('345', 15000, 123);
  
  var m := Arr(a, b, c, d, e, f);
  var rcar:= m[random(0, 5)];
  
  foreach x: Car in m do
    x.Print; 
  println();
end.