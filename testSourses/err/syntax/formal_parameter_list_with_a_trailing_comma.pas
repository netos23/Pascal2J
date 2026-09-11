(* Negative test, ISO 7185 6.6.3.1 Parameters.
   The identifier-list of a formal-parameter-section has no trailing
   separator, and the sections themselves are separated by semicolons.
   Expected diagnostic: identifier expected after the comma. *)
program FormalParameterListWithATrailingComma(output);
procedure Report(a, b, : integer);
begin
   writeln(a, b)
end;
begin
   Report(1, 2)
end.
