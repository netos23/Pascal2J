(* Negative test, ISO 7185 6.8.3.5 Case-statements.
   The case-index of a case-statement is followed by of.
   Expected diagnostic: of expected. *)
program CaseStatementWithoutOf(output);
var
   i : integer;
begin
   i := 1;
   case i
      1 : writeln('one');
      2 : writeln('two')
   end
end.
