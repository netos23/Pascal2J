(* Negative test, ISO 7185 6.5.4 Identified-variables and 6.5.5.
   The pointer symbol may follow only a variable-access of a pointer-type
   or of a file-type; after anything else it has no meaning.
   Expected diagnostic: pointer or file variable expected before the
   pointer symbol. *)
program DereferenceOfAVariableThatIsNotAPointer(output);
type
   point = record x, y : real end;
var
   i : integer;
   p : point;
   v : array [1..3] of integer;
begin
   i := 0;
   i := i^;
   p^.x := 1.0;
   v^[1] := 2;
   writeln(i)
end.
