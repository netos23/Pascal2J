(* Negative test, ISO 7185 6.2.1 Blocks.
   The parts of a block occur in a fixed order: labels, constants, types,
   variables, procedures and functions, then the statement-part.  Here the
   variable-declaration-part precedes the constant-definition-part and the
   type-definition-part.
   Expected diagnostic: begin expected, const found. *)
program DeclarationPartsInTheWrongOrder(output);
var
   i : index;
const
   limit = 10;
type
   index = 1..limit;
begin
   i := 1;
   writeln(i)
end.
