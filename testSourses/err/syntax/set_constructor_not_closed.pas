(* Negative test, ISO 7185 6.7.1 Set-constructors.
   A set-constructor is closed by a right square bracket.
   Expected diagnostic: right square bracket expected. *)
program SetConstructorNotClosed(output);
var
   s : set of 0..9;
begin
   s := [1, 2, 3;
   writeln(1 in s)
end.
