/// <summary>
/// Модуль с тестами для подпрограмм модуля DynArrsInHO
/// </summary>

uses NUnitABC;
uses HigherOrderFuncs;

// ------------------------------ Подпрограммы из заданий

// ----------------- #1

// Вспомогательные подпрограммы для тестирования

/// Тождественная функция
function Ident(x: integer): integer;
begin
  Result := x;
end;

[Test]
procedure TestIdent;
begin
  Assert.AreEqual(Ident(0), 0, 'Ident: 0 >>> 0');
  Assert.AreEqual(Ident(1), 1, 'Ident: 1 >>> 1');
  Assert.AreEqual(Ident(2), 2, 'Ident: 2 >>> 2');
  Assert.AreEqual(Ident(46), 46, 'Ident: 46 >>> 46');
  Assert.AreEqual(Ident(-1), -1, 'Ident: -1 >>> -1');
  Assert.AreEqual(Ident(-2), -2, 'Ident: -2 >>> -2');
  Assert.AreEqual(Ident(-37), -37, 'Ident: -37 >>> -37');
end;

/// Добавляет единицу к x и возвращает новое значение. Если x -- это
/// максимальное значение, возвращает его же
function IncBy1(x: integer): integer;
begin
  if x < integer.MaxValue then
    Result := x + 1
  else
    Result := x;
end;

[Test]
procedure TestIncBy1;
begin
  Assert.AreEqual(IncBy1(integer.MinValue), integer.MinValue + 1,
    'Ident: MinVal >>> MinVal + 1');
  Assert.AreEqual(IncBy1(-28), -27, 'IncBy1: -28 >>> -27');
  Assert.AreEqual(IncBy1(-1), 0, 'IncBy1: -1 >>> 0');
  Assert.AreEqual(IncBy1(0), 1, 'IncBy1: 0 >>> 1');
  Assert.AreEqual(IncBy1(3), 4, 'IncBy1: 3 >>> 4');
  Assert.AreEqual(IncBy1(78), 79, 'IncBy1: 78 >>> 79');
  Assert.AreEqual(IncBy1(integer.MaxValue - 1), integer.MaxValue,
    'IncBy1: MaxVal - 1 >>> Maxval');
  Assert.AreEqual(IncBy1(integer.MaxValue), integer.MaxValue,
    'IncBy1: MaxVal >>> MaxVal');
end;

[Test]
procedure TestIntMap;
begin
  var empty: IntArr := EmptyIntArr();
  // в тестах будем использовать переменные, чтобы запись теста
  // не была слишком громоздкой
  var source, dest: IntArr;
  
  // Тесты с тождественной функцией
  Assert.AreEqual(IntMap(empty, Ident), empty,
         'IntMap(Ident): [] >>> []');
  source := Arr(6);
  dest := Arr(6);
  Assert.AreEqual(IntMap(source, Ident), dest,
         'IntMap(Ident): [6] >>> [6]');
  source := Arr(-9, 11, 46, 0, -12, 8);
  dest := Arr(-9, 11, 46, 0, -12, 8);
  Assert.AreEqual(IntMap(source, Ident), dest,
         'IntMap(Ident): [-9, 11, 46, 0, -12, 8] >>> [-9, 11, 46, 0, -12, 8]');
         
  // Тесты с функцией инкремента
  Assert.AreEqual(IntMap(empty, IncBy1), empty,
         'IntMap(IncBy1): [] >>> []');
  source := Arr(3);
  dest := Arr(4);
  Assert.AreEqual(IntMap(source, IncBy1), dest,
         'IntMap(IncBy1): [3] >>> [4]');
  source := Arr(-9, 11, 46, 0, -12, 8);
  dest := Arr(-8, 12, 47, 1, -11, 9);
  Assert.AreEqual(IntMap(source, IncBy1), dest,
         'IntMap(Ident): [-9, 11, 46, 0, -12, 8] >>> [-8, 12, 47, 1, -11, 9]');
end;

