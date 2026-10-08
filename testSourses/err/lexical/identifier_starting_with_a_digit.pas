(* Negative test, ISO 7185 6.1.3 Identifiers.
   An identifier is a letter followed by letters and digits, so it cannot
   begin with a digit.  The declaration below is read as the number 9
   followed by the identifier n.
   Expected diagnostic: identifier expected, unsigned-integer found. *)
program IdentifierStartingWithADigit(output);
var
   {! !!SyntaxError[E2002]: extraneous '9' at 9:4!! !}
   9n : integer;
begin
   {! !!SyntaxError[E2001]: missing ':' before 'n' at 12:5!! !}
   9n := 0;
   {! !!SyntaxError[E2004]: invalid syntax near 'n' at 14:13!! !}
   writeln(9n)
end.
