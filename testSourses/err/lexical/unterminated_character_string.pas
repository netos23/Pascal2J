(* Negative test, ISO 7185 6.1.7 Character-strings.
   A character-string is closed by an apostrophe on the same line.  The
   string started on the marked line below is never closed, so the source
   contains no valid token for it.
   Expected diagnostic: unterminated character-string. *)
program UnterminatedCharacterString(output);
var
   s : packed array [1..5] of char;
begin
   {! !!SyntaxError[E1002]: unterminated character-string at 11:9!! !}
   s := 'abcde;
   writeln(s)
end.
