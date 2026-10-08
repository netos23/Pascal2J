{ ISO 7185, 6.10 Programs, first worked example.
  The standard gives this program as the example of copying a file of real
  by means of get, put and the buffer-variables of the two files.  reset
  makes the first component of f available in the buffer-variable of f, and
  rewrite empties g ready for put. }
program Copy(f, g);
var
   f, g : file of real;
begin
   reset(f);
   rewrite(g);
   while not eof(f) do
      begin
         g^ := f^;
         get(f);
         put(g)
      end
end.
