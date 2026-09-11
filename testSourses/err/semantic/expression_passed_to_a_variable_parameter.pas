(* Negative test, ISO 7185 6.6.3.3 Variable parameters.
   The actual parameter corresponding to a variable parameter shall be a
   variable-access of the same type, so a literal, an expression, a
   constant-identifier, a function result and a component of a packed
   variable are all inadmissible.
   Expected diagnostic: variable parameter requires a variable. *)
program ExpressionPassedToAVariableParameter(output);
const
   limit = 10;
type
   tight = packed array [1..4] of char;
var
   i, j : integer;
   t : tight;
procedure Modify(var n : integer);
begin
   n := n + 1
end;
procedure ModifyChar(var c : char);
begin
   c := 'x'
end;
function Source : integer;
begin
   Source := 1
end;
begin
   Modify(1);
   Modify(i + j);
   Modify(limit);
   Modify(Source);
   ModifyChar(t[1]);
   writeln(i, j)
end.
