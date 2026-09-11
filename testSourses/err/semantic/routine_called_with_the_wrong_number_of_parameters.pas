(* Negative test, ISO 7185 6.6.3.1 Parameters and 6.7.3.
   The actual-parameter-list of a procedure-statement or a
   function-designator shall have one actual parameter for each formal
   parameter of the routine.
   Expected diagnostic: wrong number of actual parameters. *)
program RoutineCalledWithTheWrongNumberOfParameters(output);
var
   i : integer;
procedure TakesTwo(a, b : integer);
begin
   writeln(a, b)
end;
function TakesOne(a : integer) : integer;
begin
   TakesOne := a
end;
procedure TakesNone;
begin
   writeln('none')
end;
begin
   TakesTwo(1);
   TakesTwo(1, 2, 3);
   i := TakesOne(1, 2);
   i := TakesOne;
   TakesNone(1);
   writeln(i)
end.
