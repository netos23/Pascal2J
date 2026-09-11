{ ISO 7185, 6.8.3.4 If-statements.
  The expression of an if-statement shall be of Boolean type.  An else-part
  is matched with the nearest preceding otherwise unmatched then, so in
  NestedWithoutBraces below the else belongs to the inner if.  No semicolon
  may precede else, which is why the then-parts here are either single
  statements or compound-statements. }
program IfStatementAndDanglingElse(output);
var
   a, b, c : integer;
begin
   a := 1;
   b := 2;
   c := 3;
   if a < b then
      writeln('then only');
   if a > b then
      writeln('taken')
   else
      writeln('else taken');
   if a < b then
      if b < c then
         writeln('inner then')
      else
         writeln('belongs to the inner if');
   if a < b then
      begin
         if b < c then
            writeln('inner then')
      end
   else
      writeln('belongs to the outer if');
   if a = 1 then
      writeln('one')
   else if a = 2 then
      writeln('two')
   else if a = 3 then
      writeln('three')
   else
      writeln('many');
   if (a < b) and (b < c) or not (a = c) then
      begin
         a := a + 1;
         b := b + 1
      end
   else
      begin
         a := a - 1
      end;
   if a < b then
   else
      writeln('empty then-part');
   writeln(a, b, c)
end.
