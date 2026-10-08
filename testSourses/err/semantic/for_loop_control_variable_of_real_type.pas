(* Negative test, ISO 7185 6.8.3.9 For-statements.
   The control-variable of a for-statement is an entire-variable of an
   ordinal type, so a real variable may not control a loop.
   Expected diagnostic: ordinal control variable expected. *)
program ForLoopControlVariableOfRealType(output);
var
   x : real;
begin
   for x := 1.0 to 10.0 do
      writeln(x)
end.
