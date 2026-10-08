(* Negative test, ISO 7185 6.6.3.6 Parameter list congruity.
   The actual parameter corresponding to a procedural or functional
   parameter shall have a formal-parameter-list congruous with that of the
   formal parameter: the same number of sections, the same kinds of
   parameter, the same types, and for a function the same result-type.
   Expected diagnostic: parameter lists are not congruous. *)
program ParameterListsAreNotCongruous(output);
var
   r : real;
function TwoArguments(a, b : real) : real;
begin
   TwoArguments := a + b
end;
function WrongResultType(x : real) : integer;
begin
   WrongResultType := trunc(x)
end;
function WrongParameterKind(var x : real) : real;
begin
   WrongParameterKind := x
end;
procedure NotAFunction(x : real);
begin
   writeln(x)
end;
function Apply(function f(x : real) : real; v : real) : real;
begin
   Apply := f(v)
end;
begin
   r := Apply(TwoArguments, 1.0);
   r := Apply(WrongResultType, 1.0);
   r := Apply(WrongParameterKind, 1.0);
   r := Apply(NotAFunction, 1.0);
   writeln(r)
end.
