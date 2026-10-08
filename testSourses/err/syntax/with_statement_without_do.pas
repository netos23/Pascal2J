(* Negative test, ISO 7185 6.8.3.10 With-statements.
   The record-variable-list of a with-statement is followed by do.
   Expected diagnostic: do expected. *)
program WithStatementWithoutDo(output);
type
   point = record x, y : real end;
var
   p : point;
begin
   with p
      {! !!SyntaxError[E2001]: missing 'do' before 'begin' at 12:7!! !}
      begin
         x := 0.0;
         y := 0.0
      end;
   writeln(p.x)
end.
