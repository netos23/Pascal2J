{ ISO 7185, 6.9.1 The procedure read and 6.9.2 The procedure readln.
  read applied to a textfile accepts variables of char-type, integer-type
  or real-type; if the first parameter is a textfile it names the file,
  otherwise input is understood.  readln additionally skips to the start of
  the next line and may be written with no variables at all. }
program ReadAndReadlnFromTextfiles(input, output, source);
var
   source : text;
   c, d : char;
   i, j : integer;
   x : real;
   nonfile : file of integer;
   n : integer;
begin
   reset(source);
   read(c);
   read(c, d);
   read(i);
   read(i, j);
   read(x);
   read(c, i, x);
   read(input, c);
   read(input, c, i, x);
   read(source, c);
   read(source, i, x);
   readln;
   readln(c);
   readln(c, d);
   readln(i, x);
   readln(input);
   readln(input, c, i);
   readln(source);
   readln(source, c, x);
   reset(nonfile);
   read(nonfile, n);
   writeln(c, d, i, j, x, n)
end.
