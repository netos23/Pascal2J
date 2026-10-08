{ ISO 7185, 6.9.3 The procedure write and 6.9.3.1 Write-parameters.
  A write-parameter is an expression optionally followed by a field width
  and, for a value of real-type, by a fraction length as well.  write
  accepts values of char-type, integer-type, real-type, Boolean-type and
  string-types; supplying the fraction length selects the fixed-point
  representation instead of the floating-point one. }
program WriteWithFieldWidthSpecifiers(output, report);
const
   width = 12;
var
   report : text;
   i : integer;
   x : real;
   c : char;
   b : Boolean;
   s : packed array [1..5] of char;
begin
   i := 42;
   x := 3.14159;
   c := 'z';
   b := true;
   s := 'wider';
   write(i);
   write(i : 8);
   write(i : width);
   write(i : width - 4);
   write(x);
   write(x : 12);
   write(x : 12 : 4);
   write(x : width : width div 4);
   write(c);
   write(c : 3);
   write(b);
   write(b : 6);
   write(s);
   write(s : 10);
   write('a literal string');
   write('a literal string' : 20);
   write(i + 1 : i div 10);
   write(x * 2 : width - 2 : 2 - 1);
   writeln;
   write(output, i);
   write(output, i : 4, x : 8 : 2, c : 2, b : 5, s : 7);
   writeln(output);
   rewrite(report);
   write(report, i : 4);
   write(report, x : 8 : 2);
   writeln(report, 'done')
end.
