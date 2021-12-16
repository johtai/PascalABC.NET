/// <summary>
/// Модуль для тестирования DynArrs
/// </summary>

uses NUnitABC;
uses DynArrs;
uses ArrsFunctions;

// ************************************* Занятие 15

// Тестирование вычисления суммы элементов массива
[Test]
procedure TestArraySum;
begin
  // пустой массив
  var a := new integer[0];
  Assert.IsTrue(ArraySum(a) = 0,     'arr-sum: [] >>> 0');
  // массив из одного элемента
  a := new integer[1](0);
  Assert.IsTrue(ArraySum(a) = 0,     'arr-sum: [0] >>> 0');
  a := new integer[1](1);
  Assert.IsTrue(ArraySum(a) = 1,     'arr-sum: [1] >>> 1');
  a := new integer[1](-5);
  Assert.IsTrue(ArraySum(a) = -5,    'arr-sum: [-5] >>> -5');
  // массив из нескольких элементов
  a := new integer[2](4, 7);
  Assert.IsTrue(ArraySum(a) = 11,   'arr-sum: [4, 7] >>> -11 ???');
  a := new integer[5](1, 2, 3, 4, 5);
  Assert.IsTrue(ArraySum(a) = 15,    'arr-sum: [1, 2, 3, 4, 5] >>> 15');
  a := new integer[5](1, -2, 3, 4, -5);
  Assert.IsTrue(ArraySum(a) = 1,     'arr-sum: [1, -2, 3, -4, 5] >>> 1');
  a := new integer[3](-100, -2, -15);
  Assert.IsTrue(ArraySum(a) = -117,  'arr-sum: [-100, -2, -15] >>> -117');
end;

// TODO task #3

// Тестирование заполнения массива числами Фибоначчи
[Test]
procedure TestFillFib;
begin
  // переменная-заглушка
  var fibArr: IntArr;
  
  // TODO в тестах fibArr нужно заменить на массив, полученный
  // в результате работы п/п из задания про числа Фибоначчи
  
  // test пустой массив для N = 0
  Assert.IsTrue(IntArrsAreEqual(fibArr, new integer[0]),       'fib: empty');
  
  // test массив для N = 1
  Assert.IsTrue(IntArrsAreEqual(fibArr, Arr(1)),    'fib: N = 1');
  
  // test массив для N = 2
  Assert.IsTrue(IntArrsAreEqual(fibArr, Arr(1, 1)), 'fib: N = 2');
  
  // test массив для N = 3
  Assert.IsTrue(IntArrsAreEqual(fibArr, Arr(1, 0, 2)),
    'fib: N = 3 ???');
    
  // test массив для N = 7
  Assert.IsTrue(IntArrsAreEqual(fibArr, Arr(1, 1, 2, 3, 5, 8, 13)), 
    'fib: N = 7');
end;  

