(* Negative test, ISO 7185 6.4.3.3 Record-types.
   The field-list of a record-type is closed by end.
   Expected diagnostic: end expected in the record-type. *)
program RecordTypeWithoutEnd(output);
type
   point = record
              x, y : real;
{! !!SyntaxError[E2003]: unexpected 'var' at 9:1!! !}
var
   p : point;
begin
   p.x := 0.0;
   writeln(p.x)
end.
