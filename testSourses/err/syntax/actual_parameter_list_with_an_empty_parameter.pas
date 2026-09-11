(* Negative test, ISO 7185 6.7.3 Function-designators.
   Every actual parameter of an actual-parameter-list is present; an empty
   position between two commas is not an actual parameter.
   Expected diagnostic: expression expected. *)
program ActualParameterListWithAnEmptyParameter(output);
procedure Report(a, b, c : integer);
begin
   writeln(a, b, c)
end;
begin
   Report(1, , 3)
end.
