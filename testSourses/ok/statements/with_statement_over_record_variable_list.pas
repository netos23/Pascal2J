{ ISO 7185, 6.8.3.10 With-statements.
  A with-statement opens a new scope in which the field-identifiers of each
  record-variable may be written alone.  A record-variable-list of several
  variables is equivalent to nested with-statements, so a later record
  shadows the field-identifiers of an earlier one.  The record-variables
  are evaluated once, on entry to the with-statement. }
program WithStatementOverRecordVariableList(output);
type
   inner = record
              common : integer;
              onlyinner : integer
           end;
   outer = record
              common : integer;
              onlyouter : integer;
              nested : inner
           end;
   list = array [1..3] of outer;
var
   a : outer;
   b : inner;
   items : list;
   p : ^outer;
   i : integer;
begin
   with a do
      begin
         common := 1;
         onlyouter := 2
      end;
   with a.nested do
      begin
         common := 3;
         onlyinner := 4
      end;
   with a, a.nested do
      begin
         common := 5;
         onlyouter := 6;
         onlyinner := 7
      end;
   with a do
      with nested do
         common := 8;
   b.common := 9;
   with a, b do
      common := 10;
   for i := 1 to 3 do
      with items[i] do
         begin
            common := i;
            onlyouter := i * i;
            with nested do
               onlyinner := i + i
         end;
   new(p);
   with p^ do
      begin
         common := 11;
         with nested do
            onlyinner := 12
      end;
   with p^, p^.nested do
      common := 13;
   writeln(a.common, a.nested.common, b.common, items[3].onlyouter);
   writeln(p^.common, p^.nested.common, p^.nested.onlyinner);
   dispose(p)
end.