[Test]
procedure TestDoubleVal;
begin
  Assert.AreEqual(DoubleVal(0), 0,      'DoubleVal: 0 >>> 0');
  Assert.AreEqual(DoubleVal(1), 2,      'DoubleVal: 1 >>> 2');
  Assert.AreEqual(DoubleVal(-1), -2,    'DoubleVal: -1 >>> -2');
  Assert.AreEqual(DoubleVal(5), 10,     'DoubleVal: 5 >>> 11 !incorrect test!');
  Assert.AreEqual(DoubleVal(16), 32,    'DoubleVal: 16 >>> 32');
  Assert.AreEqual(DoubleVal(-37), -74,  'DoubleVal: -37 >>> -74');
end;

[Test]
procedure TestMaxSqrDivisor;
begin
  Assert.AreEqual(MaxSqrDivisor(1), 1,    'MaxSqrDivisor: 1 >>> 1');
  Assert.AreEqual(MaxSqrDivisor(2), 1,    'MaxSqrDivisor: 2 >>> 1');
  Assert.AreEqual(MaxSqrDivisor(3), 1,    'MaxSqrDivisor: 3 >>> 1');
  Assert.AreEqual(MaxSqrDivisor(4), 2,    'MaxSqrDivisor: 4 >>> 2');
  Assert.AreEqual(MaxSqrDivisor(5), 1,    'MaxSqrDivisor: 5 >>> 1');
  Assert.AreEqual(MaxSqrDivisor(8), 2,    'MaxSqrDivisor: 8 >>> 2');
  Assert.AreEqual(MaxSqrDivisor(9), 3,    'MaxSqrDivisor: 9 >>> 3');
  Assert.AreEqual(MaxSqrDivisor(10), 1,   'MaxSqrDivisor: 10 >>> 1');
  Assert.AreEqual(MaxSqrDivisor(12), 2,   'MaxSqrDivisor: 12 >>> 2');
  Assert.AreEqual(MaxSqrDivisor(15), 1,   'MaxSqrDivisor: 15 >>> 1');
  Assert.AreEqual(MaxSqrDivisor(16), 4,   'MaxSqrDivisor: 16 >>> 4');
  Assert.AreEqual(MaxSqrDivisor(17), 1,   'MaxSqrDivisor: 17 >>> 1');
  Assert.AreEqual(MaxSqrDivisor(24), 2,   'MaxSqrDivisor: 24 >>> 2');
  Assert.AreEqual(MaxSqrDivisor(25), 5,   'MaxSqrDivisor: 25 >>> 5');
  Assert.AreEqual(MaxSqrDivisor(26), 1,   'MaxSqrDivisor: 26 >>> 1');
  Assert.AreEqual(MaxSqrDivisor(48), 4,   'MaxSqrDivisor: 48 >>> 4');
  Assert.AreEqual(MaxSqrDivisor(50), 5,   'MaxSqrDivisor: 50 >>> 5');
  Assert.AreEqual(MaxSqrDivisor(80), 4,   'MaxSqrDivisor: 80 >>> 4');
  Assert.AreEqual(MaxSqrDivisor(81), 9,   'MaxSqrDivisor: 81 >>> 9');
  Assert.AreEqual(MaxSqrDivisor(288), 12, 'MaxSqrDivisor: 288 >>> 12');
  Assert.AreEqual(MaxSqrDivisor(-1), 1,   'MaxSqrDivisor: -1 >>> 1');
  Assert.AreEqual(MaxSqrDivisor(-2), 1,   'MaxSqrDivisor: -2 >>> 1');
  Assert.AreEqual(MaxSqrDivisor(-3), 1,   'MaxSqrDivisor: -3 >>> 1');
  Assert.AreEqual(MaxSqrDivisor(-4), 2,   'MaxSqrDivisor: -4 >>> 2');
  Assert.AreEqual(MaxSqrDivisor(-50), 5,  'MaxSqrDivisor: -50 >>> 5');
  Assert.AreEqual(MaxSqrDivisor(-80), 4,  'MaxSqrDivisor: -80 >>> 4');
  Assert.AreEqual(MaxSqrDivisor(-81), 9,  'MaxSqrDivisor: -81 >>> 9');
end;

// ----------------- #2

