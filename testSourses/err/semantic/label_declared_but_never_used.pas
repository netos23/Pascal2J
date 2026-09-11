(* Negative test, ISO 7185 6.2.1 Blocks.
   Each label declared in the label-declaration-part of a block shall
   prefix exactly one statement in the statement-part of that same block.
   Label 2 below prefixes no statement, and label 3 prefixes two.
   Expected diagnostic: label declared but not used; label used twice. *)
program LabelDeclaredButNeverUsed(output);
label 1, 2, 3;
var
   i : integer;
begin
   i := 0;
1: i := i + 1;
3: if i < 3 then goto 1;
3: writeln(i)
end.
