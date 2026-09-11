(* Negative test, ISO 7185 6.3 Constant-definitions.
   The right-hand side of a constant-definition is a constant: a signed
   number, a signed constant-identifier or a character-string.  It is not
   an expression, so neither arithmetic nor a set-constructor is allowed.
   Expected diagnostic: constant expected. *)
program ConstantDefinitionUsingAnExpression(output);
const
   base = 10;
   doubled = base * 2;
begin
   writeln(doubled)
end.
