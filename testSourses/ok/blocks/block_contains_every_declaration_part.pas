{ ISO 7185, 6.2.1 Blocks.
  A block is a label-declaration-part, a constant-definition-part, a
  type-definition-part, a variable-declaration-part, a procedure-and-
  function-declaration-part and a statement-part, in that order.  Every
  declaration part is optional; this program supplies all of them, both
  in the program-block and in the block of a nested procedure. }
program BlockContainsEveryDeclarationPart(output);
label 1, 99;
const
   limit = 10;
type
   index = 1..limit;
var
   table : array [index] of integer;
   i : index;
procedure FillTable;
label 2;
const
   seed = 7;
type
   counter = integer;
var
   k : counter;
begin
   k := 1;
2: table[k] := seed * k;
   if k < limit then
      begin
         k := k + 1;
         goto 2
      end
end;
begin
   FillTable;
   i := 1;
1: writeln(table[i]);
   if i < limit then
      begin
         i := i + 1;
         goto 1
      end;
   goto 99;
99:
end.
