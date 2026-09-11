(* Negative test, ISO 7185 6.4.3.3 Record-types and 6.6.5.3.
   A tag-field is a field of the record, so the tag-field identifier and
   the field identifiers of the variants share one scope with the fixed
   part; selecting a field of a variant that the case-constants of new did
   not allocate, or naming a case-constant that is not of the tag-type, is
   not admissible.
   Expected diagnostic: variant selected by a case constant of the wrong
   type. *)
program VariantFieldSelectedByTheWrongTag(output);
type
   sex = (male, female);
   colour = (red, yellow, green, blue);
   personptr = ^person;
   person = record
               age : integer;
               case s : sex of
                  male : (bearded : Boolean);
                  female : (programmer : Boolean)
            end;
var
   p : personptr;
begin
   new(p, red);
   dispose(p, 1);
   new(p, male, female);
   writeln(p^.age)
end.
