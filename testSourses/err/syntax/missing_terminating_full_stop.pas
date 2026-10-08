(* Negative test, ISO 7185 6.10 Programs.
   A program is terminated by a full stop after the program-block.
   Expected diagnostic: full stop expected at end of program. *)
program MissingTerminatingFullStop(output);
var
   i : integer;
begin
   i := 0;
   writeln(i)
{! !!SyntaxError[E2001]: missing '.' before end of file at 12:1!! !}
end
