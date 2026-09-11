(* Negative test, ISO 7185 6.10 Programs.
   The program-heading is separated from the program-block by a semicolon.
   Expected diagnostic: semicolon expected after the program-heading. *)
program MissingSemicolonAfterProgramHeading(output)
begin
   writeln('no semicolon above')
end.
