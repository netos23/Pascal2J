(* Negative test, ISO 7185 6.8.3.9 For-statements.
   The control-variable of a for-statement shall not be threatened by the
   statement of that for-statement: it may not be assigned to, passed as a
   variable parameter, read into, or used as the control-variable of a
   nested for-statement.
   Expected diagnostic: the control variable is threatened by the loop
   body. *)
program AssignmentToAForLoopControlVariable(input, output);
var
   i, j : integer;
procedure Modify(var n : integer);
begin
   n := 0
end;
begin
   for i := 1 to 10 do
      i := i + 1;
   for i := 1 to 10 do
      Modify(i);
   for i := 1 to 10 do
      read(i);
   for i := 1 to 10 do
      for i := 1 to 10 do
         j := i;
   writeln(i, j)
end.
