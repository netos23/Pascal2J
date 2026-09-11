{ ISO 7185, 6.1.7 Character-strings.
  An apostrophe inside a character-string is written as two apostrophes.
  A string of length one is a character-string of one string-element and
  denotes a value of the char-type. }
program CharacterStringsWithDoubledQuotes(output);
const
   greeting = 'hello, world';
   possessive = 'it''s a string';
   justquotes = '''';
   singlechar = 'A';
   spaces = '   ';
   punctuation = '+-*/<>=[].,():;^@#$%&';
var
   c : char;
   line : packed array [1..12] of char;
begin
   c := 'Q';
   line := greeting;
   writeln(possessive);
   writeln(justquotes);
   writeln(singlechar, spaces, punctuation, c, line)
end.
