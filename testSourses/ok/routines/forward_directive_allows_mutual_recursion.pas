{ ISO 7185, 6.6.1 and 6.6.2 Procedure- and function-declarations.
  A procedure-heading or function-heading followed by the directive forward
  declares the identifier and its parameters without a block; the block is
  supplied by a later procedure-identification or function-identification,
  which repeats only the identifier.  This is what permits two routines to
  activate each other. }
program ForwardDirectiveAllowsMutualRecursion(output);
var
   n : integer;
function IsEven(k : integer) : Boolean;
   forward;
function IsOdd(k : integer) : Boolean;
begin
   if k = 0 then
      IsOdd := false
   else
      IsOdd := IsEven(k - 1)
end;
function IsEven;
begin
   if k = 0 then
      IsEven := true
   else
      IsEven := IsOdd(k - 1)
end;
procedure Pong(k : integer);
   forward;
procedure Ping(k : integer);
begin
   if k > 0 then
      begin
         write('ping');
         Pong(k - 1)
      end
end;
procedure Pong;
begin
   if k > 0 then
      begin
         write('pong');
         Ping(k - 1)
      end
end;
begin
   for n := 0 to 4 do
      writeln(n, IsEven(n), IsOdd(n));
   Ping(6);
   writeln
end.
