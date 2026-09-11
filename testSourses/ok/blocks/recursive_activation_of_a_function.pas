{ ISO 7185, 6.2.3 Activations.
  A procedure or function may be activated from within its own block; each
  activation creates a fresh set of the variables local to that block.
  Factorial is directly recursive, Ackermann is doubly recursive. }
program RecursiveActivationOfAFunction(output);
var
   n : integer;
function Factorial(k : integer) : integer;
begin
   if k <= 1 then
      Factorial := 1
   else
      Factorial := k * Factorial(k - 1)
end;
function Ackermann(m, n : integer) : integer;
begin
   if m = 0 then
      Ackermann := n + 1
   else if n = 0 then
      Ackermann := Ackermann(m - 1, 1)
   else
      Ackermann := Ackermann(m - 1, Ackermann(m, n - 1))
end;
begin
   for n := 0 to 6 do
      writeln(n, Factorial(n));
   writeln(Ackermann(2, 3))
end.
