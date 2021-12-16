/// <summary>
/// Модуль подпрограмм для базовой работы с динамическими массивами
/// </summary>
unit DynArrs;

// ============================================== Раздел интерфейса
interface

type
  /// Динамический массив целых чисел
  IntArr = array of integer;
  /// Динамический массив вещественных чисел
  RealArr = array of real;

// ------------------------------ Чтение массива

/// <summary>
/// Считывает n целых чисел и формирует массив, состоящий из этих значений
/// </summary>
/// <param name="n">Число элементов -- длина массива (>= 0)</param>
/// <returns>Массив из считанных чисел</returns>
function ReadIntArr(n: integer): IntArr;

/// <summary>
/// Считывает n вещественных чисел и формирует массив, состоящий из этих значений
/// </summary>
/// <param name="n">Число элементов -- длина массива (>= 0)</param>
/// <returns>Массив из считанных чисел</returns>
function ReadRealArr(n: integer): RealArr;

// ------------------------------ Конструирование массива

/// <summary>
/// Конструирует и возвращает массив, состоящий
/// из аргументов функции
/// </summary>
/// <param name="args">Аргументы-элементы массива</param>
/// <returns>Массив</returns>
function MakeArr<T>(params args: array of T): array of T;

/// <summary>
/// Конструирует и возвращает целочисленный массив, состоящий
/// из аргументов функции-целых чисел
/// </summary>
/// <param name="args">Аргументы-элементы массива</param>
/// <returns>Массив</returns>
function MakeIntArr(params args: IntArr): IntArr;  

/// <summary>
/// Конструирует и возвращает целочисленный массив размера n, состоятщий из
/// случайных зачений в диапазоне [a, b]
/// </summary>
/// <param name="n">Размер массива (>= 0)</param>
/// <param name="a">Нижняя граница диапазона значений</param>
/// <param name="b">Верхняя граница диапазона значений</param>
/// <returns>Массив целых чисел</returns>
function MakeRandomIntArr(n: integer; 
  a: integer := -100; b: integer := 100): IntArr;
  
/// <summary>
/// Конструирует и возвращает вещественный массив размера n, состоятщий из
/// случайных зачений в диапазоне [a, b)
/// </summary>
/// <param name="n">Размер массива (>= 0)</param>
/// <param name="a">Нижняя граница диапазона значений</param>
/// <param name="b">Верхняя граница диапазона значений</param>
/// <returns>Массив вещественных чисел</returns>
function MakeRandomRealArr(n: integer; 
  a: real := -100; b: real := 100): RealArr;

// ------------------------------ Печать массива

/// <summary>
/// Выводит на консоль содержимое массива a, разделяя элементы 
/// строкой delim
/// </summary>
/// <param name="a">Массив</param>
/// <param name="delim">Строка-разделитель</param>
procedure PrintArr<T>(a: array of T; delim: string := '; ');
/// <summary>
/// Выводит на консоль содержимое массива a, разделяя элементы 
/// строкой delim, с переходом на новую строку
/// </summary>
/// <param name="a">Массив</param>
/// <param name="delim">Строка-разделитель</param>
procedure PrintlnArr<T>(a: array of T; delim: string := '; ');


// ============================================== Раздел реализации
implementation

// ------------------------------ Чтение массива

// Считывает n целых чисел и формирует массив, состоящий из этих значений
function ReadIntArr(n: integer): IntArr;
begin
  Assert(n >= 0, 'ReadIntArr: n >= 0');
  Result := new integer[n];
  for var i := 0 to Result.Length - 1 do
    Result[i] := ReadInteger;
end;

// Считывает n вещественных чисел и формирует массив, состоящий из этих значений
function ReadRealArr(n: integer): RealArr;
begin
  Assert(n >= 0, 'ReadRealArr: n >= 0');
  Result := new real[n];
  for var i := 0 to Result.Length - 1 do
    Result[i] := ReadReal;
end;

// ------------------------------ Конструирование массива

// Конструирует и возвращает массив, состоящий
// из аргументов функции
function MakeArr<T>(params args: array of T): array of T; 
begin
  Result := new T[args.Length];
  for var i := 0 to args.Length - 1 do
    Result[i] := args[i];
end;

// Конструирует и возвращает целочисленный массив, состоящий
// из аргументов функции-целых чисел
function MakeIntArr(params args: IntArr): IntArr; 
begin
  Result := new integer[args.Length];
  for var i := 0 to args.Length - 1 do
    Result[i] := args[i];
end; 

// Конструирует и возвращает целочисленный массив размера n, состоятщий из
// случайных зачений в диапазоне [a, b]
function MakeRandomIntArr(n: integer; a: integer; b: integer): IntArr;
begin
  Assert(n >= 0, 'MakeRandomIntArr: n >= 0');
  Assert(a <= b, 'MakeRandomIntArr: a <= b');
  Result := new integer[n];
  for var i := 0 to Result.Length - 1 do
    Result[i] := Random(a, b);
end;

// Конструирует и возвращает вещественный массив размера n, состоятщий из
// случайных зачений в диапазоне [a, b)
function MakeRandomRealArr(n: integer; a: real; b: real): RealArr;
begin
  Assert(n >= 0,  'MakeRandomRealArr: n >= 0');
  Assert(a <= b,  'MakeRandomRealArr: a <= b');
  var dist := b - a;
  Result := new real[n];
  for var i := 0 to Result.Length - 1 do
    Result[i] := a + Random * dist;
end;

// ------------------------------ Печать массива

// Выводит на консоль содержимое массива a, разделяя элементы 
// строкой delim
procedure PrintArr<T>(a: array of T; delim: string);
begin
  Assert(a <> nil,    'PrintArr<T>: a <> nil');
  Assert(delim <> '', 'PrintArr<T>: delim <> ""');
  if a.Length = 0 then
    Write('<empty array>')
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
  Assert(a <> nil,    'PrintlnArr<T>: a <> nil');
  Assert(delim <> '', 'PrintlnArr<T>: delim <> ""');
  PrintArr(a, delim);
  Writeln;
end;

end.