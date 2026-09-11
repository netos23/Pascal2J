(* Negative test, ISO 7185 6.8.2.2 Assignment-statements.
   The left-hand side of an assignment-statement is a variable-access or a
   function-identifier.  A constant-identifier denotes a value, not a
   variable, and so cannot be assigned to.
   Expected diagnostic: constant identifier is not a variable. *)
program AssignmentToAConstantIdentifier(output);
const
   limit = 10;
type
   colour = (red, yellow, green, blue);
var
   i : integer;
begin
   limit := 20;
   red := green;
   i := limit;
   writeln(i)
end.
