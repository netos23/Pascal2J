{ ISO 7185, 6.5.2 Entire-variables and 6.5.3.2 Indexed-variables.
  An entire-variable is denoted by a variable-identifier.  An indexed
  variable denotes a component of an array-variable; the index-expression
  shall be assignment-compatible with the index-type.  Indexing an array of
  arrays may be written with one bracket pair or with several. }
program EntireAndIndexedVariableAccess(output);
type
   colour = (red, yellow, green, blue);
   plane = array [1..4, 1..4] of integer;
   solid = array [1..2] of array [1..2] of array [1..2] of integer;
var
   flat : array [1..8] of integer;
   sheet : plane;
   block : solid;
   bycolour : array [colour] of integer;
   bychar : array ['0'..'9'] of integer;
   i, j : integer;
begin
   for i := 1 to 8 do
      flat[i] := i;
   for i := 1 to 4 do
      for j := 1 to 4 do
         sheet[i, j] := flat[i] * flat[j];
   block[1, 1, 1] := 1;
   block[1][1][2] := 2;
   block[2, 1][1] := 3;
   block[2][2, 2] := 4;
   bycolour[green] := ord(green);
   bychar['7'] := 7;
   sheet[flat[1], flat[2]] := sheet[1, 1] + sheet[2, 2];
   writeln(flat[8], sheet[4, 4], block[2, 2, 2], bycolour[green], bychar['7'])
end.
