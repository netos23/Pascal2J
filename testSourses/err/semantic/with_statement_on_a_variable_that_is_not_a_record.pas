(* Negative test, ISO 7185 6.8.3.10 With-statements.
   Every record-variable of the record-variable-list of a with-statement
   shall be a variable-access of a record-type.
   Expected diagnostic: record variable expected in the with statement. *)
program WithStatementOnAVariableThatIsNotARecord(output);
var
   i : integer;
   v : array [1..3] of integer;
begin
   i := 0;
   with i do
      writeln(i);
   with v do
      writeln('not a record');
   writeln(i)
end.
