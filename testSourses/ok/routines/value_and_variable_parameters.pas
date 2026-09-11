{ ISO 7185, 6.6.3.2 Value parameters and 6.6.3.3 Variable parameters.
  A value parameter is a local variable initialised from the actual
  parameter, which may be any assignment-compatible expression.  A variable
  parameter, introduced by var, denotes the actual parameter itself, which
  shall be a variable-access, so assignments to it are seen by the caller. }
program ValueAndVariableParameters(output);
type
   vector = array [1..3] of real;
   point = record x, y : real end;
var
   i, j : integer;
   v : vector;
   p : point;
procedure ByValue(n : integer);
begin
   n := n + 1
end;
procedure ByReference(var n : integer);
begin
   n := n + 1
end;
procedure Swap(var a, b : integer);
var
   t : integer;
begin
   t := a;
   a := b;
   b := t
end;
procedure StructuredParameters(byvalue : vector; var byreference : vector);
begin
   byvalue[1] := 0.0;
   byreference[1] := 99.0
end;
procedure RecordParameters(byvalue : point; var byreference : point);
begin
   byvalue.x := 0.0;
   byreference.x := 99.0
end;
procedure MixedSections(a : integer; var b : integer; c, d : integer;
                        var e, f : integer);
begin
   b := a + c + d;
   e := b;
   f := b
end;
begin
   i := 1;
   ByValue(i);
   ByValue(i + 1);
   ByReference(i);
   j := 2;
   Swap(i, j);
   v[1] := 1.0;
   StructuredParameters(v, v);
   p.x := 1.0;
   RecordParameters(p, p);
   MixedSections(1, i, 2, 3, i, j);
   writeln(i, j, v[1], p.x)
end.
