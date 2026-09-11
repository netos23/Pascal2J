(* Negative test, ISO 7185 6.1.1 and 6.1.3 Identifiers.
   The alphabet of the language contains letters and digits only; the
   underscore is not a letter, so it may not appear in an identifier.
   Expected diagnostic: unrecognised character in the source. *)
program IdentifierContainingAnUnderscore(output);
var
   total_count : integer;
begin
   total_count := 0;
   writeln(total_count)
end.
