(* Negative test, ISO 7185 6.1.5 Numbers.
   The fractional-part of an unsigned-real is a digit-sequence and shall
   not be empty, so a full stop immediately followed by a non-digit does
   not continue a number.  The full stop below is read as the full stop
   that terminates a program.
   Expected diagnostic: end of program expected before the semicolon. *)
program RealLiteralWithoutFractionalDigits(output);
var
   x : real;
begin
   x := 1.;
   writeln(x)
end.
