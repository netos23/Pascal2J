(* Negative test, ISO 7185 6.1.6 Labels and 6.8.2.4 Goto-statements.
   A label is an unsigned-integer; an identifier is not a label.
   Expected diagnostic: unsigned-integer expected after goto. *)
program GotoWithAnIdentifierLabel(output);
{! !!SyntaxError[E2003]: unexpected 'done' at 6:7!! !}
label done;
var
   i : integer;
begin
   i := 0;
   {! !!SyntaxError[E2003]: unexpected 'done' at 12:9!! !}
   goto done;
{! !!SyntaxError[E2003]: unexpected ':' at 14:5!! !}
done:
   writeln(i)
end.
