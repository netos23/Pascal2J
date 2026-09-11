{ ISO 7185, 6.8.2.2 Assignment-statements and 6.4.6 Assignment-compatibility.
  An assignment-statement gives the value of an expression to a variable or
  to a function-identifier.  A value of integer-type is assignment-
  compatible with a real-type variable, a value of an ordinal type is
  assignment-compatible with a variable of a compatible subrange, and whole
  arrays, records, sets and files components may be assigned as units. }
program AssignmentStatementsAndCompatibility(output);
type
   colour = (red, yellow, green, blue);
   digit = 0..9;
   vector = array [1..3] of real;
   point = record x, y : real end;
   digits = set of digit;
   link = ^point;
var
   i : integer;
   n : digit;
   x : real;
   c : char;
   b : Boolean;
   e : colour;
   v, w : vector;
   p, q : point;
   s, t : digits;
   u : link;
function Doubled(k : integer) : integer;
begin
   Doubled := 2 * k
end;
begin
   i := 1;
   n := 9;
   i := n;
   n := i;
   x := 1.5;
   x := i;
   x := n;
   c := 'c';
   b := true;
   e := green;
   v[1] := 1.0;
   w := v;
   p.x := 1.0;
   p.y := 2.0;
   q := p;
   s := [1, 2];
   t := s;
   new(u);
   u := nil;
   i := Doubled(i);
   x := Doubled(i);
   i := i + 1;
   x := x * x;
   s := s + t;
   writeln(i, n, x, c, b, ord(e), w[1], q.x, 1 in t, u = nil)
end.
