(* Negative test, ISO 7185 6.4.2.4 Subrange-types.
   The two constants of a subrange-type are separated by the subrange
   symbol, which is two full stops.
   Expected diagnostic: subrange symbol expected. *)
program SubrangeWrittenWithASingleFullStop(output);
type
   digit = 0.9;
var
   d : digit;
begin
   d := 1;
   writeln(d)
end.
