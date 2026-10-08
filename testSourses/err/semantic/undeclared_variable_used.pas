(* Negative test, ISO 7185 6.2.2 Scopes.
   Every applied occurrence of an identifier shall have a corresponding
   defining-point in a region enclosing it.  This file is syntactically
   valid; only the name resolution fails.
   Expected diagnostic: identifier undeclared. *)
program UndeclaredVariableUsed(output);
var
   declared : integer;
begin
   declared := 1;
   undeclared := declared + 1;
   writeln(undeclared)
end.
