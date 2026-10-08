{ ISO 7185, 6.5.4 Identified-variables and 6.5.5 Buffer-variables.
  The pointer symbol after a pointer-variable denotes the variable
  identified by that pointer, and after a file-variable denotes the buffer
  variable of that file.  Both may be chained with indexing and field
  selection to reach any component. }
program IdentifiedAndBufferVariableAccess(output);
type
   link = ^cell;
   cell = record
             value : integer;
             row : array [1..3] of real;
             next : link
          end;
   handle = ^link;
   entry = record
              key : integer;
              payload : array [1..2] of char
           end;
var
   head, second : link;
   indirect : handle;
   store : file of entry;
   letters : file of char;
begin
   new(head);
   new(second);
   head^.value := 1;
   head^.row[2] := 2.5;
   head^.next := second;
   second^.value := 2;
   second^.next := nil;
   head^.next^.value := 3;
   head^.next^.row[1] := 1.5;
   new(indirect);
   indirect^ := head;
   indirect^^.value := 4;
   indirect^^.next^.value := 5;
   rewrite(store);
   store^.key := 1;
   store^.payload[1] := 'a';
   store^.payload[2] := 'b';
   put(store);
   rewrite(letters);
   letters^ := 'z';
   put(letters);
   writeln(head^.value, head^.row[2], head^.next^.value, indirect^^.value);
   dispose(second);
   dispose(head);
   dispose(indirect)
end.
