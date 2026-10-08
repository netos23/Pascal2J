{ ISO 7185, 6.6.2 Function-declarations.
  A function-declaration gives a result-type that shall be a simple-type or
  a pointer-type.  Within the block of the function, at least one
  assignment-statement shall assign to the function-identifier, and after
  activation the value last assigned is the value of the function. }
program FunctionDeclarationAndResultAssignment(output);
type
   colour = (red, yellow, green, blue);
   link = ^cell;
   cell = record value : integer end;
var
   p : link;
function NoParameters : integer;
begin
   NoParameters := 42
end;
function IntegerResult(a, b : integer) : integer;
begin
   IntegerResult := a + b
end;
function RealResult(x : real) : real;
begin
   RealResult := x * x
end;
function CharResult(n : integer) : char;
begin
   CharResult := chr(n)
end;
function BooleanResult(n : integer) : Boolean;
begin
   BooleanResult := n > 0
end;
function EnumeratedResult(n : integer) : colour;
begin
   if n = 0 then
      EnumeratedResult := red
   else
      EnumeratedResult := blue
end;
function DelegatingResult(n : integer) : colour;
begin
   DelegatingResult := EnumeratedResult(n)
end;
function PointerResult(v : integer) : link;
var
   q : link;
begin
   new(q);
   q^.value := v;
   PointerResult := q
end;
function AssignedMoreThanOnce(n : integer) : integer;
begin
   AssignedMoreThanOnce := 0;
   if n > 0 then
      AssignedMoreThanOnce := n
end;
begin
   p := PointerResult(7);
   writeln(NoParameters, IntegerResult(1, 2), RealResult(2.0));
   writeln(CharResult(65), BooleanResult(1), ord(EnumeratedResult(0)));
   writeln(ord(DelegatingResult(1)), p^.value, AssignedMoreThanOnce(9));
   dispose(p)
end.
