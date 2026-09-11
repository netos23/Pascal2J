{ ISO 7185, 6.6.3.4 Procedural parameters and 6.6.3.5 Functional parameters.
  A formal parameter may itself be a procedure or a function, written as a
  procedure-heading or function-heading in the formal-parameter-list.  The
  corresponding actual parameter shall be a procedure- or function-
  identifier whose parameter list is congruous with the formal one, and may
  itself be a formal procedural or functional parameter. }
program ProceduralAndFunctionalParameters(output);
var
   sum : real;
function Square(x : real) : real;
begin
   Square := x * x
end;
function Cube(x : real) : real;
begin
   Cube := x * x * x
end;
procedure ReportInteger(n : integer);
begin
   writeln(n)
end;
function Integrate(function f(x : real) : real; lo, hi : real;
                   steps : integer) : real;
var
   i : integer;
   width, acc : real;
begin
   width := (hi - lo) / steps;
   acc := 0.0;
   for i := 0 to steps - 1 do
      acc := acc + f(lo + i * width) * width;
   Integrate := acc
end;
procedure ApplyToRange(procedure report(n : integer); lo, hi : integer);
var
   i : integer;
begin
   for i := lo to hi do
      report(i)
end;
procedure PassesItsOwnParameterOn(function g(x : real) : real);
begin
   sum := sum + Integrate(g, 0.0, 1.0, 10)
end;
procedure TakesBoth(procedure p(n : integer); function q(x : real) : real);
begin
   p(1);
   sum := sum + q(2.0)
end;
begin
   sum := 0.0;
   sum := Integrate(Square, 0.0, 1.0, 100);
   sum := sum + Integrate(Cube, 0.0, 1.0, 100);
   ApplyToRange(ReportInteger, 1, 3);
   PassesItsOwnParameterOn(Square);
   TakesBoth(ReportInteger, Cube);
   writeln(sum)
end.
