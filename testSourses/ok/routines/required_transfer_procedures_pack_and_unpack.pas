{ ISO 7185, 6.6.5.4 Transfer procedures.
  pack copies a run of components of an unpacked array into a packed array
  of the same component-type, starting at a given index of the unpacked
  array; unpack copies the other way, into a given index of the unpacked
  array.  It is an error if the run does not fit. }
program RequiredTransferProceduresPackAndUnpack(output);
const
   unpackedsize = 10;
   packedsize = 4;
type
   loose = array [1..unpackedsize] of char;
   tight = packed array [1..packedsize] of char;
   looseintegers = array [0..5] of integer;
   tightintegers = packed array [1..3] of integer;
var
   u : loose;
   p : tight;
   ui : looseintegers;
   pi : tightintegers;
   i : integer;
begin
   for i := 1 to unpackedsize do
      u[i] := chr(ord('a') + i - 1);
   pack(u, 1, p);
   pack(u, 7, p);
   unpack(p, u, 1);
   unpack(p, u, unpackedsize - packedsize + 1);
   for i := 0 to 5 do
      ui[i] := i;
   pack(ui, 0, pi);
   unpack(pi, ui, 3);
   for i := 1 to unpackedsize do
      write(u[i]);
   writeln;
   writeln(p[1], p[packedsize], ui[3], pi[1])
end.
