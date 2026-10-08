{ ISO 7185, 6.6.6.5 Boolean functions and 6.6.5.2 File handling procedures.
  odd yields whether an integer is odd; eof and eoln inspect the state of a
  file, and both may be written without a parameter, in which case they
  apply to input.  eoln applies only to a textfile. }
program RequiredBooleanAndFilePredicates(input, output, data);
var
   data : file of integer;
   log : text;
   n : integer;
   b : Boolean;
begin
   b := odd(3);
   b := odd(-3) and not odd(4);
   rewrite(data);
   data^ := 1;
   put(data);
   reset(data);
   b := b and not eof(data);
   n := data^;
   get(data);
   b := b and eof(data);
   rewrite(log);
   writeln(log, 'one line');
   reset(log);
   b := b and not eof(log) and not eoln(log);
   b := b and not eof and not eoln;
   writeln(b, n, odd(n), eof(data), eoln(log))
end.
