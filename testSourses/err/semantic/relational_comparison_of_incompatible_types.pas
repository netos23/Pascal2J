(* Negative test, ISO 7185 6.7.2.5 Relational operators.
   The operands of a relational operator are of compatible types.  Sets may
   be compared with =, <>, <= and >= only, pointers with = and <> only, and
   values of unrelated ordinal types may not be compared at all.
   Expected diagnostic: incompatible operands of a relational operator. *)
program RelationalComparisonOfIncompatibleTypes(output);
type
   colour = (red, yellow, green, blue);
   sex = (male, female);
   link = ^integer;
var
   b : Boolean;
   c : colour;
   s : sex;
   i : integer;
   p, q : link;
   set1 : set of 0..9;
begin
   c := red;
   s := male;
   b := c < s;
   b := c = i;
   b := i < 'a';
   b := p < q;
   b := p >= q;
   b := set1 < [1, 2];
   b := set1 > [1, 2];
   writeln(b)
end.
