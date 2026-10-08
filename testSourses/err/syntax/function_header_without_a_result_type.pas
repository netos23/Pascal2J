(* Negative test, ISO 7185 6.6.2 Function-declarations.
   A function-heading that is not a function-identification gives a colon
   and a result-type after the formal-parameter-list.
   Expected diagnostic: colon and result-type expected. *)
program FunctionHeaderWithoutAResultType(output);
{! !!SyntaxError[E2004]: invalid syntax near ';' at 7:28!! !}
function Twice(n : integer);
begin
   Twice := 2 * n
{! !!SyntaxError[E2003]: unexpected ';' at 11:4!! !}
end;
begin
   writeln(Twice(21))
end.
