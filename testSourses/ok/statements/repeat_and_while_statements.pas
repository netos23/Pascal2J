{ ISO 7185, 6.8.3.7 Repeat-statements and 6.8.3.8 While-statements.
  A repeat-statement encloses a statement-sequence, so it needs no
  compound-statement and may end with a semicolon before until; its body is
  executed at least once.  A while-statement controls a single statement
  and tests before each execution, so its body may not run at all.  Both
  expressions shall be of Boolean type. }
program RepeatAndWhileStatements(output);
var
   i, j, sum : integer;
   done : Boolean;
begin
   i := 0;
   repeat
      i := i + 1
   until i = 5;
   i := 0;
   repeat
      i := i + 1;
      sum := sum + i;
   until i >= 10;
   repeat
   until true;
   done := false;
   repeat
      repeat
         done := true
      until done
   until done;
   i := 0;
   while i < 5 do
      i := i + 1;
   while false do
      writeln('never');
   sum := 0;
   i := 1;
   while i <= 10 do
      begin
         j := 1;
         while j <= i do
            begin
               sum := sum + j;
               j := j + 1
            end;
         i := i + 1
      end;
   while not done do
      ;
   writeln(i, j, sum, done)
end.
