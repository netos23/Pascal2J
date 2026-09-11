(* Negative test, ISO 7185 6.6.6 Required functions and 6.9 Input and output.
   The required functions and procedures constrain the types of their
   parameters: chr and odd take an integer, ord and succ take an ordinal
   value, eoln takes a textfile, and write on a textfile accepts only
   char, integer, real, Boolean and string values.
   Expected diagnostic: required routine applied to the wrong type. *)
program RequiredIdentifierUsedWithTheWrongArguments(output);
type
   point = record x, y : real end;
   vector = array [1..3] of integer;
var
   i : integer;
   x : real;
   b : Boolean;
   c : char;
   p : point;
   v : vector;
   f : file of integer;
begin
   i := 0;
   x := 1.5;
   c := chr(x);
   i := ord(x);
   b := odd(x);
   x := succ(x);
   b := eoln(f);
   writeln(p);
   writeln(v);
   writeln(f);
   write(i : x);
   write(i : 4 : 2)
end.
