/// <summary>
/// Модуль подпрограмм высшего порядка (high order) для работы
/// с динамическими массивами
/// </summary>
unit HigherOrderFuncs;

// ============================================== Раздел интерфейса
interface

type
  /// Динамический массив целых чисел
  IntArr = array of integer;
  /// Динамический массив вещественных чисел
  RealArr = array of real;

type
  /// Унарная целочисленная функция
  IntUnaryFun = integer-> integer;
  /// Бинарная функция целых чисел
  IntBinOp = (integer,integer) -> integer;

type
  /// Предикат одного целого аргумента
  IntPredicate = integer-> boolean;
  
  /// Обобщённый предикат элемента типа T
  Predicate<T> = T-> boolean;

type
  FolderFun<T, U> = function(acc: U; x: T): U;

// ------------------------------ Вспомогательные подпрограммы

/// Конструирует пустой целочисленный массив
function EmptyIntArr(): array of integer;

// ------------------------------ Подпрограммы из заданий

// ----------------- #1

/// <summary>
/// Применяет функцию f ко всем элементам массива и возвращает новый массив,
/// состоящий из элементов-результатов применения функции
/// </summary>
/// <param name="a">Исходный массив</param>
/// <param name="f">Функция</param>
/// <returns>Массив применений функции f</returns>
function IntMap(a: IntArr; f: IntUnaryFun): IntArr;

/// <summary>
/// Удваивает значение аргумента и возвращает результат
/// </summary>
/// <param name="x">Аргумент-число</param>
/// <returns>Удвоенное значение x</returns>
function DoubleVal(x: integer): integer;

/// <summary>
/// Находит наибольшее положительное число, квадрат которого
/// является делителем данного ненулевого числа
/// </summary>
/// <param name="x">Аргумент-число (x <> 0)</param>
/// <returns>Наибольшее число, квадрат которого делит x</returns>
function MaxSqrDivisor(x: integer): integer;

// ----------------- #2

/// <summary>
/// Выбирает из массива элементы, удовлетворяющие предикату p, и возвращает
/// массив, состоящий из этих элементов
/// </summary>
/// <param name="a">Исходный массив</param>
/// <param name="pred">Предикат</param>
/// <returns>Массив элементов входного массива, удовлетворяющих p</returns>
function IntFilter(a: IntArr; pred: IntPredicate): IntArr;

/// <summary>
/// Проверяет положительность аргумента x
/// </summary>
/// <param name="x">Число-аргумент</param>
/// <returns>Истину, если x положительно</returns>
function IsPositive(x: integer): boolean;

/// <summary>
/// Проверяет, делится ли аргумент x на глобальную-переменную делитель
/// </summary>
/// <param name="x">Число аргумент</param>
/// <returns>Истину, если x делится на глобальную переменную-делитель</returns>
function IsDivisible(x: integer): boolean;

/// <summary>
/// Задаёт значение глобальной целочисленной переменной-делителя
/// </summary>
/// <param name="value">Значение делителя (<> 0)</param>
procedure SetDivisor(value: integer);

/// <summary>
/// Получает значение глобальной переменной-делителя
/// </summary>
/// <returns>Значение глобальной переменной-делителя</returns>
function GetDivisor: integer;

/// <summary>
/// Считывает с консоли целое число-возможный делитель
/// </summary>
/// <returns>Целое число <> 0</returns>
function ReadDivisor: integer;

// ----------------- #3

/// <summary>
/// Выбирает из массива элементы, удовлетворяющие предикату p, и возвращает
/// массив, состоящий из этих элементов
/// </summary>
/// <param name="a">Исходный массив</param>
/// <param name="p">Предикат</param>
/// <returns>Массив элементов входного массива, удовлетворяющих p</returns>
function Filter<T>(a: array of T; p: Predicate<T>): array of T;

/// <summary>
/// Предикат: целая часть вещественного числа нечётна
/// </summary>
/// <param name="x">Аргумент</param>
/// <returns>Истину, если целая часть вещственного числа нечётна</returns>
function IntPartOdd(x: real): boolean;

// ----------------- #4

/// <summary>
/// Применяет функцию f к парам соответствующих элементов массивов a, b
/// и возвращает новый массив
/// </summary>
/// <param name="a">Первый массив</param>
/// <param name="b">Второй массив</param>
/// <param name="f">Бинарная целочисленная функция сбора пары элементов</param>
/// <returns>Массив применений функции</returns>
function IntZipWith(a, b: IntArr; f: IntBinOp): IntArr;

