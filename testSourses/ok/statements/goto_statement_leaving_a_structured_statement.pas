{ ISO 7185, 6.8.2.4 Goto-statements.
  A goto-statement may lead out of a structured-statement to a labelled
  statement of the same statement-sequence, and it may lead out of a
  procedure or function to a label of an enclosing block, which terminates
  the activations between.  What it may not do is lead into a
  structured-statement from outside it. }
program GotoStatementLeavingAStructuredStatement(output);
label 1, 2, 3;
var
   i, j : integer;
procedure Abandon(k : integer);
begin
   if k > 2 then
      goto 3;
   writeln(k)
end;
begin
   for i := 1 to 10 do
      begin
         for j := 1 to 10 do
            if i * j > 12 then
               goto 1;
         writeln(i, j)
      end;
1: i := 0;
   while true do
      begin
         i := i + 1;
         if i > 5 then
            goto 2
      end;
2: repeat
      i := i - 1;
      case i of
         0 : goto 3;
         1, 2, 3, 4, 5 : Abandon(i)
      end
   until i = 0;
3: writeln(i, j)
end.
