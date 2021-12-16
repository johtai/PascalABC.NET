unit MatrixUnittests;

// ============================================== Раздел интерфейса
interface

uses Matrix, DynArrs;

/// Тестирует функцию создания матрицы из одинаковых элементов
procedure TestMakeRepMatrix;

/// Тестирует функцию подсчёта суммы элементов главной диагонали
procedure TestMainDiagonalSum;

/// Тестирует процедуру перемены местами верхней и нижней половин матрицы
procedure TestSwapTopBottomHalfs;

// ============================================== Раздел реализации
implementation

const
  REAL_EPSILON = 0.0000000001;    // константа для сравнения вещественных чисел

/// Выводит сообщение о пройденных тестах
procedure PrintTestsSuccess(name: string);
begin
  WritelnFormat('CHECK {0,15}: тесты пройдены', name);
end;

/// Проверяет матрицы a, b на равенство и возвращает
/// истину, если они равны
function MatricesAreEqual<T>(a, b: array [,] of T): boolean; 
begin
  Assert(a <> nil, 'MatricesAreEqual<T>: a <> nil');
  Assert(b <> nil, 'MatricesAreEqual<T>: b <> nil');
  // сравниваем длины
  result := (a.GetLength(0) = b.GetLength(0))
    and (a.GetLength(1) = b.GetLength(1));
  if result then
    for var i := 0 to a.GetLength(0) - 1 do
      for var j := 0 to a.GetLength(1) - 1 do
        if a[i, j] <> b[i, j] then
        begin
          result := false;
          break;
        end;
end;

/// Проверяет массивы a, b на равенство и возвращает
/// истину, если они равны
function ArrsAreEqual<T>(a, b: array of T): boolean;    
begin
  Assert(a <> nil, 'a is nil');
  Assert(b <> nil, 'b is nil');
  result := a.Length = b.Length;
  if result then
  begin
    var i := 0;
    while (i < a.Length) and (a[i] = b[i]) do
      i += 1;
    if i < a.Length then
      Result := false;
  end;
end;

function AreEqual(a: real; b: real; eps: real := REAL_EPSILON): boolean;
begin
  Result := Abs(a - b) < eps;
end;


// ------------------------------ Тесты подпрограмм из заданий

// Тестирует функцию создания матрицы из одинаковых элементов
procedure TestMakeRepMatrix;
begin
  var m: IntMatrix;
  var v := 5;
  
  // test matrix 0x0
  m := new integer[0, 0];
  Assert(MatricesAreEqual(MakeRepMatrix(0, 0, v), m), 'rep matrix: [[]]');
  
  // test matrix 1x1
  m := MakeMatrix(1, 1, v);
  Assert(MatricesAreEqual(MakeRepMatrix(1, 1, v), m), 'rep matrix: [[v]]');
  
  // test matrix 1x5
  m := MakeMatrix(1, 5, 
    v, v, v, v, v);
  Assert(MatricesAreEqual(MakeRepMatrix(1, 5, v), m), 
    'rep matrix: [[V, V, V, V, V]]');
  
  // test matrix 3x3
  m := MakeMatrix(3, 3, 
    v, v, v,
    v, v, v,
    v, v, v);
  Assert(MatricesAreEqual(MakeRepMatrix(3, 3, v), m), 
         'rep matrix: [[V, V, V], [V, V, V], [V, V, V]]');
         
  PrintTestsSuccess('TestMakeRepMatrix');
end;

