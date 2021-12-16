/// <summary>
/// Модуль для работы с динамическими массивами
/// </summary>
unit DynArrs;

interface

type
  /// Динамический массив целых чисел
  IntArr = array of integer;
  /// Динамический массив вещественных чисел
  RealArr = array of real;  

type                                    
  /// Предикат для целого числа
  IntPredicate = integer -> boolean;

// ************************************* Занятие 15


/// <summary>
/// Находит сумму элементов массива a целых чисел
/// </summary>
/// <param name="a">Входной массив целых чисел</param>
/// <returns>Сумма элементов массива a</returns>
function CountTwoDigit(var a: array of integer): integer;
function ArraySum(a: IntArr): integer;  
function PrintIntArr(a: IntArr; del: string): string; 
function MakeOddArr(n: integer): IntArr;
procedure FillOddArr(n: integer; arr: IntArr);
/// Возвращает минимальный элемент непустого массива вещественных чисел
function FindMinReal(a: RealArr): real;  
function MakeFibArr(n: integer): IntArr;
procedure EvenMult2(a: IntArr; var evensCnt: integer);
procedure PrintArray<T>(a: array of T; delim: string);

//function ReadIntArr(n: integer): IntArr;
procedure PrintElemsLessLeft(a: IntArr);
// TODO task #8
  
/// <summary>
/// Определяет количество элементов в массиве, удовлетворяющих заданному
/// предикату pred
/// </summary>
/// <param name="a">Массив</param>
/// <param name="pred">Предикат</param>
/// <returns>Число элементов, удовлетворяющих предикату</returns>
function CountPred(a: array of integer; pred: IntPredicate): integer;

/// <summary>
/// Выполняет сдвиг элементов массива с индексами от indexFrom до indexTo на
/// одну позицию вправо. Освобожденный элемент получает значение по 
/// умолчанию для своего типа.
/// </summary>
/// <param name="a">Массив</param>
/// <param name="indexFrom">Индекс первого сдвигаемого элемента</param>
/// <param name="indexTo">Индекс последнего сдвигаемого элемента</param>
procedure ShiftRight<T>(a: array of T; indexFrom, indexTo: integer);

/// <summary>
/// Сдвигает все элементы массива вправо на одну позицию. Первый элемент 
/// получает значение по умолчанию для своего типа.
/// </summary>
/// <param name="a">Массив</param>
procedure ShiftRight<T>(a: array of T);

/// <summary>
/// Вставляет элемент value в массив в позицию index
/// </summary>
/// <param name="a">Массив</param>
/// <param name="n">Фактическая длина массива</param>
/// <param name="element">Новый элемент</param>
/// <param name="idx">Индекс для вставки</param>
procedure Insert<T>(a: array of T; var n: integer; element: T; index: integer);   
  
  
// ************************************* Занятие 16

// TODO tasks #1-#3

/// Удваивает длину массива и заполняет вторую половину
/// элементами из первой
procedure DoubleArr<T>(var a: array of T);  // TODO исправьте тип формального 
                                        // параметра (входной, входно-выходной, 
                                        // выходной)

// TODO task #5

/// <summary>
/// Вставляет в начало массива значение по умолчанию
/// </summary>
/// <param name="a">Массив</param>
/// <param name="n">Фактическая длина</param>
procedure AddFirstDefault<T>(a: array of T; var n: integer);  

// TODO task #7

// TODO task #8 
  

// ======================================== Секция реализации 
implementation

// Конструирует и возвращает массив, состоящий
// из чисел-аргументов функции 
function MakeIntArr(params args: array of integer): IntArr;
begin
  result := new integer[args.Length];
  for var i := 0 to args.Length - 1 do
    result[i] := args[i];
end;

// Конструирует и возвращает массив, состоящий
// из аргументов функции
function MakeArr<T>(params args: array of T): array of T; 
begin
  result := new T[args.Length];
  for var i := 0 to args.Length - 1 do
    result[i] := args[i];
end;

// ************************************* Занятие 15

// Находит сумму элементов массива a целых чисел
function ArraySum(a: IntArr): integer; 
begin
  Assert(a <> nil, 'ArraySum: a <> nil');
  Result := 0;      // заглушка
  for var i := 0 to a.Length-1 do result += a[i];
end;

// TODO tasks #1-#6

function PrintIntArr(a: IntArr; del: string): string; 
begin
  Assert(a <> nil);
  Assert(del <> '');
  Result := '';      // заглушка
  for var i := 0 to a.Length-1 do
    begin
    result += $'{a[i]}{del}'
    end;
end;


