{ ISO 7185, 6.4.7 Example of a type-definition-part.
  The type-definition-part given as the worked example of the standard,
  transcribed verbatim apart from the declarations needed to make it a
  complete program.  Per the note to 6.4.7, count, range and integer denote
  the same type, while year and natural are compatible with but not the
  same as that type. }
program TypeDefinitionPartExampleFromTheStandard(output);
const
   limit = 100;
type
   angle = real;
   natural = 0..maxint;
   count = integer;
   range = integer;
   colour = (red, yellow, green, blue);
   sex = (male, female);
   year = 1900..1999;
   shape = (triangle, rectangle, circle);
   punchedcard = array [1..80] of char;
   charsequence = file of char;
   polar = record
              r : real;
              theta : angle
           end;
   indextype = 1..limit;
   vector = array [indextype] of real;
   person = ^persondetails;
   persondetails = record
                      name, firstname : charsequence;
                      age : natural;
                      married : Boolean;
                      father, child, sibling : person;
                      case s : sex of
                         male : (enlisted, bearded : Boolean);
                         female : (mother, programmer : Boolean)
                   end;
   fileofinteger = file of integer;
var
   c : count;
   r : range;
   y : year;
   n : natural;
   who : person;
begin
   c := 1;
   r := c;
   y := 1990;
   n := y;
   c := n;
   new(who);
   who^.age := n;
   who^.married := false;
   who^.s := female;
   who^.programmer := true;
   writeln(c, r, y, n, who^.programmer)
end.
