{ ISO 7185, 6.6.1 Procedure-declarations and 6.8.2.3 Procedure-statements.
  A procedure-declaration associates an identifier with a block.  A
  procedure may have no formal-parameter-list, may declare local entities,
  and may be nested inside another procedure, in which case it may use the
  entities of every enclosing block. }
program ProcedureDeclarationAndActivation(output);
var
   total : integer;
procedure NoParameters;
begin
   total := 0
end;
procedure AddOne(n : integer);
begin
   total := total + n
end;
procedure Outer(start : integer);
var
   local : integer;
   procedure Inner(step : integer);
   begin
      local := local + step;
      total := total + local
   end;
begin
   local := start;
   Inner(1);
   Inner(2);
   Inner(3)
end;
begin
   NoParameters;
   AddOne(5);
   AddOne(total);
   Outer(10);
   writeln(total)
end.
