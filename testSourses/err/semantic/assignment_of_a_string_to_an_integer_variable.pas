(* Negative test, ISO 7185 6.4.6 Assignment-compatibility.
   A value is assignment-compatible with a type only if the types are the
   same, or the value is an integer and the type is real, or both are
   compatible ordinal or set types.  A string-type and integer are neither.
   Expected diagnostic: type mismatch in assignment. *)
program AssignmentOfAStringToAnIntegerVariable(output);
var
   i : integer;
begin
   i := 'not a number';
   writeln(i)
end.
