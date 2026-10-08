{ ISO 7185, 6.4.3.5 File-types.
  A file-type has a component-type that shall not be a file-type nor
  contain one.  Every file variable has an associated buffer-variable
  denoted by the file variable followed by the pointer symbol.  The
  required type text denotes a file of char with a line structure. }
program FileTypeAndTextType(input, output, numbers, records, characters);
type
   charsequence = file of char;
   fileofinteger = file of integer;
   reading = record
                station : integer;
                value : real
             end;
   fileofrecords = file of reading;
   packedfile = packed file of char;
var
   numbers : fileofinteger;
   records : fileofrecords;
   characters : charsequence;
   compact : packedfile;
   t : text;
   r : reading;
begin
   rewrite(numbers);
   numbers^ := 42;
   put(numbers);
   reset(numbers);
   writeln(numbers^, eof(numbers));
   rewrite(records);
   r.station := 1;
   r.value := 2.5;
   records^ := r;
   put(records);
   rewrite(characters);
   characters^ := 'x';
   put(characters);
   rewrite(compact);
   rewrite(t);
   writeln(t, 'a line of text');
   writeln(eof(t))
end.
