(* Negative test, ISO 7185 6.10 Programs.
   A program is terminated by a full stop after the program-block.
   Expected diagnostic: full stop expected at end of program. *)
program MissingTerminatingFullStop(output);
var
   i : integer;
begin
   i := 0;
   writeln(i)
end
