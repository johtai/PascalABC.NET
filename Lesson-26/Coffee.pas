unit Coffee;

type
  CM = class
  private
    money: integer;
    milk: integer;
    water: integer;
    cof: integer;
    cup: integer;
    types:= Arr('Эспрессо', 'Латте', 'Капучино');
    
    //стоимость кофе
    mo_es:= 70;
    mo_la:= 110;
    mo_ka:= 85;
    
    //молоко для кофе
    mi_la:= 75;
    mi_ka:= 100;
    
    //вода для кофе
    wa_es:= 250;
    wa_la:= 350;
    wa_ka:= 200;
    
    //кофейные зерна для кофе
    co_es:= 16;
    co_la:= 20;
    co_ka:= 12;
  public
    constructor Create(mo, mi, wa, co, cu: integer);
    begin
      money := mo;
      milk := mi;
      water := wa;
      cof := co;
      cup:= cu;
    end;
    //function SumFuel: real;
    procedure Print;
    procedure GiveMoney;
    procedure Add(mi, wa, co, cu: integer);
    procedure Make(t: string);
    function Check(t: string): boolean;
    {procedure UpdateMileageWithFuel(mil, fue: real);
    procedure FuelCon(f: integer);
    property reg: string read regNumber;
    property mil: real read mileage;
    property fue: real read fuel;}
  end;

procedure CM.Print;
begin
  Writeln($'Деньги: {money}, Молоко: {milk} мл., Кофе: {cof} г., Вода: {water} мл., Стаканчиков: {cup} шт.');
end;

procedure CM.GiveMoney;
begin
  Writeln($'Введите код доступа: ....');
  Writeln($'...Проверка кода...');
  Writeln($'Деньги в размере {money} руб. успешно списаны!');
  money := 0;
end;

procedure CM.Add(mi, wa, co, cu: integer);
begin
  Assert((mi >= 0) and (wa >= 0) and (co >= 0) and (cu >= 0));
  milk += mi;
  water += wa;
  cof += co;
  cup += cu;
end;

procedure CM.Make(t: string);
begin
  if (Check(t) = True) and (cup > 0) then
    begin
      cup -= 1;
      Writeln($'Ваш кофе готов!');
      case t of
          'Эспрессо': if (water >= wa_es) and (cof >= co_es) then
            begin
              money += mo_es; 
              water -= wa_es;
              cof -= co_es;
            end;
          'Латте': if (water >= wa_la) and (milk >= mi_la) and (cof >= co_la) then
            begin
              money += mo_la; 
              water -= wa_la;
              milk -= mi_la;
              cof -= co_la;
            end;
          'Капучино': if (water >= wa_ka) and (milk >= mi_ka) and (cof >= co_ka) then
            begin
              money += mo_ka; 
              water -= wa_ka;
              milk -= mi_ka;
              cof -= co_ka;
            end;
        end;
    end
  else
    Writeln($'По техническим причинам кофе не может быть приготовлен!');
end;


function CM.Check(t: string): boolean;
begin
  if t in types then
    begin
    case t of
      'Эспрессо': if (water >= 250) and (cof >= 16) then
                    result := True
                  else result := False;
      'Латте': if (water >= 350) and (milk >= 75) and (cof >= 20) then
                result := True
               else result := False;
      'Капучино': if (water >= 200) and (milk >= 100) and (cof >= 12) then
                result := True
               else result := False;
    end;
    end
  else
    println('Такого кофе в списке нет');
end;

end.