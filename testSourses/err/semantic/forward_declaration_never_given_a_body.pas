(* Negative test, ISO 7185 6.6.1 Procedure-declarations.
   A procedure-heading followed by the directive forward shall be matched
   by a procedure-identification and a block later in the same
   procedure-and-function-declaration-part.
   Expected diagnostic: forward declaration has no body. *)
program ForwardDeclarationNeverGivenABody(output);
procedure Promised(n : integer);
   forward;
procedure Delivered;
begin
   writeln('delivered')
end;
begin
   Delivered;
   Promised(1)
end.
