(* Negative test, ISO 7185 6.10 Programs.
   A program shall begin with a program-heading; a bare block is not a
   program.
   Expected diagnostic: program expected. *)
{! !!SyntaxError[E2003]: unexpected 'var' at 6:1!! !}
var
   i : integer;
begin
   i := 0;
   writeln(i)
end.
