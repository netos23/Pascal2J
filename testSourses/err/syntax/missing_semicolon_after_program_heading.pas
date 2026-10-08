(* Negative test, ISO 7185 6.10 Programs.
   The program-heading is separated from the program-block by a semicolon.
   Expected diagnostic: semicolon expected after the program-heading. *)
program MissingSemicolonAfterProgramHeading(output)
{! !!SyntaxError[E2001]: missing ';' before 'begin' at 6:1!! !}
begin
   writeln('no semicolon above')
end.
