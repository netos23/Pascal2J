{ ISO 7185, 6.4.3.3 Record-types.
  A field-list may end in a variant-part introduced by case.  The
  variant-selector may name a tag-field, as in shape below, or give only a
  tag-type, as in unnamedtag below.  A variant may itself contain a
  field-list with its own variant-part, and an empty variant is written as
  an empty parenthesised field-list. }
program RecordTypeWithVariantPart(output);
type
   shapekind = (triangle, rectangle, circle);
   sex = (male, female);
   figure = record
               area : real;
               case s : shapekind of
                  triangle : (side : real; inclination, angle1, angle2 : real);
                  rectangle : (side1, side2 : real; skew : real);
                  circle : (diameter : real)
            end;
   unnamedtag = record
                   common : integer;
                   case Boolean of
                      true : (whentrue : integer);
                      false : (whenfalse : real)
                end;
   nestedvariant = record
                      case outer : sex of
                         male : (bearded : Boolean;
                                 case inner : Boolean of
                                    true : (beardlength : real);
                                    false : ());
                         female : (programmer : Boolean)
                   end;
   variantonly = record
                    case sex of
                       male : (m : integer);
                       female : (f : integer)
                 end;
var
   f : figure;
   u : unnamedtag;
   n : nestedvariant;
   v : variantonly;
begin
   f.s := circle;
   f.diameter := 2.0;
   f.area := 3.14159 * f.diameter;
   u.common := 1;
   u.whentrue := 2;
   n.outer := male;
   n.bearded := true;
   n.inner := true;
   n.beardlength := 0.5;
   v.m := 7;
   writeln(f.area, f.diameter, u.common, u.whentrue, n.beardlength, v.m)
end.