/// <summary>
/// Сумма двух чисел x, y
/// </summary>
/// <param name="x">Первое число</param>
/// <param name="y">Второе число</param>
/// <returns>Сумма</returns>
function Sum(x, y: integer): integer;

// ----------------- #extra-1

/// <summary>
/// Сворачивает элементы массива a с помощью функции f. В качестве начального
/// значения используется acc
/// </summary>
/// <param name="a">Массив целых чисел</param>
/// <param name="f">Функция свёртки</param>
/// <param name="acc">Начальное значение аккумулятора</param>
/// <returns>Свёртку массива с помощью функции acc</returns>
function IntFoldLeft(a: IntArr; f: IntBinOp; acc: integer): integer;

/// <summary>
/// Бинарная целочисленная функция для свёртки суммы чётных чисел
/// </summary>
/// <param name="acc">Аккумулятор</param>
/// <param name="x">Очередной аргумент</param>
/// <returns>Свёртку суммы чётных чисел</returns>
function EvenSumFolder(acc: integer; x: integer): integer;

/// <summary>
/// Бинарная целочисленная функция для свёртки максимального числа
/// </summary>
/// <param name="acc">Аккумулятор</param>
/// <param name="x">Очередной аргумент</param>
/// <returns>Свёртку максимума</returns>
function MaxFolder(acc: integer; x: integer): integer;

// ----------------- #extra-2

/// <summary>
/// Свёртка массива элементов типа T с помощью функции f
/// </summary>
/// <param name="a">Массив</param>
/// <param name="f">Функция свёртки</param>
/// <param name="acc">Начальное значение аккумулятора</param>
/// <returns>Свёртку массива a функцией f</returns>
function FoldLeft<T, U>(a: array of T; f: FolderFun<T, U>; acc: U): U;

/// <summary>
/// Функция свёртки наличия положительных элементов
/// </summary>
/// <param name="acc">Значение аккумулятора</param>
/// <param name="x">Очередной элемент</param>
/// <returns>Свёртку аккумулятора с x для проверки положительных чисел</returns>
function HasPositiveFolder(acc: boolean; x: real): boolean;


// ============================================== Раздел реализации
implementation

var
  /// Возможный делитель
  divisor: integer;

// ------------------------------ Вспомогательные подпрограммы

// Конструирует пустой целочисленный массив
function EmptyIntArr := new integer[0];

// Выводит на консоль содержимое массива a, разделяя элементы
// строкой delim
procedure PrintArr<T>(a: array of T; delim: string);
begin
  Assert(a <> nil, 'PrintArr<T>: a <> nil');
  Assert(delim <> '', 'PrintArr<T>: delim <> ""');
  if a.Length = 0 then
    write('<empty array>')
  else
  begin
    for var i := 0 to a.Length - 2 do
      Write(a[i], delim);
    Write(a[a.Length - 1]);
  end;
end;

// Выводит на консоль содержимое массива a, разделяя элементы
// строкой delim, с переходом на новую строку
procedure PrintlnArr<T>(a: array of T; delim: string);
begin
  Assert(a <> nil, 'PrintlnArr<T>: a <> nil');
  Assert(delim <> '', 'PrintlnArr<T>: delim <> ""');
  PrintArr(a, delim);
  Writeln;
end;

// ------------------------------ Подпрограммы из заданий

// ----------------- #1

// Применяет функцию f ко всем элементам массива и возвращает новый массив,
// состоящий из элементов-результатов применения функции
function IntMap(a: IntArr; f: IntUnaryFun): IntArr;
begin
  Assert(a <> nil, 'IntMap: a <> nil');
  Assert(f <> nil, 'IntMap: f <> nil');
  // TODO: реализация
  Result := new integer[a.Length];
  for var i := 0 to a.Length - 1 do
  begin
    result[i] := f(a[i]);
  end;
end;

// Удваивает значение аргумента и возвращает результат
function DoubleVal(x: integer): integer;
begin
  // TODO: реализация
  Result := x * 2;
end;

// Находит наибольшее положительное число, квадрат которого
// является делителем данного ненулевого числа
function MaxSqrDivisor(x: integer): integer;
begin
  Assert(x <> 0, 'MaxSqrDivisor: x <> 0');
  // TODO: реализация
  Result := 0;
  for var i := 1 to round(sqrt(x)) do
  begin
    if x mod (i * i) = 0 then
      result := i;
  end;
end;


// ----------------- #2

