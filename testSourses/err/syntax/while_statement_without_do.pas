(* Negative test, ISO 7185 6.8.3.8 While-statements.
   The Boolean expression of a while-statement is followed by do.
   Expected diagnostic: do expected. *)
program WhileStatementWithoutDo(output);
var
   i : integer;
begin
   i := 0;
   while i < 10
      i := i + 1;
   writeln(i)
end.
