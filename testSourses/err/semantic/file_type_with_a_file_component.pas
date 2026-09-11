(* Negative test, ISO 7185 6.4.3.5 File-types.
   The component-type of a file-type shall neither be a file-type nor
   contain one, so neither a file of files nor a file of records with a
   file field is allowed.
   Expected diagnostic: component type of a file may not contain a file. *)
program FileTypeWithAFileComponent(output);
type
   inner = file of integer;
   offiles = file of inner;
   wrapper = record
                tag : integer;
                contents : inner
             end;
   ofwrappers = file of wrapper;
var
   a : offiles;
   b : ofwrappers;
begin
   writeln('unreachable')
end.
