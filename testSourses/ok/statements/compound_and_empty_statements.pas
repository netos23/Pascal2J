{ ISO 7185, 6.8.3.2 Compound-statements and 6.8.1 Statements.
  A compound-statement is a statement-sequence bracketed by begin and end.
  A statement may be empty, so a statement-sequence may contain empty
  statements between semicolons, a semicolon may precede the closing end,
  and a compound-statement may itself be empty. }
program CompoundAndEmptyStatements(output);
var
   i : integer;
begin
   begin
   end;
   begin
      ;
   end;
   ;
   ;;
   i := 1;
   begin
      i := 2;
      begin
         i := 3;
         begin
            i := 4
         end
      end;
   end;
   if i = 4 then
   else
      ;
   while false do
      ;
   writeln(i);
   ;
end.
