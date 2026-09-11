{ ISO 7185, 6.6.3.7 Conformant array parameters.
  A conformant-array-schema lets one routine accept actual arrays whose
  index-type bounds differ.  The two bound-identifiers are constants within
  the routine, and the schema may be packed or unpacked, may be a value or
  a variable parameter, and may be written in the abbreviated form with
  several index-type-specifications or as nested schemas. }
program ConformantArrayParameters(output);
type
   short = array [1..3] of integer;
   long = array [0..9] of integer;
   grid = array [1..2, 1..4] of real;
   line = packed array [1..12] of char;
var
   a : short;
   b : long;
   g : grid;
   l : line;
   i, j : integer;
function SumOfValueConformant(v : array [lo..hi : integer] of integer)
   : integer;
var
   k : integer;
   acc : integer;
begin
   acc := 0;
   for k := lo to hi do
      acc := acc + v[k];
   SumOfValueConformant := acc
end;
procedure ClearVariableConformant(var v : array [lo..hi : integer] of integer);
var
   k : integer;
begin
   for k := lo to hi do
      v[k] := 0
end;
procedure AbbreviatedTwoDimensional(
      var m : array [rowlo..rowhi : integer; collo..colhi : integer] of real);
var
   r, c : integer;
begin
   for r := rowlo to rowhi do
      for c := collo to colhi do
         m[r, c] := 0.0
end;
procedure NestedSchemas(
      var m : array [rowlo..rowhi : integer] of
              array [collo..colhi : integer] of real);
begin
   m[rowlo][collo] := 1.0
end;
procedure WritePackedConformant(s : packed array [lo..hi : integer] of char);
var
   k : integer;
begin
   for k := lo to hi do
      write(s[k]);
   writeln
end;
procedure SeveralConformantSections(var u : array [ulo..uhi : integer] of
                                             integer;
                                    var w : array [wlo..whi : integer] of
                                             integer);
begin
   u[ulo] := whi - wlo;
   w[wlo] := uhi - ulo
end;
begin
   for i := 1 to 3 do
      a[i] := i;
   for i := 0 to 9 do
      b[i] := i;
   l := 'conformant  ';
   writeln(SumOfValueConformant(a), SumOfValueConformant(b));
   ClearVariableConformant(a);
   ClearVariableConformant(b);
   AbbreviatedTwoDimensional(g);
   NestedSchemas(g);
   WritePackedConformant(l);
   SeveralConformantSections(a, b);
   for i := 1 to 2 do
      for j := 1 to 4 do
         write(g[i, j]);
   writeln;
   writeln(a[1], b[0])
end.
