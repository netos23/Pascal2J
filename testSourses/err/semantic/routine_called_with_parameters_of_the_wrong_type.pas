(* Negative test, ISO 7185 6.6.3.2 Value parameters.
   The actual parameter corresponding to a value parameter shall be an
   expression whose value is assignment-compatible with the type of the
   formal parameter.
   Expected diagnostic: actual parameter of the wrong type. *)
program RoutineCalledWithParametersOfTheWrongType(output);
type
   vector = array [1..3] of real;
var
   v : vector;
   b : Boolean;
procedure TakesInteger(n : integer);
begin
   writeln(n)
end;
procedure TakesVector(a : vector);
begin
   writeln(a[1])
end;
begin
   TakesInteger('a string');
   TakesInteger(1.5);
   TakesInteger(b);
   TakesVector(1);
   TakesVector(v[1]);
   writeln(b)
end.
