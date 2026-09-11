(* Negative test, ISO 7185 6.4.3.2 Array-types.
   The index-type list of an array-type is followed by of and a
   component-type.
   Expected diagnostic: of expected. *)
program ArrayTypeWithoutOf(output);
type
   vector = array [1..10] integer;
var
   v : vector;
begin
   v[1] := 0;
   writeln(v[1])
end.
