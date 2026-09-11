(* Negative test, ISO 7185 6.5.3.2 Indexed-variables.
   The index-expression of an indexed-variable shall be assignment-
   compatible with the index-type of the array-type, and the number of
   index-expressions shall match the number of index-types.
   Expected diagnostic: index expression of the wrong type; too many
   index expressions. *)
program ArrayIndexedWithAnExpressionOfTheWrongType(output);
type
   vector = array [1..3] of integer;
   plane = array [1..3, 1..3] of integer;
var
   v : vector;
   p : plane;
begin
   v['a'] := 1;
   v[1.0] := 2;
   p[1, 2, 3] := 3;
   v[1, 2] := 4;
   writeln(v[1])
end.
