{ ISO 7185, 6.7.2.2 Arithmetic operators.
  The dyadic operators plus, minus and times give an integer result when
  both operands are integer and a real result if either is real.  The
  divide operator always gives a real result, while div and mod require
  integer operands and give an integer result.  The monadic plus and minus
  apply to both types. }
program ArithmeticOperatorsOnIntegerAndReal(output);
var
   i, j, k : integer;
   x, y, z : real;
begin
   i := 17;
   j := 5;
   k := i + j;
   k := i - j;
   k := i * j;
   k := i div j;
   k := i mod j;
   k := -i;
   k := +i;
   k := (-i) div j;
   k := i div (-j);
   k := (-i) mod j;
   x := 17.0;
   y := 5.0;
   z := x + y;
   z := x - y;
   z := x * y;
   z := x / y;
   z := -x;
   z := +x;
   z := i / j;
   z := i + y;
   z := x * j;
   z := i - y + j * x - i / j;
   writeln(k, z);
   writeln(i + j, i - j, i * j, i div j, i mod j, i / j);
   writeln(x + y, x - y, x * y, x / y, -x, +y)
end.
