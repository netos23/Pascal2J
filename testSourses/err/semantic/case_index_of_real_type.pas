(* Negative test, ISO 7185 6.8.3.5 Case-statements.
   The case-index of a case-statement is of an ordinal type, so a real
   expression may not be used and real constants are not case-constants.
   Expected diagnostic: ordinal case index expected. *)
program CaseIndexOfRealType(output);
var
   x : real;
begin
   x := 1.0;
   case x of
      1.0 : writeln('one');
      2.0 : writeln('two')
   end
end.
