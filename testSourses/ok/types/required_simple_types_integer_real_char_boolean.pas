{ ISO 7185, 6.4.2.2 Required simple-types.
  The required type-identifiers integer, real, char and Boolean denote the
  four required simple-types.  integer and Boolean and char are ordinal;
  real is not.  Boolean has the ordered values false and true. }
program RequiredSimpleTypesIntegerRealCharBoolean(output);
var
   i : integer;
   r : real;
   c : char;
   b : Boolean;
begin
   i := maxint;
   i := -maxint;
   i := 0;
   r := 1.0;
   r := i;
   c := 'c';
   b := false;
   b := true;
   b := b and (false or true) and not b;
   b := ord(c) > 0;
   b := chr(65) = 'A';
   writeln(i, r, c, b, ord(false), ord(true), succ(false), pred(true))
end.
