/// <summary>
/// Модуль с сервисными функциями для использования в тестировании
/// </summary>
unit ArrsFunctions;

type
  /// Динамический массив целых чисел
  IntArr = array of integer;
  /// Динамический массив вещественных чисел
  RealArr = array of real;  

type                                    
  /// Предикат для целого числа
  IntPredicate = integer -> boolean;

/// Проверяет массивы a, b на равенство и возвращает
/// истину, если они равны
function IntArrsAreEqual(a, b: IntArr): boolean; 
begin
  Assert(a <> nil, 'IntArrsAreEqual: a <> nil');
  Assert(b <> nil, 'IntArrsAreEqual: b <> nil');
  // сравниваем длины
  result := a.Length = b.Length;
  if result then
  begin
    // здесь result is true
    var i := 0;
    while (i < a.Length) and (a[i] = b[i]) do
      i += 1;
    // если не дошли до конца, значит какие-то элементы не совпадают
    if i < a.Length then
      Result := false;
  end;
end;

// до занятия 16 можно не смотреть
// ------------------------------------- 

/// Проверяет массивы a, b на равенство и возвращает
/// истину, если они равны на участке фактической длины
function NotFullFilledArrsAreEqual<T>(a: array of T; na: integer; 
         b: array of T; nb: integer): boolean;
begin
  Assert(a <> nil, 'NotFullFilledArrsAreEqual<T>: a <> nil');
  Assert(b <> nil, 'NotFullFilledArrsAreEqual<T>: b <> nil');
  Assert((0 <= na) and (na <= a.Length), 
    'NotFullFilledArrsAreEqual<T>: incorrect actual length of a');
  Assert((0 <= nb) and (nb <= b.Length), 
    'NotFullFilledArrsAreEqual<T>: incorrect actual length of b');
  // сравниваем длины
  result := na = nb;
  if result then
  begin
    // здесь result is true, то есть длины массивов совпадают
    var i := 0;
    while (i < na) and (a[i] = b[i]) do
      i += 1;
    // если не дошли до конца, значит какие-то элементы не совпадают
    if i < na then
      Result := false;
  end;
end;

/// Проверяет массивы a, b на равенство и возвращает
/// истину, если они равны
function ArrsAreEqual<T>(a, b: array of T): boolean;
begin
  Assert(a <> nil, 'ArrsAreEqual<T>: a <> nil');
  Assert(b <> nil, 'ArrsAreEqual<T>: b <> nil');
  result := NotFullFilledArrsAreEqual(a, a.Length, b, b.Length);
end;


end.