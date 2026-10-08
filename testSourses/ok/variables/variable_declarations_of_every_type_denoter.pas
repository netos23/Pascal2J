{ ISO 7185, 6.5.1 Variable-declarations.
  Each identifier of the identifier-list of a variable-declaration denotes
  a distinct variable of the type denoted by the type-denoter.  A
  type-denoter may be a type-identifier or a new-type written in place. }
program VariableDeclarationsOfEveryTypeDenoter(output);
type
   colour = (red, yellow, green, blue);
   vector = array [1..3] of real;
var
   byidentifier : vector;
   sharingaline, andanother, andathird : integer;
   newenumerated : (alpha, beta, gamma);
   newsubrange : 1..10;
   newarray : array [1..2] of char;
   newrecord : record a, b : integer end;
   newset : set of colour;
   newfile : file of integer;
   newpointer : ^integer;
   packednew : packed array [1..4] of Boolean;
begin
   byidentifier[1] := 1.0;
   sharingaline := 1;
   andanother := 2;
   andathird := 3;
   newenumerated := beta;
   newsubrange := 10;
   newarray[1] := 'p';
   newrecord.a := 1;
   newrecord.b := 2;
   newset := [red, blue];
   rewrite(newfile);
   new(newpointer);
   newpointer^ := 0;
   packednew[4] := true;
   writeln(byidentifier[1], sharingaline + andanother + andathird);
   writeln(ord(newenumerated), newsubrange, newarray[1], newrecord.a);
   writeln(newpointer^, packednew[4], red in newset);
   dispose(newpointer)
end.
