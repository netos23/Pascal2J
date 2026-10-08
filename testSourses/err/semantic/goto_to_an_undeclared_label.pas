(* Negative test, ISO 7185 6.8.2.4 Goto-statements and 6.2.1 Blocks.
   The label of a goto-statement shall be declared in the block containing
   the goto-statement or in an enclosing block, and a statement may not be
   prefixed by a label that has not been declared.
   Expected diagnostic: label undeclared. *)
program GotoToAnUndeclaredLabel(output);
label 1;
var
   i : integer;
begin
   i := 0;
1: i := i + 1;
   goto 99;
2: writeln(i)
end.
