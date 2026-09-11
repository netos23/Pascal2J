(* Negative test, ISO 7185 6.8.2.2 Assignment-statements.
   An assignment-statement uses the assignment symbol; the equals symbol is
   the relational operator and, in a constant-definition, the definition
   symbol.
   Expected diagnostic: assignment symbol expected. *)
program AssignmentWrittenWithTheEqualsSymbol(output);
var
   i : integer;
begin
   i = 1;
   writeln(i)
end.
