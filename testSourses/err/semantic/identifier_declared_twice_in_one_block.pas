(* Negative test, ISO 7185 6.2.2 Scopes.
   No identifier may have more than one defining-point in the same region,
   whatever kinds of entity the two declarations introduce.
   Expected diagnostic: identifier already declared in this block. *)
program IdentifierDeclaredTwiceInOneBlock(output);
const
   duplicate = 1;
type
   duplicate = integer;
var
   alsoduplicate : integer;
   alsoduplicate : real;
begin
   alsoduplicate := 0;
   writeln(alsoduplicate)
end.