[Test]
procedure TestIntFilter;
begin
  var empty: IntArr := EmptyIntArr();
  // в тестах будем использовать переменные, чтобы запись теста
  // не была слишком громоздкой
  var source, dest: IntArr;
  // В тестах используем предикат Odd
  Assert.AreEqual(IntFilter(empty, Odd), empty,
         'IntFilter(Odd): [] >>> []');
  source := Arr(6);
  Assert.AreEqual(IntFilter(source, Odd), empty,
         'IntFilter(Odd): [6] >>> []');
  source  := Arr(-3);
  dest    := Arr(-3);
  Assert.AreEqual(IntFilter(source, Odd), dest,
         'IntFilter(Odd): [-3] >>> [-3]');
  source  := Arr(-9, 11, 46, 0, -12, 8, 45);
  dest    := Arr(-9, 45, 11);
  Assert.AreEqual(IntFilter(source, Odd), dest,
         'IntFilter(Odd): [-9, 11, 46, 0, -12, 8, 45] >>> [-9, 45, 11] !incorrect test!');
  source  := Arr(-9, 11, -113, 7, -29, 5, 453, 81);
  dest    := Arr(-9, 11, -113, 7, -29, 5, 453, 81);
  Assert.AreEqual(IntFilter(source, Odd), dest,
         'IntFilter(Odd): [-9, 11, -113, 7, -29, 5, 453, 81] >>> [-9, 11, -113, 7, -29, 5, 453, 81]');
  source  := Arr(4, -12, 0, 46, -118);
  Assert.AreEqual(IntFilter(source, Odd), empty,
         'IntFilter(Odd): [4, -12, 0, 46, -118] >>> []');
end;

[TestCase(integer.MinValue, ExpectedResult = false)]
[TestCase(-1, ExpectedResult = false)]
[TestCase(0, ExpectedResult = false)]
[TestCase(1, ExpectedResult = true)]
[TestCase(36, ExpectedResult = true)]
[TestCase(integer.MaxValue, ExpectedResult = true)]
function TestIsPositive(number: integer): boolean;
begin
  Result := IsPositive(number);
end;

[TestCase(-31, 5, ExpectedResult = false)]
[TestCase(-4, 5, ExpectedResult = false)]
[TestCase(2, 5, ExpectedResult = false)]
[TestCase(46, 5, ExpectedResult = false)]
[TestCase(-30, 5, ExpectedResult = true)]
[TestCase(0, 5, ExpectedResult = true)]
[TestCase(5, 5, ExpectedResult = true)]
[TestCase(105, 5, ExpectedResult = true)]
[TestCase(-7, -12, ExpectedResult = false)]
[TestCase(-140, -12, ExpectedResult = false)]
[TestCase(2, -12, ExpectedResult = false)]
[TestCase(46, -12, ExpectedResult = false)]
[TestCase(-12, -12, ExpectedResult = true)]
[TestCase(0, -12, ExpectedResult = true)]
[TestCase(48, -12, ExpectedResult = true)]
[TestCase(144, -12, ExpectedResult = true)]
function TestIsDivisible(number, divisor: integer): boolean;
begin
  SetDivisor(divisor);
  Result := IsDivisible(number);
end;

// ----------------- #3

[Test]
procedure TestFilter;
begin
  // будем проверять на тех же тестах, что и IntFilter
  var empty: IntArr := EmptyIntArr();     // пустой массив
  var source, dest: IntArr;
  
  Assert.AreEqual(Filter&<integer>(empty, Odd), empty,
         'Filter<int>(Odd): [] >>> []');
  source := Arr(6);
  Assert.AreEqual(Filter&<integer>(source, Odd), empty,
         'Filter<int>(Odd): [6] >>> []');
  source  := Arr(-3);
  dest    := Arr(-3);
  Assert.AreEqual(Filter&<integer>(source, Odd), dest,
         'Filter<int>(Odd): [-3] >>> [-3]');
  source  := Arr(-9, 11, 46, 0, -12, 8, 45);
  dest    := Arr(-9, 11, 45);
  
  Assert.AreEqual(Filter&<integer>(source, Odd), dest,
         'Filter<int>(Odd): [-9, 11, 46, 0, -12, 8, 45] >>> [-9, 11, 45]');
  source  := Arr(-9, 11, -113, 7, -29, 5, 453, 81);
  dest    := Arr(-9, 11, -113, 7, -29, 5, 453, 81);
  Assert.AreEqual(Filter&<integer>(source, Odd), dest,
         'Filter<int>(Odd): [-9, 11, -113, 7, -29, 5, 453, 81] >>> [-9, 11, -113, 7, -29, 5, 453, 81]');
  source  := Arr(4, -12, 0, 46, -118);
  Assert.AreEqual(Filter&<integer>(source, Odd), empty,
         'Filter<int>(Odd): [4, -12, 0, 46, -118] >>> []');
