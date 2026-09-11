(* Negative test, ISO 7185 6.10 Programs and 6.2.1 Blocks.
   A block declares procedures and functions; program is not a declaration
   and a program cannot be nested inside another program.
   Expected diagnostic: procedure or function expected, program found. *)
program NestedProgramDeclaration(output);
program Inner(output);
begin
   writeln('inner')
end;
begin
   writeln('outer')
end.
