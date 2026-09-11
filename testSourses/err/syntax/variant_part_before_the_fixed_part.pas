(* Negative test, ISO 7185 6.4.3.3 Record-types.
   A field-list is a fixed-part optionally followed by a variant-part, or a
   variant-part alone.  Record-sections may not follow the variant-part.
   Expected diagnostic: end expected after the variant-part. *)
program VariantPartBeforeTheFixedPart(output);
type
   sex = (male, female);
   person = record
               case s : sex of
                  male : (bearded : Boolean);
                  female : (programmer : Boolean);
               age : integer
            end;
var
   p : person;
begin
   p.age := 0;
   writeln(p.age)
end.
