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
   {! !!SyntaxError[E2001]: missing 'end' before '.' at 13:10!! !}
   {! !!SyntaxError[E2003]: unexpected ';' at 13:11!! !}
   x := 1.;
   writeln(x)
end.
