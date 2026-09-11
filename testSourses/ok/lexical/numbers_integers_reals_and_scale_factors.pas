{ ISO 7185, 6.1.5 Numbers.
  An unsigned-integer is a digit-sequence.  An unsigned-real is a
  digit-sequence followed by a fractional-part, a scale-factor, or both.
  A scale-factor may carry its own sign, which is not the sign of the number. }
program NumbersIntegersRealsAndScaleFactors(output);
const
   wholenumber = 1234567;
   withfraction = 3.14159;
   withscalefactor = 1e10;
   withboth = 6.02e23;
   negativescalefactor = 1.5e-3;
   explicitplusscale = 2.5e+8;
   negativeconstant = -273;
var
   i : integer;
   r : real;
begin
   i := 0;
   i := 42;
   r := 0.5;
   r := 5e0;
   r := 0.125e2;
   r := 1e-1;
   writeln(wholenumber, withfraction, withscalefactor, withboth);
   writeln(negativescalefactor, explicitplusscale, negativeconstant, i, r)
end.
