{ ISO 7185, 6.6.5.3 Dynamic allocation procedures.
  new creates a new variable of the domain-type of its pointer parameter
  and makes the pointer identify it; dispose releases it.  When the domain
  type has variants, new and dispose may be given a list of case-constants
  that selects the variants to be allocated, and the constants shall be
  given in the order of the nested variant-parts. }
program RequiredDynamicAllocationProcedures(output);
type
   shapekind = (triangle, rectangle, circle);
   figureptr = ^figure;
   figure = record
               area : real;
               case s : shapekind of
                  triangle : (side, inclination : real);
                  rectangle : (side1, side2 : real);
                  circle : (diameter : real)
            end;
   sex = (male, female);
   personptr = ^person;
   person = record
               age : integer;
               case s : sex of
                  male : (bearded : Boolean;
                          case married : Boolean of
                             true : (spouse : personptr);
                             false : ());
                  female : (programmer : Boolean)
            end;
   intptr = ^integer;
var
   f, g : figureptr;
   p : personptr;
   n : intptr;
begin
   new(f);
   f^.s := triangle;
   f^.side := 1.0;
   new(g, circle);
   g^.diameter := 2.0;
   new(p, male, true);
   p^.age := 40;
   p^.bearded := true;
   p^.spouse := nil;
   new(n);
   n^ := 1;
   dispose(n);
   dispose(p, male, true);
   dispose(g, circle);
   dispose(f);
   writeln('allocated and released')
end.
