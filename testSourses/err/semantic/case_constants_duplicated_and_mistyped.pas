(* Negative test, ISO 7185 6.8.3.5 Case-statements.
   The case-constants of a case-statement shall all be distinct, and each
   shall be of a type compatible with the case-index.
   Expected diagnostic: duplicate case constant; case constant of the wrong
   type. *)
program CaseConstantsDuplicatedAndMistyped(output);
var
   i : integer;
begin
   i := 1;
   case i of
      1 : writeln('one');
      2 : writeln('two');
      1 : writeln('one again');
      'a' : writeln('not an integer')
   end
end.
