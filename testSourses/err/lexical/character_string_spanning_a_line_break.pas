(* Negative test, ISO 7185 6.1.7 Character-strings.
   No character-string may contain an end-of-line, so a string cannot be
   continued onto the following line; the two halves below are each an
   unterminated character-string.
   Expected diagnostic: unterminated character-string. *)
program CharacterStringSpanningALineBreak(output);
begin
   writeln('this string is broken
            across two lines')
end.
