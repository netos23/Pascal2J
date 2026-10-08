{ ISO 7185, 6.4.2.4 Subrange-types.
  A subrange-type is written as two constants of the same ordinal host-type
  separated by the subrange symbol; the first shall not be greater than the
  second.  The host-type may be integer, char, Boolean or an enumerated
  type, and the bounds may themselves be constant-identifiers. }
program SubrangeTypeRestrictsAHostType(output);
const
   limit = 100;
type
   natural = 0..maxint;
   year = 1900..1999;
   digit = 0..9;
   uppercase = 'A'..'Z';
   truthonly = true..true;
   colour = (red, yellow, green, blue);
   warmcolour = red..yellow;
   indexrange = 1..limit;
   negativerange = -10..-1;
   straddlingzero = -10..10;
var
   n : natural;
   y : year;
   d : digit;
   u : uppercase;
   t : truthonly;
   w : warmcolour;
   x : indexrange;
   m : negativerange;
   z : straddlingzero;
begin
   n := 0;
   y := 1990;
   d := 7;
   u := 'Q';
   t := true;
   w := yellow;
   x := limit;
   m := -5;
   z := 0;
   writeln(n, y, d, u, t, ord(w), x, m, z)
end.
