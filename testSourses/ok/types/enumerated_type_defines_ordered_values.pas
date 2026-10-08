{ ISO 7185, 6.4.2.3 Enumerated-types.
  An enumerated-type lists its values in order; the ordinal number of the
  first is zero and each identifier is a constant of the new type.  The
  values are ordered by that ordinal number, so the relational operators,
  succ, pred and ord all apply. }
program EnumeratedTypeDefinesOrderedValues(output);
type
   colour = (red, yellow, green, blue);
   sex = (male, female);
   shape = (triangle, rectangle, circle);
   suit = (clubs, diamonds, hearts, spades);
var
   c : colour;
   s : sex;
   f : shape;
   t : suit;
   ordered : Boolean;
begin
   c := red;
   c := succ(c);
   c := pred(blue);
   s := female;
   f := circle;
   t := spades;
   ordered := (red < yellow) and (yellow < green) and (green < blue);
   ordered := ordered and (male < female) and (triangle <> circle);
   writeln(ord(c), ord(s), ord(f), ord(t), ordered);
   for c := red to blue do
      write(ord(c));
   writeln
end.
