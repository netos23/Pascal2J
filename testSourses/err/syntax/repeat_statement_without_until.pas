(* Negative test, ISO 7185 6.8.3.7 Repeat-statements.
   The statement-sequence of a repeat-statement is closed by until and a
   Boolean expression, not by end.
   Expected diagnostic: until expected. *)
program RepeatStatementWithoutUntil(output);
var
   i : integer;
begin
   i := 0;
   repeat
      i := i + 1
   end;
   writeln(i)
end.