function MakeOddArr(n: integer): IntArr;
begin
  result:= new integer[n];
  var i:= 0;
  var j:= 1;
  while i <> n do
  begin
    result[i] := j;
    j += 2;
    i += 1;
  end;
end;

procedure FillOddArr(n: integer; arr: IntArr);
begin
  arr:= new integer[n];
  var i:= 0;
  var j:= 1;
  while i <> n do
  begin
    arr[i] := j;
    j += 2;
    i += 1;
  end;
  println(arr);
end;
 
// Возвращает минимальный элемент непустого массива вещественных чисел
function FindMinReal(a: RealArr): real;
begin
  // TODO проверка ввода (a <> nil и не пуст)
  // TODO решение
  Result := 0;      // заглушка
end;

// TODO task #8

procedure PrintElemsLessLeft(a: IntArr);
begin
  for var i := 1 to a.Length - 1 do
    if a[i] < a[i - 1] then
      print(i);
end;

procedure PrintArray<T>(a: array of T; delim: string);
begin
  if a.Length = 0 then
    Print('<empty>')
  else
  begin
    for var i := 0 to a.Length - 2 do
      print($'{a[i]}{delim}');
    print(a[a.Length - 1]);
  end;
end;

// ************************************* Подпрограммы из шпаргалки

// Определяет количество элементов в массиве, удовлетворяющих заданному
// предикату pred
function CountPred(a: IntArr; pred: IntPredicate): integer;
begin
  Assert(a <> nil, 'CountPred: a <> nil');
  Result := 0;
  for var i := 0 to a.Length - 1 do
    if pred(a[i]) then
      Result += 1;
end;    


function ReadIntArr(arr: IntArr): IntArr;
begin
  
end;

function CountTwoDigit(var a: array of integer): integer;
begin
  result:= CountPred(a, x -> (x > 9) and (x < 100));
end;                
             
// Выполняет сдвиг элементов массива с индексами от indexFrom до indexTo на
// одну позицию вправо. Освобожденный элемент получает значение по 
// умолчанию для своего типа.
procedure ShiftRight<T>(a: array of T; indexFrom, indexTo: integer);
begin
  Assert(a <> nil, 'ShiftRight<T>: a <> nil');
  Assert((0 <= indexFrom) and (indexFrom <= indexTo) and (indexTo < a.Length),
    'ShiftRight<T>: indices check');
  for var i := indexTo downto indexFrom + 1 do
    a[i] := a[i - 1];
  a[indexFrom] := default(T) ;
end;

// Сдвигает все элементы массива вправо на одну позицию. Первый элемент 
// получает значение по умолчанию для своего типа.
procedure ShiftRight<T>(a: array of T);
begin
  Assert(a <> nil, 'ShiftRight<T>: a <> nil');
  ShiftRight(a, 0, a.Length - 1);
end;

// Вставляет элемент element в массив в позицию index
procedure Insert<T>(a: array of T; var n: integer; element: T; index: integer);
begin
  Assert(a <> nil, 'Insert<T>: a <> nil');
  Assert((0 <= index) and (index <= n) and (n < a.Length),
    'Insert<T>: indices check');
  ShiftRight(a, index, n);
  n += 1;
  a[index] := element;
end;    


function MakeFibArr(n:integer): IntArr;
begin
  var l1 := 1;
  var l2 := 1;
  result := new integer[n];
  if n > 0 then
    result[0]:= l1;
  if n > 1 then
    result[1]:= l2;
  for var i := 2 to n - 1 do
  begin
    result[i] := l1 + l2;
    l1 := l2;
    l2 := result[i];
  end;
end;

procedure EvenMult2(a: IntArr; var evensCnt: integer);
begin
  for var i := 0 to a.Length-1 do
  begin
    if a[i] mod 2 = 0 then
      a[i] *= 2;
      evensCnt += 1;
  end;
end;
// ************************************* Занятие 16

// TODO tasks #1-#3

// Удваивает длину массива и заполняет вторую половину
// элементами из первой
procedure DoubleArr<T>(var a: array of T);  // TODO исправьте тип формального 
                                        //параметра (входной, входно-выходной, 
                                        // выходной)
begin
  if a.Length = 0 then
    println('empty array')
  else
  begin
    var new_a := new T[a.Length * 2];
    //println(a, new_a);
    for var i:= 0 to new_a.Length - 1 do
    begin
      if i < a.Length then
        new_a[i] := a[i]
      else
        new_a[i] := a[i - a.Length];
    end;
    a := new_a;
  end;
end;    
                
// Вставляет в начало массива значение по умолчанию
procedure AddFirstDefault<T>(a: array of T; var n: integer); 
begin
  // TODO решение
end;                
           
// TODO task #7

// TODO task #8       
           


end.
