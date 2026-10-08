(* Negative test, ISO 7185 6.6.2 Function-declarations.
   The block of a function-declaration shall contain at least one
   assignment-statement whose left-hand side is the function-identifier of
   that function.
   Expected diagnostic: function result is never assigned. *)
program FunctionWithoutAnAssignmentToItsIdentifier(output);
var
   local : integer;
function NeverAssigned(n : integer) : integer;
var
   scratch : integer;
begin
   scratch := n * 2
end;
begin
   local := NeverAssigned(21);
   writeln(local)
end.
