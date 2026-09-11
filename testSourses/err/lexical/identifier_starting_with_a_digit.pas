(* Negative test, ISO 7185 6.1.3 Identifiers.
   An identifier is a letter followed by letters and digits, so it cannot
   begin with a digit.  The declaration below is read as the number 9
   followed by the identifier n.
   Expected diagnostic: identifier expected, unsigned-integer found. *)
program IdentifierStartingWithADigit(output);
var
   9n : integer;
begin
   9n := 0;
   writeln(9n)
end.
