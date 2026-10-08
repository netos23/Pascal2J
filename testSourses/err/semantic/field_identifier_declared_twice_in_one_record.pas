(* Negative test, ISO 7185 6.4.3.3 Record-types.
   The field-identifiers of a record-type, including those of its variants
   and of its tag-field, are all in one scope and shall be distinct.
   Expected diagnostic: field identifier already declared in this record. *)
program FieldIdentifierDeclaredTwiceInOneRecord(output);
type
   sex = (male, female);
   person = record
               age : integer;
               age : real;
               case s : sex of
                  male : (shared : Boolean);
                  female : (shared : integer)
            end;
var
   p : person;
begin
   p.age := 0;
   writeln(p.age)
end.
