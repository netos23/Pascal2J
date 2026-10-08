(* Negative test, ISO 7185 6.4.3.2 Array-types.
   Each index-type of an array-type is an ordinal-type, so real and
   structured types may not be used as index-types.
   Expected diagnostic: ordinal index type expected. *)
program ArrayIndexTypeIsNotOrdinal(output);
type
   byreal = array [real] of integer;
   bystring = array [1..3] of integer;
   byarray = array [bystring] of integer;
var
   a : byreal;
   b : byarray;
begin
   writeln('unreachable')
end.
