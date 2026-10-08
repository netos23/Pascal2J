(* Negative test, ISO 7185 6.1.1 and 6.1.3 Identifiers.
   The alphabet of the language contains letters and digits only; the
   underscore is not a letter, so it may not appear in an identifier.
   Expected diagnostic: unrecognised character in the source. *)
program IdentifierContainingAnUnderscore(output);
var
   {! !!SyntaxError[E1001]: character '_' is not in the alphabet at 9:9!! !}
   {! !!SyntaxError[E2002]: extraneous 'count' at 9:10!! !}
   total_count : integer;
begin
   {! !!SyntaxError[E1001]: character '_' is not in the alphabet at 13:9!! !}
   {! !!SyntaxError[E2003]: unexpected 'count' at 13:10!! !}
   total_count := 0;
   {! !!SyntaxError[E1001]: character '_' is not in the alphabet at 15:17!! !}
   writeln(total_count)
end.
