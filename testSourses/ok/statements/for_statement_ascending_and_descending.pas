{ ISO 7185, 6.8.3.9 For-statements.
  The control-variable shall be an entire-variable declared in the block
  containing the for-statement and of an ordinal type; the initial-value
  and final-value shall be assignment-compatible with it.  to counts up and
  downto counts down; both bounds are evaluated once, before the loop, and
  if the range is empty the body is not executed at all.  After the loop
  the control-variable is undefined. }
program ForStatementAscendingAndDescending(output);
type
   colour = (red, yellow, green, blue);
var
   i, j, n, sum : integer;
   c : char;
   e : colour;
   b : Boolean;
   table : array [1..3, 1..3] of integer;
begin
   sum := 0;
   for i := 1 to 10 do
      sum := sum + i;
   for i := 10 downto 1 do
      sum := sum - i;
   for i := 1 to 0 do
      writeln('an empty range is never entered');
   for i := 0 downto 1 do
      writeln('nor is an empty descending range');
   n := 3;
   for i := 1 to n do
      for j := n downto 1 do
         table[i, j] := i * j;
   for i := 1 to n do
      begin
         for j := 1 to n do
            write(table[i, j]);
         writeln
      end;
   for c := 'a' to 'e' do
      write(c);
   writeln;
   for e := red to blue do
      write(ord(e));
   writeln;
   for b := false to true do
      write(b);
   writeln;
   for i := sum + 1 to sum + n do
      sum := sum + i;
   for i := 1 to n do
      if odd(i) then
         sum := sum + 1
      else
         sum := sum - 1;
   writeln(sum)
end.
