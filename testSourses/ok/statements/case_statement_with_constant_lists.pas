{ ISO 7185, 6.8.3.5 Case-statements.
  The case-index shall be of an ordinal type and each case-constant shall
  be of a type compatible with it.  A case-list-element may carry several
  case-constants, the elements are separated by semicolons, a semicolon may
  precede the closing end, and a case-list-element may have an empty
  statement.  A case-constant is a single constant, never a range, so
  consecutive values are written as a list.  It is an error if no
  case-constant equals the case-index. }
program CaseStatementWithConstantLists(output);
const
   two = 2;
type
   colour = (red, yellow, green, blue);
var
   i : integer;
   c : char;
   e : colour;
   b : Boolean;
begin
   i := 2;
   case i of
      1 : writeln('one');
      two : writeln('two');
      3, 4, 5 : writeln('three to five');
      6 : ;
      7 : begin
             writeln('seven');
             i := 0
          end;
      -1, -2 : writeln('negative');
   end;
   c := 'b';
   case c of
      'a', 'e', 'i', 'o', 'u' : writeln('vowel');
      'b' : writeln('the letter b');
      'c', 'd' : writeln('a case-constant list, not a range')
   end;
   e := green;
   case e of
      red : i := 0;
      yellow, green : i := 1;
      blue : i := 2
   end;
   b := true;
   case b of
      false : writeln('false');
      true : writeln('true')
   end;
   case i + 1 of
      1 : case i of
             0 : writeln('nested zero');
             1 : writeln('nested one')
          end;
      2 : writeln('two')
   end;
   writeln(i)
end.
