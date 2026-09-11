program UnterminatedComment(output);
(* Negative test, ISO 7185 6.1.8 Token separators.
   A commentary shall be closed before the end of the source.  The
   commentary opened below is never closed, so the remainder of the
   program, including its terminating full stop, is swallowed by it.
   Expected diagnostic: unterminated commentary, unexpected end of file. *)
var
   i : integer;
begin
   i := 1;
   (* this commentary is never closed and runs to the end of the file
   writeln(i)
end.