end;

[TestCase(-368.00000000001, ExpectedResult = false)]
[TestCase(-4.9999999999, ExpectedResult = false)]
[TestCase(0, ExpectedResult = false)]
[TestCase(102, ExpectedResult = false)]
[TestCase(74.375, ExpectedResult = false)]
[TestCase(-25.00000000001, ExpectedResult = true)]
[TestCase(-1.9999999999, ExpectedResult = true)]
[TestCase(15, ExpectedResult = true)]
[TestCase(481.966, ExpectedResult = true)]
function TestIntPartOdd(number: real): boolean;
begin
  Result := IntPartOdd(number);
end;

// ----------------- #4

[Test]
procedure TestIntZipWith;
begin
  var empty: IntArr := EmptyIntArr();
  var a, b: IntArr;
  a := EmptyIntArr();
  b := EmptyIntArr();
  
  Assert.AreEqual(IntZipWith(a, b, max), empty,
         'IntZipWith(max): [], [] >>> []');
  a := Arr(-1);
  b := Arr(167);
  Assert.AreEqual(IntZipWith(a, b, max), Arr(167),
         'IntZipWith(max): [-1], [167] >>> [167]');
  a := Arr(8, 0, -13);
  b := Arr(8, 0, -13);
  Assert.AreEqual(IntZipWith(a, b, max), Arr(8, 0, -13),
         'IntZipWith(max): [8, 0, -13], [8, 0, -13] >>> [8, 0, -13]');
  a := Arr(196,  23, -15, 78);
  b := Arr(-167, 23, -304, 5);
  Assert.AreEqual(IntZipWith(a, b, max), Arr(196, 23, -15, 78),
         'IntZipWith(max): [196, 23, -15, 78], [-167, 23, -304, 5] >>> [196, 23, -15, 78]');
  a := Arr(81, 0,  23, -100, 468, -12, 11);
  b := Arr(82, -4, 15, -10,  34,  789, 10);
  Assert.AreEqual(IntZipWith(a, b, max), Arr(82, 0, 23, -10, 468, 789, 11),
         'IntZipWith(max): [81, 0, 23, -100, 468, -12, 11], [82, -4, 15, -10, 34, 789, 10] >>> [82, 0, 23, -10, 468, 789, 11]');
  a := Arr(13, -10, 0);
  b := Arr(0,  5, 89);
  Assert.AreEqual(IntZipWith(a, b, max), Arr(13, 5, 89),
         'IntZipWith(max): [13, -10, 0], [-18, 5, 89] >>> [13, 5, 0] !incorrect test!');
end;

[Test]
procedure TestSum;
begin
  Assert.AreEqual(Sum(0, 0), 0,           'Sum(0, 0) >>> 0');
  Assert.AreEqual(Sum(0, 16), 16,         'Sum(0, 16) >>> 16');
  Assert.AreEqual(Sum(-13, 0), -13,       'Sum(-13, 0) >>> -13');
  Assert.AreEqual(Sum(3, 15), 18,         'Sum(3, 15) >>> 18');
  Assert.AreEqual(Sum(19, 3), 22,         'Sum(19, 3) >>> 22');
  Assert.AreEqual(Sum(-1, -14), -15,      'Sum(-1, -14) >>> -15');
  Assert.AreEqual(Sum(6, -3), 3,          'Sum(6, -3) >>> 3');
end;

// ----------------- #5

/// Функция свёртки для числа элемента
function CountFolder(acc: integer; x: integer): integer;
begin
  Result := acc + 1;
