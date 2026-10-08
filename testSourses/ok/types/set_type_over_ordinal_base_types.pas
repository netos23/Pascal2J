{ ISO 7185, 6.4.3.4 Set-types.
  A set-type denotes the set of all subsets of its base-type, which shall
  be an ordinal-type.  A set-type may be packed.  Values are written as
  set-constructors, whose member-designators may be single expressions or
  ranges of them; the empty set is written as an empty constructor. }
program SetTypeOverOrdinalBaseTypes(output);
type
   colour = (red, yellow, green, blue);
   digitset = set of 0..9;
   charset = packed set of char;
   colourset = set of colour;
   booleanset = set of Boolean;
var
   digits : digitset;
   letters : charset;
   warm : colourset;
   truths : booleanset;
   present : Boolean;
begin
   digits := [];
   digits := [0, 2, 4, 6, 8];
   digits := digits + [1, 3..5];
   letters := ['a'..'z', 'A'..'Z', '0'..'9'];
   warm := [red, yellow];
   truths := [false..true];
   present := (4 in digits) and ('q' in letters) and (red in warm);
   present := present and (false in truths) and not (blue in warm);
   writeln(present)
end.
