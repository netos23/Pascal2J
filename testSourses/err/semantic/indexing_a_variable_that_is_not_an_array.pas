(* Negative test, ISO 7185 6.5.3.2 Indexed-variables.
   An indexed-variable denotes a component of an array-variable, so the
   variable before the square bracket shall be of an array-type.
   Expected diagnostic: array variable expected. *)
program IndexingAVariableThatIsNotAnArray(output);
type
   point = record x, y : real end;
var
   i : integer;
   p : point;
begin
   i := 0;
   i := i[1];
   p[1].x := 1.0;
   writeln(i)
end.
