{ ISO 7185, 6.1.3 Identifiers and 6.1.9 Lexical alternatives.
  Letters have no inherent case: BEGIN, Begin and begin are the same
  word-symbol, and Counter, counter and COUNTER denote the same variable.
  Identifiers are of unlimited length and every character is significant. }
PROGRAM IdentifiersAreCaseInsensitive(output);
VAR
   Counter : integer;
   aVeryLongIdentifierMadeOfLettersAndDigits0123456789 : integer;
Begin
   counter := 1;
   COUNTER := Counter + 1;
   AVeryLongIdentifierMadeOfLettersAndDigits0123456789 := COUNTER;
   WriteLn(aVeryLongIdentifierMadeOfLettersAndDigits0123456789)
END.