// Выбирает из массива элементы, удовлетворяющие предикату p, и возвращает
// массив, состоящий из этих элементов
function IntFilter(a: IntArr; pred: IntPredicate): IntArr;
begin
  Assert(a <> nil, 'IntFilter: a <> nil');
  Assert(pred <> nil, 'IntFilter: pred <> nil');
  // TODO: реализация
  var c:= 0;
  for var i := 0 to a.Length - 1 do
  begin
    if pred(a[i]) then
      c += 1;
  end;
  
  var j:= 0;
  Result := new integer[c];
  for var i := 0 to a.Length - 1 do
  begin
    if pred(a[i]) then
      begin
      result[j] := a[i];
      j += 1;
      end;
  end;
end;

// Проверяет положительность аргумента x
function IsPositive(x: integer): boolean;
begin
  // TODO: реализация
  Result := x > 0;
end;

// Проверяет, делится ли аргумент x на глобальную-переменную делитель
function IsDivisible(x: integer): boolean;
begin
  Assert(divisor <> 0, 'Divisible: divisor <> 0');
  // TODO: реализация
  Result := x mod divisor = 0;
end;

// Задаёт значение глобальной целочисленной переменной-делителя
procedure SetDivisor(value: integer);
begin
  Assert(value <> 0, 'SetDivisor: divisor <> 0');
  divisor := value;
end;

// Получает значение глобальной переменной-делителя
function GetDivisor: integer;
begin
  Result := divisor;
end;

// Считывает с консоли целое число-возможный делитель
function ReadDivisor: integer;
begin
  Result := 0;
  // TODO: реализовать чтение целого числа.
  // Повторять ввод, пока не будет введено число <> 0
  divisor := ReadInteger('div:');
end;

// ----------------- #3

// Выбирает из массива элементы, удовлетворяющие предикату p, и возвращает
// массив, состоящий из этих элементов
function Filter<T>(a: array of T; p: Predicate<T>): array of T;
begin
  Assert(a <> nil, 'Filter: a <> nil');
  Assert(p <> nil, 'Filter: p <> nil');
  // TODO: реализация
  var total: array of T;
  var c:= 0;
  for var i := 0 to a.Length - 1 do
  begin
    if p(a[i]) then
      c += 1;
  end;
  
  var j:= 0;
  SetLength(total, c);
  for var i := 0 to a.Length - 1 do
  begin
    if p(a[i]) then
      begin
      total[j] := a[i];
      j += 1;
      end;
  end;
  result := total;
end;

// Предикат: целая часть вещественного числа нечётна
function IntPartOdd(x: real): boolean;
begin
  // TODO: реализация
  Result := trunc(x) mod 2 <> 0;
end;

// ----------------- #4

// Применяет функцию f к парам соответствующих элементов массивов a, b
// и возвращает новый массив
function IntZipWith(a, b: IntArr; f: IntBinOp): IntArr;
begin
  Assert(a <> nil, 'IntZipWith: a <> nil');
  Assert(b <> nil, 'IntZipWith: b <> nil');
  Assert(a.Length = b.Length, 'IntZipWith: a.Length = b.Length');
  // TODO: реализация
  Result := new integer[a.Length];
  for var i := 0 to a.Length - 1 do
  begin
    result[i] := f(a[i], b[i]);
  end;
end;

// Сумма двух чисел x, y
function Sum(x, y: integer): integer;
begin
  // TODO: реализация
  Result := x + y;
end;

// ----------------- #extra-1

// Сворачивает элементы массива a с помощью функции f. В качестве начального
// значения используется acc
function IntFoldLeft(a: IntArr; f: IntBinOp; acc: integer): integer;
begin
  Assert(a <> nil, 'IntFoldLeft: a <> nil');
  Assert(f <> nil, 'IntFoldLeft: f <> nil');
  // TODO: реализация
  Result := 0;
end;

// Бинарная целочисленная функция для свёртки суммы чётных чисел
function EvenSumFolder(acc: integer; x: integer): integer;
begin
  // TODO: реализация
  Result := 0;
end;

// Бинарная целочисленная функция для свёртки максимального числа
function MaxFolder(acc: integer; x: integer): integer;
begin
  // TODO: реализация
  Result := 0;
end;

// ----------------- #extra-2

// Свёртка массива элементов типа T с помощью функции f
function FoldLeft<T, U>(a: array of T; f: FolderFun<T, U>; acc: U): U;
begin
  Assert(a <> nil, 'FoldLeft: a <> nil');
  Assert(f <> nil, 'FoldLeft: f <> nil');
  // TODO: реализация
  Result := default(U);
end;

// Функция свёртки наличия положительных элементов
function HasPositiveFolder(acc: boolean; x: real): boolean;
begin
  // TODO: реализация
  Result := false;
end;


end.