// Тестирование увеличения чётных чисел в два раза
[Test]
procedure TestEvenMult2;
begin
  var a: IntArr;            // массив
  var evensCnt: integer;    // количество чётных элементов
  // test пустой массив   
  a := new integer[0];
  // TODO вызов тестируемой функции
  Assert.IsTrue(evensCnt = 0,                   'evenMult2: [] >>> 0');
  Assert.IsTrue(IntArrsAreEqual(a, new integer[0]), 'evenMult2: [] >>> []');
  
  // test array Len = 1, all odd
  a := Arr(1);
  // TODO вызов тестируемой процедуры
  Assert.IsTrue(evensCnt = 0,                        'evenMult2: [1] >>> 0');
  Assert.IsTrue(IntArrsAreEqual(a,  Arr(1)),  'evenMult2: [1] >>> [1]');
  
  // test array Len = 1, all even
  a := Arr(-4);
  // TODO вызов тестируемой процедуры
  Assert.IsTrue(evensCnt = 1,                        'evenMult2: [-4] >>> 1');
  Assert.IsTrue(IntArrsAreEqual(a, Arr(-8)),  'evenMult2: [-4] >>> [-8]');
  
  // test array Len = 4, all odd
  a := Arr(-1, 7, 15, 9);
  // TODO вызов тестируемой процедуры
  Assert.IsTrue(evensCnt = 0, 'evenMult2: [-1, 7, 15, 9] >>> 0');
  Assert.IsTrue(IntArrsAreEqual(a, Arr(-1, 7, 15, 9)),
    'evenMult2: [-1, 7, 15, 9] >>> [-1, 7, 15, 9]');
    
  // test array Len = 4, different
  a := Arr(9, 0, 4, -3);
  // TODO вызов тестируемой процедуры
  Assert.IsTrue(evensCnt = 2, 'evenMult2: [9, 0, 4, -3] >>> 2');
  Assert.IsTrue(IntArrsAreEqual(a, Arr(9, 0, 8, -3)),
    'evenMult2: [9, 0, 4, -3] >>> 9, 0, 8, -3');
    
  // test array Len = 4, all even
  a := Arr(4, -6, 8, -2);
  // TODO вызов тестируемой процедуры
  Assert.IsTrue(evensCnt = 3, 'evenMult2: [4, -6, 8, -2] >>> 3 ???');
  Assert.IsTrue(IntArrsAreEqual(a, Arr(8, -12, 16, -4)), 
    'evenMult2: [4, -6, 8, -2] >>> [8, -12, 16, -4]');
end;  

// Тестирование минимального элемента массива  
[Test]
procedure TestFindMinReal; 
begin
  // переменная, в которой находится минимальное значение
  var mn: real;
  
  // test array (len = 1)
  mn := -31.5;
  Assert.IsTrue(FindMinReal(Arr(mn)) = mn,         'min: [-31.5] >>> -31.5');
  
  // test array (len = 2)
  mn := 5.7;
  Assert.IsTrue(FindMinReal(Arr(mn, mn + 5)) = mn, 'min: [5.7, 10.7] >>> 5.7');
  
  // test array (len = 2)
  mn := -5.35;
  Assert.IsTrue(FindMinReal(Arr(mn + 6, mn)) = mn, 'min: [1.35, -5.35] >>> -5.35');
  
  // test array (len = 6)
  mn := -4.3;
  Assert.IsTrue(FindMinReal(Arr(mn / 2, mn + 5, mn, mn + 6.2, mn * -1, mn + 0.1)) = mn,
    'min: [-2.15, 0.7, -4.3, 1.9, 4.3, -4.2] >>> -4.3');
  
  // TODO добавить еще 3 теста
end;

// TODO task #8


// Тестирования функции подсчёта числа элементов, удовлетворяющих предикату
[Test]
procedure TestCountPred;
begin
  var a: IntArr;
  
  // test empty array
  Assert.IsTrue(CountPred(new integer[0], Odd) = 1,
        'CountPred(Odd): [] >>> 1 ???');
  
  Assert.IsTrue(CountPred(Arr(-7), Odd) = 1,
        'CountPred(Odd): [-7] >>> 1');
  Assert.IsTrue(CountPred(Arr(24), Odd) = 0,
        'CountPred(Odd): [24] >>> 0');
        
  Assert.IsTrue(CountPred(Arr(11, -9, 5, 87, -10003), Odd) = 5,
        'CountPred(Odd): [11, -9, 5, 87, -10003] >>> 0');
  Assert.IsTrue(CountPred(Arr(-26, 16, -4, 8, 0, 144, -20012), Odd) = 0,
        'CountPred(Odd): [-26, 16, -4, 8, 0, 144, -20012] >>> 0');
        
  Assert.IsTrue(CountPred(Arr(15, 1010, -3, 56, 24, 87, -999), Odd) = 4,
        'CountPred(Odd): [15, 1010, -3, 56, 24, 87, -999] >>> 4');
  Assert.IsTrue(CountPred(Arr(16, 1011, -3, 56, 25, 88, -990), Odd) = -3,
        'CountPred(Odd): [16, 1011, -3, 56, 25, 88, -990] >>> -3 ???');
