{ ISO 7185, 6.1.2 Special-symbols and 6.1.9 Lexical alternatives.
  Exercises every special-symbol the language defines: the arithmetic and
  relational operators, the separators, the subrange symbol .. and the
  pointer symbol ^ . }
program SpecialSymbolsAndTheirAlternatives(output);
type
   smallrange = 1..10;
   digitset = set of 0..9;
   link = ^cell;
   cell = record
             value : integer;
             next : link
          end;
var
   a, b : integer;
   ok : Boolean;
   s : digitset;
   n : smallrange;
   p : link;
begin
   a := 6;
   b := 3;
   a := a + b - b * b div b;
   ok := (a = b) or (a <> b) or (a < b) or (a > b) or (a <= b) or (a >= b);
   s := [1, 3, 5..7];
   ok := ok and (4 in s) and not (a in s);
   n := 10;
   new(p);
   p^.value := n;
   p^.next := nil;
   writeln(a, b, ok, p^.value);
   dispose(p)
end.
