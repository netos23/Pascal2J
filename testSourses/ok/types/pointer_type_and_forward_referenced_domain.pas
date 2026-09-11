{ ISO 7185, 6.4.4 Pointer-types and 6.2.2 Scopes.
  A pointer-type is the pointer symbol followed by a domain-type.  The
  domain-type may be an identifier whose defining-point comes later in the
  same type-definition-part, which is what makes recursive data structures
  possible.  The value nil belongs to every pointer-type. }
program PointerTypeAndForwardReferencedDomain(output);
type
   link = ^cell;
   cell = record
             value : integer;
             next : link
          end;
   treeptr = ^node;
   node = record
             key : integer;
             left, right : treeptr
          end;
   pointertosimple = ^integer;
   pointertoarray = ^vector;
   vector = array [1..3] of real;
var
   head, p : link;
   root : treeptr;
   i : pointertosimple;
   v : pointertoarray;
begin
   head := nil;
   new(p);
   p^.value := 1;
   p^.next := head;
   head := p;
   new(root);
   root^.key := 0;
   root^.left := nil;
   root^.right := nil;
   new(i);
   i^ := 5;
   new(v);
   v^[1] := 1.0;
   writeln(head^.value, root^.key, i^, v^[1], head^.next = nil);
   dispose(v);
   dispose(i);
   dispose(root);
   dispose(head)
end.
