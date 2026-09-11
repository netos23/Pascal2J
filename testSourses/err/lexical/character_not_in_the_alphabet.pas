(* Negative test, ISO 7185 6.1.1 General.
   Only the characters of the defined alphabet and the special-symbols may
   appear outside a commentary or a character-string.  The two characters
   below belong to neither set.
   Expected diagnostic: unrecognised character in the source. *)
program CharacterNotInTheAlphabet(output);
var
   i : integer;
begin
   i := 1 ? 2;
   i := i ! 3;
   writeln(i)
end.
