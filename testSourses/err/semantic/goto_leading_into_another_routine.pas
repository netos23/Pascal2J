(* Negative test, ISO 7185 6.8.2.4 Goto-statements.
   A goto-statement may lead out of a procedure or function to a label of
   an enclosing block, but never into the block of another routine.
   Expected diagnostic: label is not in this block or an enclosing one. *)
program GotoLeadingIntoAnotherRoutine(output);
var
   i : integer;
procedure HasALabel;
label 1;
begin
1: writeln('inside')
end;
procedure JumpsIntoAnother;
begin
   goto 1
end;
begin
   i := 0;
   HasALabel;
   JumpsIntoAnother;
   writeln(i)
end.
