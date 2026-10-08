{ ISO 7185, 6.8.2.3 Procedure-statements.
  A procedure-statement names a procedure and, unless the procedure has no
  formal parameters, supplies an actual-parameter-list.  The required
  procedures read, readln, write, writeln, page, new, dispose, pack,
  unpack, get, put, reset and rewrite have their own parameter forms. }
program ProcedureStatementParameterForms(input, output);
type
   loose = array [1..4] of char;
   tight = packed array [1..2] of char;
var
   i, j : integer;
   u : loose;
   t : tight;
   p : ^integer;
   f : file of integer;
procedure Nothing;
begin
end;
procedure One(a : integer);
begin
   i := a
end;
procedure Several(a : integer; var b : integer; c : char; d : real);
begin
   b := a + ord(c) + trunc(d)
end;
begin
   Nothing;
   One(1);
   One(i + j);
   Several(1, i, 'a', 1.0);
   Several(i, j, u[1], i / 2);
   new(p);
   dispose(p);
   pack(u, 1, t);
   unpack(t, u, 1);
   rewrite(f);
   f^ := 1;
   put(f);
   reset(f);
   i := f^;
   get(f);
   write(i);
   write(output, i);
   writeln;
   writeln(output);
   writeln(i, j);
   page;
   page(output)
end.
