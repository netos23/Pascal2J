(* Negative test, ISO 7185 6.8.3.9 For-statements.
   The control-variable of a for-statement shall be an entire-variable
   declared in the variable-declaration-part of the block that most closely
   contains the for-statement; a variable of an enclosing block will not do.
   Expected diagnostic: control variable is not local to this block. *)
program ForLoopControlVariableNotLocalToTheBlock(output);
var
   outer : integer;
procedure UsesTheOuterVariable;
begin
   for outer := 1 to 10 do
      writeln(outer)
end;
begin
   UsesTheOuterVariable
end.
