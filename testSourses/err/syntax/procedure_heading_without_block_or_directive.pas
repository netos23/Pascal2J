(* Negative test, ISO 7185 6.6.1 Procedure-declarations.
   A procedure-declaration is a procedure-heading followed by a directive,
   a procedure-heading followed by a block, or a procedure-identification
   followed by a block.  The heading of Declared below is followed by
   another declaration instead, and a word-symbol cannot be a directive.
   Expected diagnostic: block or directive expected after the heading. *)
program ProcedureHeadingWithoutBlockOrDirective(output);
procedure Declared(n : integer);
procedure Another;
begin
   writeln('another')
end;
begin
   Another
end.
