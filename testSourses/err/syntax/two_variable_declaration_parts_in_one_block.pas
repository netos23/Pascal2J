(* Negative test, ISO 7185 6.2.1 Blocks.
   A block has at most one variable-declaration-part; further variables are
   added to the single part, not introduced by a second var.
   Expected diagnostic: begin expected, var found. *)
program TwoVariableDeclarationPartsInOneBlock(output);
var
   i : integer;
var
   j : integer;
begin
   i := 1;
   j := 2;
   writeln(i, j)
end.
