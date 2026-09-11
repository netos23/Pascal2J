{ ISO 7185, 6.2.2 Scopes.
  Each identifier has a defining-point in the region that is the block of
  the declaration containing it, and the scope of that defining-point is
  the region minus any enclosed region containing a defining-point for the
  same identifier.  Here inner declares its own x and its own Inner type,
  shadowing the ones declared by the program-block. }
program NestedScopesShadowOuterIdentifiers(output);
const
   scale = 1;
type
   quantity = integer;
var
   x : quantity;
   y : quantity;
procedure Outer;
   const
      scale = 10;
   var
      x : quantity;
   procedure Inner;
      const
         scale = 100;
      type
         quantity = real;
      var
         x : quantity;
      begin
         x := scale / 3.0;
         writeln(x)
      end;
   begin
      x := scale;
      Inner;
      writeln(x)
   end;
begin
   x := scale;
   y := x;
   Outer;
   writeln(x, y)
end.
