{ ISO 7185, 6.10 Programs.
  A program is a program-heading, a semicolon, a program-block and a
  terminating full stop.  The program-parameter-list is optional; the
  identifiers in it are distinct and each has a defining-point as a
  variable-identifier for the program-block, so every parameter other than
  the required input and output shall also be declared in the
  variable-declaration-part. }
program ProgramHeadingWithAndWithoutParameters(input, output, data, listing);
var
   data : file of integer;
   listing : text;
   i : integer;
begin
   rewrite(data);
   rewrite(listing);
   i := 0;
   writeln(listing, i);
   writeln(output, i);
   writeln(eof(input), eof(data))
end.
