uses HigherOrderFuncs;

begin
  //ReadDivisor;
  var a:= ReadArrInteger(5);
  println('a', a);
  println('new a:', Filter(a, IntPartOdd));
  
  //var source  := Arr(-9, 11, 46, 0, -12, 8, 45);
  //println(Filter&<integer>(source, Odd));
end.
{Логи:
a [5.9,4.2,3.3,2.1] 
new a: [5.9,3.3] 

a [1.50542424596167,6.40132528096499,1.77351124201599,8.45041085428112,3.14089777094354] 
new a: [1.50542424596167,1.77351124201599,3.14089777094354] 
}