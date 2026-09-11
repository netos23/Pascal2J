(* Negative test, ISO 7185 6.8.2.3 Procedure-statements.
   A procedure with no formal parameters is activated by its identifier
   alone; an actual-parameter-list has at least one actual parameter, so
   empty parentheses are not part of the syntax.
   Expected diagnostic: expression expected between the parentheses. *)
program EmptyParenthesesOnAParameterlessCall(output);
procedure Report;
begin
   writeln('called')
end;
begin
   Report()
end.
