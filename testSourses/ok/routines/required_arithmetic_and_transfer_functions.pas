{ ISO 7185, 6.6.6.2 Arithmetic functions, 6.6.6.3 Transfer functions and
  6.6.6.4 Ordinal functions.
  abs and sqr take an integer or a real and return the same type; sin, cos,
  exp, ln, sqrt and arctan take an integer or a real and return a real.
  trunc and round map a real to an integer.  ord, chr, succ and pred work
  on ordinal values; succ and pred of an enumerated value stay in its type. }
program RequiredArithmeticAndTransferFunctions(output);
type
   colour = (red, yellow, green, blue);
var
   i : integer;
   r : real;
   c : char;
   b : Boolean;
   e : colour;
begin
   i := abs(-5);
   i := sqr(3);
   r := abs(-5.5);
   r := sqr(1.5);
   r := sin(0);
   r := sin(0.0);
   r := cos(r);
   r := exp(1.0);
   r := ln(exp(1.0));
   r := sqrt(2);
   r := sqrt(2.0);
   r := arctan(1.0);
   i := trunc(3.7);
   i := trunc(-3.7);
   i := round(3.5);
   i := round(-3.5);
   i := ord('A');
   i := ord(red);
   i := ord(true);
   c := chr(65);
   c := succ('a');
   c := pred('b');
   b := succ(false);
   b := pred(true);
   e := succ(red);
   e := pred(blue);
   i := succ(0);
   i := pred(0);
   writeln(i, r, c, b, ord(e));
   writeln(abs(sqr(trunc(round(2.4) + 0.6))), sqrt(sqr(2.0)))
end.
