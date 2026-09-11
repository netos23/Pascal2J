(* Negative test, ISO 7185 6.6.1 and 6.6.2.
   When the block of a forward-declared routine is supplied, its heading is
   a procedure-identification or a function-identification, which repeats
   the identifier alone: the formal-parameter-list and, for a function, the
   result-type shall not be written again.
   Expected diagnostic: parameter list repeated after forward. *)
program ForwardDeclarationRepeatsItsParameterList(output);
function Twice(n : integer) : integer;
   forward;
function Twice(n : integer) : integer;
begin
   Twice := 2 * n
end;
begin
   writeln(Twice(21))
end.
