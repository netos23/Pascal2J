(* Negative test, ISO 7185 6.4.3.2 Array-types.
   An array-type has at least one index-type.
   Expected diagnostic: ordinal-type expected in the index-type list. *)
program ArrayTypeWithEmptyIndexList(output);
type
   vector = array [] of integer;
var
   v : vector;
begin
   writeln('unreachable')
end.
