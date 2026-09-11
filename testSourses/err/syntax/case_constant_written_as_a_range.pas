(* Negative test, ISO 7185 6.8.3.5 Case-statements.
   A case-constant is a single constant.  Unextended Pascal has no range
   form in a case-constant-list, so consecutive values must be listed.
   Expected diagnostic: colon or comma expected, subrange symbol found. *)
program CaseConstantWrittenAsARange(output);
var
   i : integer;
begin
   i := 3;
   case i of
      1 : writeln('one');
      2..5 : writeln('two to five')
   end
end.
