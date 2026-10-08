(* Negative test, ISO 7185 6.1.7 Character-strings.
   No character-string may contain an end-of-line, so a string cannot be
   continued onto the following line; the two halves below are each an
   unterminated character-string.
   Expected diagnostic: unterminated character-string. *)
program CharacterStringSpanningALineBreak(output);
begin
   {! !!SyntaxError[E1002]: unterminated character-string at 9:12!! !}
   writeln('this string is broken
            {! !!SyntaxError[E2004]: invalid syntax near 'two' at 12:20!! !}
            {! !!SyntaxError[E1002]: unterminated character-string at 12:29!! !}
            across two lines')
end.
