unit Matrix;

// ============================================== Раздел интерфейса
interface

uses DynArrs;

type
  /// Матрица целых чисел
  IntMatrix = array [,] of integer;
  /// Матрица вещественных чисел
  RealMatrix = array [,] of real;

// ------------------------------ Чтение матрицы

/// <summary>
/// Считывает N * M целых чисел и формирует матрицу в M строк по N столбцов, 
/// состоящую из этих значений
/// </summary>
/// <param name="m">Число строк матрицы (>= 0)</param>
/// <param name="n">Число столбцов матрицы (>= 0)</param>
/// <returns>Матрица из считанных чисел</returns>
function ReadIntMatrix(m: integer; n: integer): IntMatrix;
function ReadRepLineIntMatrix(m: integer; n: integer; a: array of integer): IntMatrix;
function MinAmongMaxInColumns(m: IntMatrix): array of integer;
procedure MatrixSumAndProd(arr : IntMatrix; var sum, mul: integer);
/// <summary>
/// Считывает N * M целых чисел и формирует матрицу в M строк по N столбцов, 
/// состоящую из этих значений
/// </summary>
/// <param name="m">Число строк матрицы (>= 0)</param>
/// <param name="n">Число столбцов матрицы (>= 0)</param>
/// <returns>Матрица из считанных чисел</returns>
function ReadRealMatrix(m: integer; n: integer): RealMatrix;

// ------------------------------ Конструирование матрицы

/// <summary>
/// Создает матрицу размера M x N, состоящую из элементов, перечисленных 
/// в качестве аргументов при вызове. Аргументы перечисляют элементы
/// матрицы по строкам слева направо (строки сверху вниз).
/// </summary>
/// <param name="m">Число строк матрицы (>= 0)</param>
/// <param name="n">Число столбцов матрицы (>= 0)</param>
/// <param name="args">Элементы матрицы</param>
/// <returns>Матрицу, состояющую из заданных элементов</returns>
function MakeMatrix<T>(m: integer; n: integer;
                       params args: array of T): array [,] of T;
                       
/// <summary>
/// Создаёт копию матрицы source
/// </summary>
/// <param name="source">Матрица</param>
/// <returns>Копия матрицы source</returns>
function CopyMatrix<T>(source: array [,] of T): array [,] of T;
                       
/// <summary>
/// Конструирует и возвращает целочисленную матрицу размера M x N, 
/// состоящую из случайных зачений в диапазоне [a, b]
/// </summary>
/// <param name="m">Число строк матрицы (>= 0)</param>
/// <param name="n">Число столбцов матрицы (>= 0)</param>
/// <param name="a">Нижняя граница диапазона значений</param>
/// <param name="b">Верхняя граница диапазона значений</param>
/// <returns>Матрица целых чисел</returns>
function MakeRandomIntMatrix(m: integer; n: integer; 
  a: integer := -100; b: integer := 100): IntMatrix;
  
/// <summary>
/// Конструирует и возвращает вещественную матрицу размера M x N, 
/// состоящую из случайных зачений в диапазоне [a, b)
/// </summary>
/// <param name="m">Число строк</param>
/// <param name="n">Число столбцов</param>
/// <param name="a">Нижняя граница диапазона значений</param>
/// <param name="b">Верхняя граница диапазона значений</param>
/// <returns>Матрица вещественных чисел</returns>
function MakeRandomRealMatrix(m: integer; n: integer; 
  a: real := -100; b: real := 100): RealMatrix;

// ------------------------------ Печать матрицы
                       
/// <summary>
/// Выводит на консоль содержимое матрицы m, разделяя элементы 
/// одной строки матрицы с помощью строки delim, с переходом на новую строку
/// </summary>
/// <param name="m">Матрица</param>
/// <param name="delim">Строка-разделитель</param>
procedure PrintlnMatrix<T>(m: array [,] of T; delim: string := '; ');

// ------------------------------ Подпрограммы из заданий

/// <summary>
/// Создаёт матрицу размера M x N, состоящую из элементов v
/// </summary>
/// <param name="m">Число строк</param>
/// <param name="n">Число столбцов</param>
/// <param name="v">Элемент</param>
/// <returns>Матрицу из элементов v</returns>
function MakeRepMatrix<T>(m, n: integer; v: T): array [,] of T;

