{ An integration test: an ordered binary tree of names.
  Combines a pointer-type with a forward-referenced domain, a record with a
  string field, recursion, var parameters of pointer type, new and dispose,
  a with-statement and a case-statement.
  ISO 7185 clauses 6.4.4, 6.5.4, 6.6.3.3, 6.6.5.3, 6.8.3.5 and 6.8.3.10. }
program BinarySearchTree(output);
const
   namelength = 12;
type
   name = packed array [1..namelength] of char;
   treeptr = ^node;
   node = record
             key : name;
             count : integer;
             left, right : treeptr
          end;
   ordering = (less, equal, greater);
var
   root : treeptr;
   total : integer;
function Compare(a, b : name) : ordering;
begin
   if a < b then
      Compare := less
   else if a = b then
      Compare := equal
   else
      Compare := greater
end;
procedure Insert(var t : treeptr; k : name);
begin
   if t = nil then
      begin
         new(t);
         with t^ do
            begin
               key := k;
               count := 1;
               left := nil;
               right := nil
            end
      end
   else
      case Compare(k, t^.key) of
         less : Insert(t^.left, k);
         equal : t^.count := t^.count + 1;
         greater : Insert(t^.right, k)
      end
end;
procedure InOrder(t : treeptr; var visited : integer);
begin
   if t <> nil then
      with t^ do
         begin
            InOrder(left, visited);
            writeln(key, count : 4);
            visited := visited + 1;
            InOrder(right, visited)
         end
end;
procedure Release(var t : treeptr);
begin
   if t <> nil then
      begin
         Release(t^.left);
         Release(t^.right);
         dispose(t);
         t := nil
      end
end;
begin
   root := nil;
   Insert(root, 'pascal      ');
   Insert(root, 'algol       ');
   Insert(root, 'simula      ');
   Insert(root, 'pascal      ');
   Insert(root, 'modula      ');
   total := 0;
   InOrder(root, total);
   writeln(total : 1, ' distinct names');
   Release(root);
   writeln(root = nil)
end.