end;
//
[Test]
procedure TestIntFoldLeft;
begin
  // Будем использовать свертку для подсчёта числа элементов
  // 1) Сначала нужно проверить, что правильно учитывается аккумулятор. Это
  //    можно сделать на пустом массиве.
  // 2) Дальше нужно проверить свёртку на нескольких массивах
  Assert.AreEqual(IntFoldLeft(EmptyIntArr(), CountFolder, 5), 5,
         'IntFoldLeft(CountFolder): [], 5 >>> 5');
  Assert.AreEqual(IntFoldLeft(EmptyIntArr(), CountFolder, 0), 0,
         'IntFoldLeft(CountFolder): [], 0 >>> 0');
  // для подсчёта числа элементов не важно содержимое массива, поэтому
  // можно использовать случайный массив
  Assert.AreEqual(IntFoldLeft(ArrRandomInteger(1), CountFolder, 0), 1,
         'IntFoldLeft(CountFolder): [a1], 0 >>> 1');
  // чтобы убедиться, вызовем несколько раз
  Assert.AreEqual(IntFoldLeft(ArrRandomInteger(1), CountFolder, 0), 1,
         'IntFoldLeft(CountFolder): [a1], 0 >>> 1');
  Assert.AreEqual(IntFoldLeft(ArrRandomInteger(1), CountFolder, -2), -1,
         'IntFoldLeft(CountFolder): [a1], -2 >>> -1');
  Assert.AreEqual(IntFoldLeft(ArrRandomInteger(5), CountFolder, 0), 5,
         'IntFoldLeft(CountFolder): [a1, ..., a5], 0 >>> 5');
  Assert.AreEqual(IntFoldLeft(ArrRandomInteger(5), CountFolder, 0), 5,
         'IntFoldLeft(CountFolder): [a1, ..., a5], 0 >>> 5');
  Assert.AreEqual(IntFoldLeft(ArrRandomInteger(5), CountFolder, 3), 8,
         'IntFoldLeft(CountFolder): [a1, ..., a5], 3 >>> 8');
  Assert.AreEqual(IntFoldLeft(ArrRandomInteger(5), CountFolder, -5), 0,
         'IntFoldLeft(CountFolder): [a1, ..., a5], -5 >>> 0');
end;

[Test]
procedure TestEvenSumFolder;
begin
  Assert.AreEqual(IntFoldLeft(EmptyIntArr(), EvenSumFolder, 0), 0,
         'IntFoldLeft(EvenSumFolder): [], 0 >>> 0');
  Assert.AreEqual(IntFoldLeft(Arr(4), EvenSumFolder, 0), 4,
         'IntFoldLeft(EvenSumFolder): [4], 0 >>> 4');
  Assert.AreEqual(IntFoldLeft(Arr(-3), EvenSumFolder, 0), 0,
         'IntFoldLeft(EvenSumFolder): [-3], 0 >>> 0');
  Assert.AreEqual(IntFoldLeft(Arr(0), EvenSumFolder, 0), 0,
         'IntFoldLeft(EvenSumFolder): [0], 0 >>> 0');
  Assert.AreEqual(IntFoldLeft(Arr(-2, -18, -6), EvenSumFolder, 0), -26,
         'IntFoldLeft(EvenSumFolder): [-2, -18, -6], 0 >>> -26');
  Assert.AreEqual(IntFoldLeft(Arr(1, 7, -3, 19, -45), EvenSumFolder, 0), 7,
         'IntFoldLeft(EvenSumFolder): [1, 7, -3, 19, -45], 0 >>> 7 !incorrect test!');
  Assert.AreEqual(IntFoldLeft(Arr(-4, 18, 5, -33, 6), EvenSumFolder, 0), 20,
         'IntFoldLeft(EvenSumFolder): [-4, 18, 5, -33, 6], 0 >>> 20');
  Assert.AreEqual(IntFoldLeft(Arr(2, 0, 4), EvenSumFolder, 0), 6,
         'IntFoldLeft(EvenSumFolder): [2, 0, 4], 0 >>> 6');
end;