/// <summary>
/// Находит сумму элементов главной диагонали квадратной матрицы
/// </summary>
/// <param name="m">Матрица вещественных чисел</param>
/// <returns>Сумма элементов главной диагонали</returns>
function MainDiagonalSum(m: RealMatrix): real;

/// <summary>
/// Меняет местами верхнюю и нижнюю половины матрицы m.
/// </summary>
/// <param name="m">Матрица с чётным числом строк</param>
procedure SwapTopBottomHalfs<T>(m: array [,] of T);

// ============================================== Раздел реализации
implementation

// ------------------------------ Чтение матрицы

// Считывает N * M целых чисел и формирует матрицу в M строк по N столбцов, 
// состоящую из этих значений
function ReadIntMatrix(m: integer; n: integer): IntMatrix;
begin
  Assert(m > 0, 'ReadIntMatrix: m > 0');
  Assert(n > 0, 'ReadIntMatrix: n > 0');
  result := new integer[m, n];
  for var i := 0 to m - 1 do
    for var j := 0 to n - 1 do
      result[i, j] := ReadInteger;
end;




// Считывает N * M целых чисел и формирует матрицу в M строк по N столбцов, 
// состоящую из этих значений
function ReadRealMatrix(m: integer; n: integer): RealMatrix;
begin
  Assert(m > 0, 'ReadRealMatrix: m > 0');
  Assert(n > 0, 'ReadRealMatrix: n > 0');
  result := new real[m, n];
  for var i := 0 to m - 1 do
    for var j := 0 to n - 1 do
      result[i, j] := ReadReal;
end;

// ------------------------------ Конструирование матрицы

// Создает матрицу размера M x N, состоящую из элементов, перечисленных 
// в качестве аргументов при вызове. Аргументы перечисляют элементы
// матрицы по строкам слева направо (строки сверху вниз).
function MakeMatrix<T>(m: integer; n: integer;
                       params args: array of T): array [,] of T;
begin
  Assert(m > 0, 'MakeMatrix<T>: m > 0');
  Assert(n > 0, 'MakeMatrix<T>: n > 0');
  Assert(args.Length = m * n, 'MakeMatrix<T>: args.Length = m * n');
  result := new T[m, n];
  var k := 0;
  for var i := 0 to result.GetLength(0) - 1 do
    for var j := 0 to result.GetLength(1) - 1 do
    begin
      result[i, j] := args[k];
      k += 1;
    end;
end;

// Создаёт копию матрицы source
function CopyMatrix<T>(source: array [,] of T): array [,] of T;
begin
  Assert(source <> nil,   'CopyMatrix<T>: source <> nil');
  var m := source.GetLength(0);
  var n := source.GetLength(1);
  result := new T[m, n];
  for var i := 0 to m - 1 do
    for var j := 0 to n - 1 do
      result[i, j] := source[i, j];
end;

// Конструирует и возвращает целочисленную матрицу размера M x N, 
// состоящую из случайных зачений в диапазоне [a, b]
function MakeRandomIntMatrix(m: integer; n: integer; 
  a: integer; b: integer): IntMatrix;
begin
  Assert(m > 0,   'MakeRandomIntMatrix: m > 0');
  Assert(n > 0,   'MakeRandomIntMatrix: n > 0');
  Assert(a <= b,  'MakeRandomIntMatrix: a <= b');
  result := new integer[m, n];
  for var i := 0 to m - 1 do
    for var j := 0 to n - 1 do
      result[i, j] := Random(a, b);
end;
  
// Конструирует и возвращает вещественную матрицу размера M x N, 
// состоящую из случайных зачений в диапазоне [a, b)
function MakeRandomRealMatrix(m: integer; n: integer; a: real; b: real): RealMatrix;
begin
  Assert(m > 0,   'MakeRandomRealMatrix: m > 0');
  Assert(n > 0,   'MakeRandomRealMatrix: n > 0');
  Assert(a <= b,  'MakeRandomRealMatrix: a <= b');
  result := new real[m, n];
  var dist := b - a;
  for var i := 0 to m - 1 do
    for var j := 0 to n - 1 do
      result[i, j] := a + Random * dist;
