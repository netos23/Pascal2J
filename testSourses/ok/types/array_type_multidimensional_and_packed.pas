{ ISO 7185, 6.4.3.2 Array-types.
  An array-type has one or more index-types, each an ordinal-type, and a
  component-type.  An array-type with several index-types abbreviates an
  array of arrays, so both spellings below denote the same type.  The
  packed prefix applies to the whole array-type; a packed array of char
  whose index-type is 1..n for n greater than 1 is a string-type. }
program ArrayTypeMultidimensionalAndPacked(output);
const
   rows = 3;
   cols = 4;
type
   colour = (red, yellow, green, blue);
   abbreviated = array [1..rows, 1..cols] of integer;
   fullform = array [1..rows] of array [1..cols] of integer;
   indexedbychar = array ['a'..'z'] of integer;
   indexedbyboolean = array [Boolean] of integer;
   indexedbyenum = array [colour] of real;
   punchedcard = packed array [1..80] of char;
   name = packed array [1..10] of char;
   cube = array [1..2, 1..2, 1..2] of Boolean;
   matrixofrecords = array [1..2, 1..2] of record re, im : real end;
var
   a : abbreviated;
   b : fullform;
   tally : indexedbychar;
   flags : indexedbyboolean;
   weight : indexedbyenum;
   card : punchedcard;
   who : name;
   solid : cube;
   grid : matrixofrecords;
   i, j : integer;
begin
   for i := 1 to rows do
      for j := 1 to cols do
         begin
            a[i, j] := i * j;
            b[i][j] := a[i, j];
            a[i][j] := b[i, j]
         end;
   tally['a'] := 0;
   flags[false] := 1;
   flags[true] := 2;
   weight[green] := 0.5;
   card[80] := '*';
   who := 'ISO  7185 ';
   solid[1, 2, 1] := true;
   solid[2][2][2] := false;
   grid[1, 1].re := 1.0;
   grid[2, 2].im := -1.0;
   writeln(a[rows, cols], b[1][1], tally['a'], flags[true], weight[green]);
   writeln(card[80], who, solid[1, 2, 1], grid[1, 1].re, grid[2, 2].im)
end.
