/// <summary>
/// ������ ����������� ��� ������� ������ � ������������� ���������
/// </summary>
unit DynArrs;

// ============================================== ������ ����������
interface

type
  /// ������������ ������ ����� �����
  IntArr = array of integer;
  /// ������������ ������ ������������ �����
  RealArr = array of real;

// ------------------------------ ������ �������

/// <summary>
/// ��������� n ����� ����� � ��������� ������, ��������� �� ���� ��������
/// </summary>
/// <param name="n">����� ��������� -- ����� ������� (>= 0)</param>
/// <returns>������ �� ��������� �����</returns>
function ReadIntArr(n: integer): IntArr;

/// <summary>
/// ��������� n ������������ ����� � ��������� ������, ��������� �� ���� ��������
/// </summary>
/// <param name="n">����� ��������� -- ����� ������� (>= 0)</param>
/// <returns>������ �� ��������� �����</returns>
function ReadRealArr(n: integer): RealArr;

// ------------------------------ ��������������� �������

/// <summary>
/// ������������ � ���������� ������, ���������
/// �� ���������� �������
/// </summary>
/// <param name="args">���������-�������� �������</param>
/// <returns>������</returns>
function MakeArr<T>(params args: array of T): array of T;

/// <summary>
/// ������������ � ���������� ������������� ������, ���������
/// �� ���������� �������-����� �����
/// </summary>
/// <param name="args">���������-�������� �������</param>
/// <returns>������</returns>
function MakeIntArr(params args: IntArr): IntArr;  

/// <summary>
/// ������������ � ���������� ������������� ������ ������� n, ���������� ��
/// ��������� ������� � ��������� [a, b]
/// </summary>
/// <param name="n">������ ������� (>= 0)</param>
/// <param name="a">������ ������� ��������� ��������</param>
/// <param name="b">������� ������� ��������� ��������</param>
/// <returns>������ ����� �����</returns>
function MakeRandomIntArr(n: integer; 
  a: integer := -100; b: integer := 100): IntArr;
  
/// <summary>
/// ������������ � ���������� ������������ ������ ������� n, ���������� ��
/// ��������� ������� � ��������� [a, b)
/// </summary>
/// <param name="n">������ ������� (>= 0)</param>
/// <param name="a">������ ������� ��������� ��������</param>
/// <param name="b">������� ������� ��������� ��������</param>
/// <returns>������ ������������ �����</returns>
function MakeRandomRealArr(n: integer; 
  a: real := -100; b: real := 100): RealArr;

// ------------------------------ ������ �������

/// <summary>
/// ������� �� ������� ���������� ������� a, �������� �������� 
/// ������� delim
/// </summary>
/// <param name="a">������</param>
/// <param name="delim">������-�����������</param>
procedure PrintArr<T>(a: array of T; delim: string := '; ');
/// <summary>
/// ������� �� ������� ���������� ������� a, �������� �������� 
/// ������� delim, � ��������� �� ����� ������
/// </summary>
/// <param name="a">������</param>
/// <param name="delim">������-�����������</param>
procedure PrintlnArr<T>(a: array of T; delim: string := '; ');


// ============================================== ������ ����������
implementation

// ------------------------------ ������ �������

// ��������� n ����� ����� � ��������� ������, ��������� �� ���� ��������
function ReadIntArr(n: integer): IntArr;
begin
  Assert(n >= 0, 'ReadIntArr: n >= 0');
  Result := new integer[n];
  for var i := 0 to Result.Length - 1 do
    Result[i] := ReadInteger;
end;

// ��������� n ������������ ����� � ��������� ������, ��������� �� ���� ��������
function ReadRealArr(n: integer): RealArr;
begin
  Assert(n >= 0, 'ReadRealArr: n >= 0');
  Result := new real[n];
  for var i := 0 to Result.Length - 1 do
    Result[i] := ReadReal;
end;

// ------------------------------ ��������������� �������

// ������������ � ���������� ������, ���������
// �� ���������� �������
function MakeArr<T>(params args: array of T): array of T; 
begin
  Result := new T[args.Length];
  for var i := 0 to args.Length - 1 do
    Result[i] := args[i];
end;

// ������������ � ���������� ������������� ������, ���������
// �� ���������� �������-����� �����
function MakeIntArr(params args: IntArr): IntArr; 
begin
  Result := new integer[args.Length];
  for var i := 0 to args.Length - 1 do
    Result[i] := args[i];
end; 

// ������������ � ���������� ������������� ������ ������� n, ���������� ��
// ��������� ������� � ��������� [a, b]
function MakeRandomIntArr(n: integer; a: integer; b: integer): IntArr;
begin
  Assert(n >= 0, 'MakeRandomIntArr: n >= 0');
  Assert(a <= b, 'MakeRandomIntArr: a <= b');
  Result := new integer[n];
  for var i := 0 to Result.Length - 1 do
    Result[i] := Random(a, b);
end;

// ������������ � ���������� ������������ ������ ������� n, ���������� ��
// ��������� ������� � ��������� [a, b)
function MakeRandomRealArr(n: integer; a: real; b: real): RealArr;
begin
  Assert(n >= 0,  'MakeRandomRealArr: n >= 0');
  Assert(a <= b,  'MakeRandomRealArr: a <= b');
  var dist := b - a;
  Result := new real[n];
  for var i := 0 to Result.Length - 1 do
    Result[i] := a + Random * dist;
end;

// ------------------------------ ������ �������

// ������� �� ������� ���������� ������� a, �������� �������� 
// ������� delim
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
// ������� �� ������� ���������� ������� a, �������� �������� 
// ������� delim, � ��������� �� ����� ������
procedure PrintlnArr<T>(a: array of T; delim: string);
begin
  Assert(a <> nil,    'PrintlnArr<T>: a <> nil');
  Assert(delim <> '', 'PrintlnArr<T>: delim <> ""');
  PrintArr(a, delim);
  Writeln;
end;

end.