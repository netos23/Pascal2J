{ ISO 7185, 6.7.1 Expressions.
  Operators bind in four levels: not, then the multiplying-operators, then
  the adding-operators and the sign, then the relational-operators.
  Operators of equal precedence associate from left to right, and
  parentheses override the precedence entirely.  Because the relational
  operators bind least tightly, the operands of and and or that are
  comparisons must themselves be parenthesised. }
program OperatorPrecedenceAndParenthesisation(output);
var
   a, b, c, d : integer;
   x, y : real;
   p, q, r : Boolean;
begin
   a := 2;
   b := 3;
   c := 4;
   d := a + b * c;
   d := (a + b) * c;
   d := a - b - c;
   d := a - (b - c);
   d := c div b div a;
   d := c div (b div a);
   d := -a + b;
   d := -(a + b);
   d := a * b mod c;
   d := a * (b mod c);
   x := 1.5;
   y := x * 2 + 1 / 2;
   y := x * (2 + 1) / 2;
   p := true;
   q := false;
   r := not p and q;
   r := not (p and q);
   r := p or q and p;
   r := (p or q) and p;
   r := a < b;
   r := (a < b) and (b < c);
   r := (a = b) or not (c <> d);
   r := not not p;
   r := a + b * c > c div a - b;
   writeln(d, x, y, p, q, r)
end.
