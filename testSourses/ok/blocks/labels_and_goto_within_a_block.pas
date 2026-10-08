{ ISO 7185, 6.1.6 Labels, 6.2.1 Blocks and 6.8.2.4 Goto-statements.
  A label is an unsigned-integer whose apparent value is in 0..9999.  Every
  label declared in a block must prefix exactly one statement of that same
  block, and a goto-statement may lead to a labelled statement of the block
  containing the goto or of any block enclosing it. }
program LabelsAndGotoWithinABlock(output);
label 0, 1, 42, 9999;
var
   i : integer;
begin
   i := 0;
0: i := i + 1;
   if i < 3 then goto 0;
1: if i = 3 then goto 42;
   writeln('unreachable');
42:
   writeln(i);
   goto 9999;
9999:
end.
