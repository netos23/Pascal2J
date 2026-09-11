(* Negative test, ISO 7185 6.10 Programs.
   Each identifier of the program-parameter-list has a defining-point as a
   variable-identifier for the program-block, so every program parameter
   other than the required input and output shall be declared in the
   variable-declaration-part.  The identifiers of the list shall also be
   distinct.
   Expected diagnostic: program parameter is not declared; duplicate
   program parameter. *)
program ProgramParameterNotDeclaredAsAVariable(input, output, data, data);
var
   i : integer;
begin
   i := 0;
   writeln(i)
end.
