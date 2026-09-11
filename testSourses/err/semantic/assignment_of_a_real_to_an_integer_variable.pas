(* Negative test, ISO 7185 6.4.6 Assignment-compatibility.
   An integer value is assignment-compatible with a real variable, but not
   the other way round: a real has to be converted with trunc or round.
   Expected diagnostic: real value cannot be assigned to an integer. *)
program AssignmentOfARealToAnIntegerVariable(output);
var
   i : integer;
   x : real;
begin
   x := 1.5;
   i := x;
   i := 2.0;
   writeln(i)
end.
