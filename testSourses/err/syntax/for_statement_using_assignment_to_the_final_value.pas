(* Negative test, ISO 7185 6.8.3.9 For-statements.
   A for-statement names one control-variable, assigns the initial-value to
   it, and reaches the final-value through to or downto.  Neither a second
   assignment symbol nor a comma-separated list of control-variables is
   part of the syntax.
   Expected diagnostic: to or downto expected. *)
program ForStatementUsingAssignmentToTheFinalValue(output);
var
   i : integer;
begin
   for i := 1 := 10 do
      writeln(i)
end.