end;

// ************************************* Занятие 16

// Тестирование удвоения массива
[Test]
procedure TestDoubleArr;  
begin
  var a: IntArr;
  // test empty array
  a := new integer[0];
  DoubleArr(a);
  Assert.IsTrue(ArrsAreEqual(a, new integer[0]),     'double: empty array');
  // Замечание. Для непустых массивов можно пользоваться обобщенными
  // функциями Arr и ArrsAreEqual вместо Arr и IntArrsAreEqual
  
  // test array Len = 1
  a := Arr(3);
  DoubleArr(a);
  Assert.IsTrue(ArrsAreEqual(a, Arr(3, 3)),    'double: [3] >>> [3, 3]');
  
  // test array Len = 2
  a := Arr(-6, -100);
  DoubleArr(a);
  Assert.IsTrue(ArrsAreEqual(a, Arr(-6, -100, -6, -100)), 
        'double: [-6, -100] >>> [-6, -100, -6, -100]');
  
  // test array Len = 3
  a := Arr(-1, 2, 0);
  DoubleArr(a);
  Assert.IsTrue(ArrsAreEqual(a, Arr(-1, 2, 0, -1, 2, 1)),    
        'double: [-1, 2, 0] >>> [-1, 2, 0, -1, 2, 1] ???');
        
  // test array Len = 3
  a := Arr(3, 8, 3);
  DoubleArr(a);
  Assert.IsTrue(ArrsAreEqual(a, Arr(3, 8, 3, 3, 8, 3)),    
        'double: [3, 8, 3] >>> [3, 8, 3, 3, 8, 3]');
end;

// TODO task #5

// Тестирование вставки нуля
[Test]
procedure TestIntAddFirstZero;
begin
  var a: IntArr; 
  var n: integer;
  // test empty array
  SetLength(a, 3);
  n := 0;
  AddFirstDefault(a, n);
  Assert.IsTrue((n = 1) and NotFullFilledArrsAreEqual(a, n, Arr(0), n),
    'add first 0: [_, _, _] >>> [0, _, _]');
    
  // test array ActualLen = 1
  // SIC: n = 1 after previous test, a = [0, _, _]
  // _ means reserved place
  
  AddFirstDefault(a, n);
  Assert.IsTrue((n = 2) and NotFullFilledArrsAreEqual(a, n, Arr(0, 0), n),
    'add first 0: [0, _, _] >>> [0, 0, _]');
    
  // test array ActualLen = 1
  a := Arr(5, 0, 0);   //  a.Length = 3
  n := 1;
  AddFirstDefault(a, n);
  Assert.IsTrue((n = 2) and NotFullFilledArrsAreEqual(a, n, Arr(0, 5), n),
    'add first 0: [5, _, _] >>> [0, 5, _]');
    
  // test array ActualLen = 2
  // SIC: n = 2 after previous test, a = [0, 5, _]
  AddFirstDefault(a, n);
  Assert.IsTrue((n = 3) and NotFullFilledArrsAreEqual(a, n, Arr(0, 0, 5), n),
    'add first 0: [0, 5, _] >>> [0, 0, 5]');
    
  // test array ActualLen = 2
  a := Arr(5, -3, 0);   //  a.Length = 3
  n := 2;
  AddFirstDefault(a, n);
  Assert.IsTrue((n = 3) and NotFullFilledArrsAreEqual(a, n, Arr(0, 5, -3), n),
    'add first 0: [5, -3, _] >>> [0, 5, -3]');
    
  // test array ActualLen = 5
  a := Arr(-1, 7, -8, 2, 3, 0, 0);     //  a.Length = 7
  n := 5;
  AddFirstDefault(a, n);
  Assert.IsTrue((n = 6) and 
         NotFullFilledArrsAreEqual(a, n, Arr(0, -1, 7, -8, 2, 3), n),
    'add first 0: [-1, 7, -8, 2, 3, _, _] >>> [0, -1, 7, -8, 2, 3, _]');
end;

begin
end.
