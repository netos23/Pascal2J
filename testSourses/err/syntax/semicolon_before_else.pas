(* Negative test, ISO 7185 6.8.3.4 If-statements.
   A semicolon separates statements, and the else-part belongs to the same
   if-statement as its then-part, so no semicolon may stand immediately
   before else.
   Expected diagnostic: else without a matching if. *)
program SemicolonBeforeElse(output);
var
   i : integer;
begin
   i := 1;
   if i = 1 then
      writeln('one');
   else
      writeln('not one')
end.
