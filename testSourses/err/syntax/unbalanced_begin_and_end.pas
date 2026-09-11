(* Negative test, ISO 7185 6.8.3.2 Compound-statements.
   Every begin is closed by a matching end.  The inner compound-statement
   below is never closed, so the final end closes it and the program-block
   is left open.
   Expected diagnostic: end expected before the full stop. *)
program UnbalancedBeginAndEnd(output);
var
   i : integer;
begin
   i := 0;
   begin
      i := i + 1;
      writeln(i)
end.
