{ ISO 7185, 6.5.3.3 Field-designators.
  A field-designator names a field of a record-variable, either by a
  record-variable followed by the field-identifier or, within a
  with-statement, by the field-designator-identifier alone. }
program FieldDesignatorsAndWithStatementAccess(output);
type
   date = record
             day, month, year : integer
          end;
   address = record
                street : packed array [1..10] of char;
                number : integer
             end;
   person = record
               born : date;
               lives : address;
               height : real
            end;
var
   p : person;
   people : array [1..3] of person;
   i : integer;
begin
   p.born.day := 1;
   p.born.month := 2;
   p.born.year := 1970;
   p.lives.number := 10;
   p.height := 1.8;
   with p do
      begin
         height := 1.9;
         with born do
            year := 1971;
         with lives do
            number := 11
      end;
   with p.born, p.lives do
      begin
         day := 2;
         number := 12
      end;
   for i := 1 to 3 do
      with people[i], people[i].born do
         begin
            height := i;
            year := 1900 + i
         end;
   writeln(p.born.year, p.born.day, p.lives.number, p.height);
   writeln(people[3].born.year, people[3].height)
end.