end;

// ------------------------------ Печать матрицы

/// <summary>
/// Выводит на консоль содержимое строки матрицы m с номером line,
/// разделяя элементы с помощью строки delim, с переходом на новую строку
/// </summary>
/// <param name="m">Матрица</param>
/// <param name="line">Номер строки матрицы</param>
/// <param name="delim">Строка-разделитель элементов</param>
procedure PrintlnMatrixLine<T>(m: array [,] of T; line: integer; delim: string);
begin
  Assert(m <> nil,    'PrintlnMatrix<T>: m <> nil');
  Assert((0 <= line) and (line < m.GetLength(0)),
    'PrintlnMatrix<T>: (0 <= line) and (line < m.Length(0)');
  Assert(delim <> '', 'PrintlnMatrix<T>: delim <> ""');
  if m.GetLength(1) = 0 then
    WriteFormat('<empty line {0}>', line)
  else
  begin
    for var col := 0 to m.GetLength(1) - 2 do
      Write(m[line, col]:4, delim);
    Write(m[line, m.GetLength(1) - 1]:4);
  end;
  Writeln;
end;

// Выводит на консоль содержимое матрицы m, разделяя элементы 
// одной строки матрицы с помощью строки delim, с переходом на новую строку
procedure PrintlnMatrix<T>(m: array [,] of T; delim: string);
begin
  Assert(m <> nil,    'PrintlnMatrix<T>: m <> nil');
  Assert(delim <> '', 'PrintlnMatrix<T>: delim <> ""');
  if m.GetLength(0) = 0 then
    Writeln('<empty matrix>')
  else
  begin
    for var i := 0 to m.GetLength(0) - 1 do
      PrintlnMatrixLine(m, i, delim);
  end;
end;


// ------------------------------ Подпрограммы из заданий

// Создаёт матрицу размера M x N, состоящую из элементов v
function MakeRepMatrix<T>(m, n: integer; v: T): array [,] of T;
begin
  Assert(m >= 0, 'MakeRepMatrix<T>: m >= 0');
  Assert(n >= 0, 'MakeRepMatrix<T>: n >= 0');
  
  result := new T[m, n];
  
  for var i := 0 to m - 1 do
    for var j := 0 to n - 1 do
      result[i,j] := v;
end;

function ReadRepLineIntMatrix(m: integer; n: integer; a: array of integer): IntMatrix;
begin
  Assert(m >= 0, 'MakeRepMatrix<T>: m >= 0');
  Assert(n >= 0, 'MakeRepMatrix<T>: n >= 0');
  
  result := new integer[m, n];
  
  for var i := 0 to m - 1 do
    for var j := 0 to n - 1 do
      result[i,j] := a[j];
end;


procedure MatrixSumAndProd(arr : IntMatrix; var sum, mul: integer);
begin
  Assert(arr <> nil);
  
  sum := 0;
  mul:= 1;
  
  for var i := 0 to arr.GetLength(0) - 1 do
    for var j := 0 to arr.GetLength(1) - 1 do
    begin
      sum += arr[i,j];
      mul *= arr[i, j];
  end;
end;


function MinAmongMaxInColumns(m: IntMatrix): array of integer;
begin
  result := new integer[m.GetLength(1)];
  
  for var i := 0 to m.GetLength(1) - 1 do
  begin
    var max:=integer.MinValue;
    for var j := 0 to m.GetLength(0) - 1 do
    begin
      if(m[j,i]>max) then
      max := m[j,i];
    end;
    
  result[i]:=max;
  end;
end;

// Находит сумму элементов главной диагонали квадратной матрицы
function MainDiagonalSum(m: RealMatrix): real;
begin
  // TODO проверка входных параметров
  // TODO решение
  Result := 0;        // заглушка  
end;

// Меняет местами верхнюю и нижнюю половины матрицы m.
procedure SwapTopBottomHalfs<T>(m: array [,] of T);
begin
  // TODO проверка входных параметров
  // TODO решение
end;





end.