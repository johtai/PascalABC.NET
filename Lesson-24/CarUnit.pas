unit CarUnit;

type
  Car = class
  private
    regNumber: string;
    mileage: real;
    fuel: real;
  public
    constructor Create(reg: string; mil, fue: real);
    begin
      Assert(reg.Length > 0);
      Assert(mil >= 0);
      Assert(fue > 0);
      
      regNumber := reg;
      mileage := mil;
      fuel := fue;
    end;
    function SumFuel: real;
    procedure Print;
    procedure UpdateMileageWithFuel(mil, fue: real);
    procedure FuelCon(f: integer);
    property reg: string read regNumber;
    property mil: real read mileage;
    property fue: real read fuel;
  end;

procedure Car.UpdateMileageWithFuel(mil, fue: real);
begin
  mileage += mil;
  fuel := (mileage / 100) * fue;
end;

function Car.SumFuel: real;
begin
  result := (mileage / 100) * fuel;
end;

procedure Car.Print;
begin
  Writeln($'Номер: {reg}, Пробег: {mil}, Расход: {fue}');
end;

procedure Car.FuelCon(f: integer);
begin
  f := abs(f);
  fuel += f;
end;

end.