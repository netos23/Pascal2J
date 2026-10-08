(* Negative test, ISO 7185 6.4.3.4 Set-types.
   The base-type of a set-type is an ordinal-type.
   Expected diagnostic: ordinal base type expected. *)
program SetBaseTypeIsNotOrdinal(output);
type
   ofreal = set of real;
   vector = array [1..3] of integer;
   ofarray = set of vector;
var
   s : ofreal;
   t : ofarray;
begin
   writeln('unreachable')
end.
