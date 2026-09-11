(* Negative test, ISO 7185 6.8.3.9 For-statements.
   The final-value of a for-statement is followed by do.
   Expected diagnostic: do expected. *)
program ForStatementWithoutDo(output);
var
   i : integer;
begin
   for i := 1 to 10
      writeln(i)
end.