[Test]
procedure TestMaxFolder;
begin
  Assert.AreEqual(IntFoldLeft(EmptyIntArr(), MaxFolder, integer.MinValue), integer.MinValue,
         'IntFoldLeft(MaxFolder): [], MinVal >>> MinVal');
  Assert.AreEqual(IntFoldLeft(Arr(integer.MinValue), MaxFolder, integer.MinValue), integer.MinValue,
         'IntFoldLeft(MaxFolder): [MinVal], MinVal >>> MinVal');
  Assert.AreEqual(IntFoldLeft(Arr(-3), MaxFolder, integer.MinValue), -3,
         'IntFoldLeft(MaxFolder): [-3], MinVal >>> -3');
  Assert.AreEqual(IntFoldLeft(Arr(0), MaxFolder, integer.MinValue), 0,
         'IntFoldLeft(MaxFolder): [0], Minval >>> 0');
  Assert.AreEqual(IntFoldLeft(Arr(-2, 1, 231, -100, 231), MaxFolder, integer.MinValue), 231,
         'IntFoldLeft(MaxFolder): [-2, 1, 231, -100, 231], MinVal >>> 231');
  Assert.AreEqual(IntFoldLeft(Arr(18, -7, -3, 8, 0), MaxFolder, integer.MinValue), 18,
         'IntFoldLeft(EvenSumFolder): [18, -7, -3, 8, 0], MinVal >>> 18');
  Assert.AreEqual(IntFoldLeft(Arr(18, -7, 3, 67, -8, 0), MaxFolder, integer.MinValue), 65,
         'IntFoldLeft(EvenSumFolder): [18, -7, 3, 67, -8, 0], MinVal >>> 65 !incorrect test!');
  Assert.AreEqual(IntFoldLeft(Arr(-17, 0, integer.MaxValue, 11), MaxFolder, integer.MinValue), integer.MaxValue,
         'IntFoldLeft(EvenSumFolder): [-17, 0, MaxVal, 11], MinVal >>> MaxVal');
end;

// ----------------- #extra-2

[Test]
procedure TestFoldLeft;
begin
  // Тесты те же, что для IntFoldLeft
  // Будем использовать свертку для подсчёта числа элементов
  // 1) Сначала нужно проверить, что правильно учитывается аккумулятор. Это
  //    можно сделать на пустом массиве.
  // 2) Дальше нужно проверить свёртку на нескольких массивах
  Assert.AreEqual(FoldLeft&<integer, integer>(EmptyIntArr(), CountFolder, 5), 5,
         'FoldLeft<int, int>(CountFolder): [], 5 >>> 5');
  Assert.AreEqual(FoldLeft&<integer, integer>(EmptyIntArr(), CountFolder, 0), 0,
         'FoldLeft<int, int>(CountFolder): [], 0 >>> 0');
  // для подсчёта числа элементов не важно содержимое массива, поэтому
  // можно использовать случайный массив
  Assert.AreEqual(FoldLeft&<integer, integer>(ArrRandomInteger(1), CountFolder, 0), 1,
         'FoldLeft<int, int>(CountFolder): [a1], 0 >>> 1');
  // чтобы убедиться, вызовем несколько раз
  Assert.AreEqual(FoldLeft&<integer, integer>(ArrRandomInteger(1), CountFolder, 0), 1,
         'FoldLeft<int, int>(CountFolder): [a1], 0 >>> 1');
  Assert.AreEqual(FoldLeft&<integer, integer>(ArrRandomInteger(1), CountFolder, -2), -1,
         'FoldLeft<int, int>(CountFolder): [a1], -2 >>> -1');
  Assert.AreEqual(FoldLeft&<integer, integer>(ArrRandomInteger(5), CountFolder, 0), 5,
         'FoldLeft<int, int>(CountFolder): [a1, ..., a5], 0 >>> 5');
  Assert.AreEqual(FoldLeft&<integer, integer>(ArrRandomInteger(5), CountFolder, 0), 5,
         'FoldLeft<int, int>(CountFolder): [a1, ..., a5], 0 >>> 5');
  Assert.AreEqual(FoldLeft&<integer, integer>(ArrRandomInteger(5), CountFolder, 3), 8,
         'FoldLeft<int, int>(CountFolder): [a1, ..., a5], 3 >>> 8');
  Assert.AreEqual(FoldLeft&<integer, integer>(ArrRandomInteger(5), CountFolder, -5), 0,
         'FoldLeft<int, int>(CountFolder): [a1, ..., a5], -5 >>> 0');
end;

[Test]
procedure TestHasPositiveFolder;
begin
  // TODO: реализация
end;


begin
end.
