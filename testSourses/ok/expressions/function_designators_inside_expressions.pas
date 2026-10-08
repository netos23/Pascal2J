{ ISO 7185, 6.7.3 Function-designators.
  A function-designator activates a function and yields its value; it may
  appear as a factor wherever a value of its result-type is required, may
  be nested as an actual parameter of another function-designator, and a
  function with no formal parameters is written as its identifier alone.
  A function-designator is not a variable-access, so its result cannot be
  indexed, selected or dereferenced in place; the result of MakeCell is
  therefore assigned to a pointer variable before being dereferenced. }
program FunctionDesignatorsInsideExpressions(output);
type
   link = ^cell;
   cell = record value : integer end;
var
   total : integer;
   p : link;
function Zero : integer;
begin
   Zero := 0
end;
function Identity(n : integer) : integer;
begin
   Identity := n
end;
function Add(a, b : integer) : integer;
begin
   Add := a + b
end;
function Scale(x : real) : real;
begin
   Scale := x * 2.0
end;
function Positive(n : integer) : Boolean;
begin
   Positive := n > 0
end;
function MakeCell(n : integer) : link;
var
   q : link;
begin
   new(q);
   q^.value := n;
   MakeCell := q
end;
begin
   total := Zero;
   total := Identity(1) + Identity(2) * Identity(3);
   total := Add(Add(1, 2), Add(3, Identity(4)));
   total := Add(total, trunc(Scale(1.5)));
   total := abs(Add(-total, Zero));
   if Positive(total) and (Identity(total) = total) then
      total := Add(total, ord(Positive(Zero)));
   p := MakeCell(Identity(total));
   total := p^.value;
   writeln(total, Scale(Identity(2)), Positive(Zero));
   dispose(p)
end.
