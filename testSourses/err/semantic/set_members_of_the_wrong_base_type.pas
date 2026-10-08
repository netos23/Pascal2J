(* Negative test, ISO 7185 6.7.1 Set-constructors and 6.4.3.4 Set-types.
   All member-designators of a set-constructor are of one ordinal type,
   and that type is compatible with the base-type of the set it is assigned
   to.
   Expected diagnostic: set member of the wrong type. *)
program SetMembersOfTheWrongBaseType(output);
type
   colour = (red, yellow, green, blue);
var
   digits : set of 0..9;
   colours : set of colour;
begin
   digits := ['a', 'b'];
   digits := [red, blue];
   digits := [1, 'a'];
   colours := [1, 2];
   colours := digits;
   writeln(1 in digits)
end.
