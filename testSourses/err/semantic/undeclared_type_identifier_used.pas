(* Negative test, ISO 7185 6.2.2 Scopes and 6.4.1 Type-definitions.
   A type-identifier used in a type-denoter shall be declared, either
   earlier in the same type-definition-part or in an enclosing region.  The
   forward reference rule of 6.2.2 applies only to the domain-type of a
   pointer-type, not to a component-type.
   Expected diagnostic: type identifier undeclared. *)
program UndeclaredTypeIdentifierUsed(output);
type
   vector = array [1..3] of element;
var
   v : vector;
begin
   v[1] := 0;
   writeln(v[1])
end.
