(* Negative test, ISO 7185 6.8.2.4 Goto-statements.
   A goto-statement outside a structured-statement may not lead to a label
   inside it; the labelled statement has to belong to the same
   statement-sequence as the goto, or to one enclosing it.
   Expected diagnostic: goto leads into a structured statement. *)
program GotoLeadingIntoAStructuredStatement(output);
label 1, 2;
var
   i, j : integer;
begin
   i := 0;
   goto 1;
   for j := 1 to 10 do
      begin
1:       i := i + j
      end;
   goto 2;
   if i > 0 then
      begin
2:       writeln(i)
      end
end.
