(* Negative test, ISO 7185 6.1.6 Labels and 6.8.2.4 Goto-statements.
   A label is an unsigned-integer; an identifier is not a label.
   Expected diagnostic: unsigned-integer expected after goto. *)
program GotoWithAnIdentifierLabel(output);
label done;
var
   i : integer;
begin
   i := 0;
   goto done;
done:
   writeln(i)
end.
