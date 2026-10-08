(* Negative test, ISO 7185 6.6.2 Function-declarations.
   The result-type of a function-declaration denotes a simple-type or a
   pointer-type, so a function may not return an array, a record, a set or
   a file.
   Expected diagnostic: function result type must be simple or pointer. *)
program FunctionResultTypeIsNotSimpleOrPointer(output);
type
   vector = array [1..3] of real;
   point = record x, y : real end;
   digits = set of 0..9;
var
   v : vector;
function ReturnsAnArray : vector;
var
   scratch : vector;
begin
   scratch[1] := 0.0;
   ReturnsAnArray := scratch
end;
function ReturnsARecord : point;
var
   scratch : point;
begin
   scratch.x := 0.0;
   ReturnsARecord := scratch
end;
function ReturnsASet : digits;
begin
   ReturnsASet := [1, 2]
end;
begin
   v := ReturnsAnArray;
   writeln(v[1])
end.
