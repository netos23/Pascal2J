(* Negative test, ISO 7185 6.6.2 Function-declarations.
   A function-heading that is not a function-identification gives a colon
   and a result-type after the formal-parameter-list.
   Expected diagnostic: colon and result-type expected. *)
program FunctionHeaderWithoutAResultType(output);
function Twice(n : integer);
begin
   Twice := 2 * n
end;
begin
   writeln(Twice(21))
end.
