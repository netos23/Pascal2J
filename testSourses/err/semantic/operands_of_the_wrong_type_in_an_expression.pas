(* Negative test, ISO 7185 6.7.2 Operators.
   The dyadic arithmetic operators take operands of integer-type or
   real-type, div and mod take integer operands only, the Boolean operators
   take Boolean operands, and in takes an ordinal left operand and a set
   right operand whose base-type is compatible with it.
   Expected diagnostic: operand of the wrong type. *)
program OperandsOfTheWrongTypeInAnExpression(output);
var
   i : integer;
   x : real;
   b : Boolean;
   c : char;
   s : set of 0..9;
begin
   i := i + b;
   i := c * 2;
   b := b + 1;
   i := x div 2;
   i := 7 mod x;
   b := i and 1;
   b := not i;
   b := b or i;
   b := x in s;
   b := 'a' in s;
   b := i in b;
   writeln(i, x, b)
end.
