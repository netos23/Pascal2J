{ ISO 7185, 6.10 Programs, second worked example.
  The standard gives this program as the example of copying the characters
  and the line structure of the textfile input to the textfile output.  It
  exercises eof and eoln without a file parameter, read of a char variable
  and the pairing of readln with writeln. }
program CopyText(input, output);
var
   ch : char;
   lines : integer;
begin
   lines := 0;
   while not eof do
      begin
         while not eoln do
            begin
               read(ch);
               write(ch)
            end;
         readln;
         writeln;
         lines := lines + 1
      end;
   writeln(lines, ' lines copied')
end.