// Тестирует функцию подсчёта суммы элементов главной диагонали
procedure TestMainDiagonalSum;
begin
  var m: RealMatrix;
  
  // test matrix 0x0
  m := new real[0, 0];
  Assert(AreEqual(MainDiagonalSum(m), 0.0), 'main-diag sum: [[]] >>> 0');
  
  var x: real;
  
  // test matrix 1x1
  x := 7.68;
  m := MakeMatrix(1, 1, x);
  Assert(AreEqual(MainDiagonalSum(m), x),   'main-diag sum: [[7.68]] >>> 7.68');
  
  // test matrix 1x1
  x := -1.1;
  m := MakeMatrix(1, 1, x);
  Assert(AreEqual(MainDiagonalSum(m), x),   'main-diag sum: [[-1.1]] >>> -1.1');
  
  // test matrix 2x2
  m := MakeMatrix(2, 2, 
    3.0,  4.5,
    1.0, -3.0);
  Assert(AreEqual(MainDiagonalSum(m), 0.0),   
    'main-diag sum: [[3.0,  4.5], [1.0, -3.0] >>> 0');
    
  // test matrix 2x2
  m := MakeMatrix(2, 2, 
     1.0, 4.5,
    -1.0, 2.0);
  Assert(AreEqual(MainDiagonalSum(m), 4.0),   
    'main-diag sum: [[1.0,  4.5], [-1.0, 2.0] >>> 4.0 [incorrect test]');
  
  // test matrix 3x3
  x := -12.0;
  m := MakeMatrix(3, 3,
    x, x, x,
    x, x, x,
    x, x, x);
  Assert(AreEqual(MainDiagonalSum(m), -36.0),   
    'main-diag sum: [[-12, -12, -12], [-12, -12, -12], [-12, -12, -12]] >>> -36');
    
  // test matrix 3x3
  x := 0.5;
  m := MakeMatrix(3, 3,
    x, x, x,
    x, x, x,
    x, x, x);
  Assert(AreEqual(MainDiagonalSum(m), 1.5),   
    'main-diag sum: [[0.5, 0.5, 0.5], [0.5, 0.5, 0.5], [0.5, 0.5, 0.5]] >>> 1.5');
         
  PrintTestsSuccess('TestMainDiagonalSum');
end;

// Тестирует процедуру перемены местами верхней и нижней половин матрицы
procedure TestSwapTopBottomHalfs;
begin
  var m, mres: IntMatrix;
  var a := MakeArr(-1, -5, 2, 0, -3);
  
  // test matrix 0x0
  m := new integer[0, 0];
  mres := new integer[0, 0];
  SwapTopBottomHalfs(m);
  Assert(MatricesAreEqual(m, mres), 'swap halfs: [[]] >>> [[]]');
  
  // test matrix 2x1
  m := MakeMatrix(2, 1, 
    a[0],
    a[0]);
  mres := CopyMatrix(m);
  SwapTopBottomHalfs(m);
  Assert(MatricesAreEqual(m, mres), 
    'swap halfs: [[a0], [a0]] >>> [[a0], [a0]]');
  // test matrix 2x1
  m := MakeMatrix(2, 1, 
    a[0],
    a[1]);
  mres := MakeMatrix(2, 1, 
    a[1],
    a[0]);
  SwapTopBottomHalfs(m);
  Assert(MatricesAreEqual(m, mres), 
    'swap halfs: [[a0], [a1]] >>> [[a1], [a0]]');
    
  // test matrix 2x3
  m := MakeMatrix(2, 3, 
    a[0], a[1], a[2],
    a[4], a[2], a[3]);
  mres := MakeMatrix(2, 3, 
    a[4], a[2], a[3],
    a[0], a[1], a[2]);
  SwapTopBottomHalfs(m);
  Assert(MatricesAreEqual(m, mres), 
    'swap halfs: [[a0, a1, a2], [a4, a2, a3]] >>> [[a4, a2, a3], [a0, a1, a2]]');
  
  // test matrix 4x3
  m := MakeMatrix(4, 3, 
    a[0], a[1], a[2],
    a[1], a[1], a[1],
    a[4], a[2], a[3],
    a[3], a[2], a[1]);
  mres := MakeMatrix(4, 3, 
    a[4], a[2], a[3],
    a[3], a[2], a[1],
    a[0], a[1], a[2],
    a[1], a[1], a[1]);
  SwapTopBottomHalfs(m);
  Assert(MatricesAreEqual(m, mres), 
    'swap halfs: [[a0, a1, a2], [a1, a1, a1], [a4, a2, a3], [a3, a2, a1]] >>> '
    + '[[a4, a2, a3], [a3, a2, a1], [a0, a1, a2], [a1, a1, a1]]');
  
  PrintTestsSuccess('TestSwapTopBottomHalfs');
end;



begin
  //TestMakeRepMatrix;
  //TestMainDiagonalSum;
  //TestSwapTopBottomHalfs;
end.