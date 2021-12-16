uses Coffee;

begin
  var Machine := new CM(1000, 1000, 1000, 1000, 100);
  var action: string;
  var coffe_type: string;
  var mi, wa, co, cu: integer;
  
  while action <> 'выход' do
  begin
    action := ReadString('Чего желаете? (купить, пополнить, забрать, остаток, выход)');
    
    if action = 'купить' then
    begin
      coffe_type := ReadString('Какой кофе вы хотите купить? (Эспрессо, Латте, Каппучино)');
      Machine.Make(coffe_type);
    end
    
    else if action = 'пополнить' then
    begin
      mi := ReadInteger('Введите сколько добавить молока в мл.:');
      wa := ReadInteger('Введите сколько добавить воды в мл.:');
      co := ReadInteger('Введите сколько добавить кофейных зерен в г.:');
      cu := ReadInteger('Введите сколько добавить стаканчиков в шт.:');
      Machine.Add(mi, wa, co, cu);
    end
    
    else if action = 'забрать' then
    begin
      Machine.GiveMoney;
    end
    
    else if action = 'остаток' then
    begin
      Machine.Print;
    end;
  end;
end.