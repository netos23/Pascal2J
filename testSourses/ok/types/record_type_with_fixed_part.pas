{ ISO 7185, 6.4.3.3 Record-types.
  The field-list of a record-type may be a fixed-part of record-sections,
  each an identifier-list and a type-denoter.  Field identifiers are local
  to the record-type, so distinct records may reuse the same names.  A
  record-type may be packed and may nest other record-types. }
program RecordTypeWithFixedPart(output);
type
   angle = real;
   polar = record
              r : real;
              theta : angle
           end;
   date = record
             day : 1..31;
             month : 1..12;
             year : 1900..1999
          end;
   employee = record
                 name : packed array [1..20] of char;
                 hired : date;
                 salary : real;
                 grade, step : integer
              end;
   packedpair = packed record
                   left, right : integer
                end;
   emptyrecord = record
                 end;
var
   p : polar;
   e : employee;
   pp : packedpair;
   nothing : emptyrecord;
begin
   p.r := 1.0;
   p.theta := 0.0;
   e.name := 'Ada Lovelace       ';
   e.hired.day := 10;
   e.hired.month := 12;
   e.hired.year := 1915;
   e.salary := 1000.0;
   e.grade := 1;
   e.step := 2;
   pp.left := 1;
   pp.right := 2;
   writeln(p.r, p.theta, e.hired.year, e.salary, e.grade, pp.left, pp.right)
end.
