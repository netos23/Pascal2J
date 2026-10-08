{ ISO 7185, 6.7.2.3 Boolean operators and 6.7.2.5 Relational operators.
  not, and and or take Boolean operands and give a Boolean result.  The
  relational operators compare two operands of compatible simple, string,
  set or pointer types and give a Boolean result; = and <> apply to
  pointers and to sets, and <= and >= between sets mean containment. }
program BooleanOperatorsAndRelationalResults(output);
type
   colour = (red, yellow, green, blue);
   link = ^integer;
   name = packed array [1..4] of char;
var
   p, q, r : Boolean;
   i, j : integer;
   x : real;
   c : char;
   e : colour;
   s, t : set of 0..9;
   u, v : link;
   n, m : name;
begin
   p := true;
   q := false;
   r := not p;
   r := p and q;
   r := p or q;
   r := (p and q) or (not p and not q);
   r := 1 = 1;
   r := 1 <> 2;
   r := 1 < 2;
   r := 2 > 1;
   r := 1 <= 1;
   r := 1 >= 1;
   i := 1;
   j := 2;
   x := 1.5;
   r := i < j;
   r := i < x;
   r := x >= i;
   c := 'a';
   r := c < 'b';
   r := c = 'a';
   e := green;
   r := e > red;
   r := e <> blue;
   r := p < q;
   r := false < true;
   s := [1, 2, 3];
   t := [1, 2];
   r := s = t;
   r := s <> t;
   r := t <= s;
   r := s >= t;
   r := 1 in s;
   r := not (9 in t);
   u := nil;
   new(v);
   r := u = nil;
   r := u <> v;
   n := 'abcd';
   m := 'abce';
   r := n < m;
   r := n = n;
   writeln(r, p, q);
   dispose(v)
end.
