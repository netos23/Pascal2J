(* Negative test, ISO 7185 6.8.3.2 Compound-statements.
   The statements of a statement-sequence are separated by semicolons.
   Expected diagnostic: semicolon expected between statements. *)
program MissingSemicolonBetweenStatements(output);
var
   i, j : integer;
begin
   i := 1
   j := 2;
   writeln(i, j)
end.
