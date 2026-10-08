(* Negative test, ISO 7185 6.5.3.3 Field-designators.
   A field-designator selects a field-identifier of a record-variable, so
   the variable before the full stop shall be of a record-type, and the
   identifier after it shall be one of that record type's fields.
   Expected diagnostic: record variable expected; unknown field
   identifier. *)
program FieldSelectionOnAVariableThatIsNotARecord(output);
type
   point = record x, y : real end;
var
   i : integer;
   p : point;
   v : array [1..3] of integer;
begin
   i := 0;
   i := trunc(p.z);
   i := trunc(i.x);
   i := v.x;
   writeln(i)
end.
