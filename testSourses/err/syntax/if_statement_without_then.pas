(* Negative test, ISO 7185 6.8.3.4 If-statements.
   The Boolean expression of an if-statement is followed by then.
   Expected diagnostic: then expected. *)
program IfStatementWithoutThen(output);
var
   i : integer;
begin
   i := 1;
   if i = 1
      writeln('one')
end.
