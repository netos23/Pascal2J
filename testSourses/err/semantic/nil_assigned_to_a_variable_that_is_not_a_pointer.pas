(* Negative test, ISO 7185 6.4.4 Pointer-types and 6.4.6.
   The value nil belongs to every pointer-type and to no other type, so it
   is not assignment-compatible with an integer, a real or a record.
   Expected diagnostic: nil can only be assigned to a pointer. *)
program NilAssignedToAVariableThatIsNotAPointer(output);
type
   point = record x, y : real end;
var
   i : integer;
   x : real;
   p : point;
   b : Boolean;
begin
   i := nil;
   x := nil;
   p := nil;
   b := nil;
   writeln(i, x, b)
end.
