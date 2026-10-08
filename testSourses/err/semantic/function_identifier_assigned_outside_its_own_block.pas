(* Negative test, ISO 7185 6.6.2 Function-declarations and 6.8.2.2.
   The function-identifier on the left of an assignment-statement shall be
   the identifier of the function whose block contains that statement.  In
   a block other than its own, a function-identifier can only be used to
   activate the function.
   Expected diagnostic: function identifier assigned outside its block. *)
program FunctionIdentifierAssignedOutsideItsOwnBlock(output);
var
   i : integer;
function Outer : integer;
   function Inner : integer;
   begin
      Inner := 1;
      Outer := 2
   end;
begin
   Outer := Inner
end;
begin
   i := Outer;
   Outer := 3;
   writeln(i)
end.
