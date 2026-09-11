{ ISO 7185, 6.7.2.4 Set operators and 6.7.1 Set-constructors.
  The plus, minus and times operators applied to sets of compatible base
  types mean union, difference and intersection.  A set-constructor lists
  member-designators, each a single expression or a range written with the
  subrange symbol; the expressions need not be constants, and a range whose
  lower bound exceeds its upper denotes no members. }
program SetOperatorsAndSetConstructors(output);
type
   colour = (red, yellow, green, blue);
   digits = set of 0..9;
   colours = set of colour;
   chars = set of char;
var
   s, t, u : digits;
   cs : colours;
   letters, vowels : chars;
   i, j : integer;
   member : Boolean;
begin
   i := 2;
   j := 5;
   s := [];
   s := [0];
   s := [1, 3, 5, 7, 9];
   t := [0, 2, 4, 6, 8];
   u := s + t;
   u := s - t;
   u := s * t;
   u := (s + t) - (s * t);
   s := [i];
   s := [i, j];
   s := [i..j];
   s := [i..j, j..9, 0..i];
   s := [j..i];
   s := [i + 1, j - 1, i * j - 5];
   cs := [red, blue];
   cs := cs + [yellow..green];
   letters := ['a'..'z'];
   vowels := ['a', 'e', 'i', 'o', 'u'];
   letters := letters - vowels;
   member := (i in s) and (red in cs) and ('b' in letters);
   member := member and not ('a' in letters) and (vowels <= ['a'..'z']);
   writeln(member)
end.
