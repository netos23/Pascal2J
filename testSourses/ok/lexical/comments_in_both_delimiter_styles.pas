(* ISO 7185, 6.1.8 Token separators and 6.1.9 Lexical alternatives.
   A commentary is delimited by a left brace or the two-character
   alternative, and closed by a right brace or the alternative closer.
   Note 1 of 6.1.8 states that a commentary opened with one delimiter may
   be closed by the other, so the mixed forms below are also tested.
   A commentary may appear anywhere a token separator may appear. *)
program CommentsInBothDelimiterStyles(output);
{ a commentary written with braces }
(* a commentary written with the alternative symbols *)
{ a commentary opened with a brace and closed with the alternative *)
(* a commentary opened with the alternative and closed with a brace }
var
   x (* between the identifier and the colon *) : integer;
   y : { between the colon and the type } integer;
begin
   x := 1; { a trailing commentary }
   y (* here *) := (* and here *) 2 (* and here *);
   { a commentary
     may span
     several lines }
   writeln(x + y) { no separator is needed before the final end }
end.
