(* Negative test, ISO 7185 6.5.1 and 6.7.3.
   A function-designator yields a value, not a variable-access, so its
   result may not be dereferenced, indexed or field-selected in place; the
   result has to be assigned to a variable first.
   Expected diagnostic: pointer symbol cannot follow a function-designator. *)
program DereferenceOfAFunctionResult(output);
type
   link = ^cell;
   cell = record value : integer end;
var
   total : integer;
function MakeCell(n : integer) : link;
var
   q : link;
begin
   new(q);
   q^.value := n;
   MakeCell := q
end;
begin
   total := MakeCell(7)^.value;
   writeln(total)
end.
