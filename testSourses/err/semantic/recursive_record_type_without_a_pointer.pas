(* Negative test, ISO 7185 6.2.2 Scopes and 6.4.3.3 Record-types.
   A type-identifier may be used before its defining-point only as the
   domain-type of a pointer-type.  A record-type containing a field of its
   own type is therefore not admissible, and neither is an array whose
   component-type is the type being defined.
   Expected diagnostic: recursive type definition. *)
program RecursiveRecordTypeWithoutAPointer(output);
type
   cell = record
             value : integer;
             next : cell
          end;
   chain = array [1..2] of chain;
var
   c : cell;
begin
   c.value := 0;
   writeln(c.value)
end.
