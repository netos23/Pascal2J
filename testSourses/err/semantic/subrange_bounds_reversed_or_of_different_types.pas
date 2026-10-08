(* Negative test, ISO 7185 6.4.2.4 Subrange-types.
   Both constants of a subrange-type are of the same ordinal host-type, and
   the value of the first shall not be greater than the value of the second.
   Expected diagnostic: lower bound exceeds upper bound; subrange bounds of
   different types. *)
program SubrangeBoundsReversedOrOfDifferentTypes(output);
type
   colour = (red, yellow, green, blue);
   reversed = 10..1;
   reversedchars = 'z'..'a';
   mixed = 1..'z';
   mixedenum = red..3;
   fromreal = 1.0..2.0;
var
   a : reversed;
   b : mixed;
begin
   writeln('unreachable')
end.
