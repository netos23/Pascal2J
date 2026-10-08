{ An integration test: matrix arithmetic and set algebra side by side.
  Combines conformant array parameters, a two-dimensional array, nested
  for-statements, set-constructors with computed bounds, the set operators
  and a function returning a Boolean.
  ISO 7185 clauses 6.4.3.2, 6.4.3.4, 6.6.3.7, 6.7.2.4 and 6.8.3.9. }
program MatrixAndSetAlgebra(output);
const
   order = 3;
type
   index = 1..order;
   matrix = array [index, index] of integer;
   smallset = set of 0..15;
var
   a, b, c : matrix;
   i, j : index;
   evens, primes, both : smallset;
procedure Identity(var m : matrix);
var
   r, k : index;
begin
   for r := 1 to order do
      for k := 1 to order do
         if r = k then
            m[r, k] := 1
         else
            m[r, k] := 0
end;
procedure Multiply(var x, y, z : matrix);
var
   r, k, t, acc : integer;
begin
   for r := 1 to order do
      for k := 1 to order do
         begin
            acc := 0;
            for t := 1 to order do
               acc := acc + x[r, t] * y[t, k];
            z[r, k] := acc
         end
end;
function RowSum(row : array [lo..hi : integer] of integer) : integer;
var
   k, acc : integer;
begin
   acc := 0;
   for k := lo to hi do
      acc := acc + row[k];
   RowSum := acc
end;
function IsSubset(s, t : smallset) : Boolean;
begin
   IsSubset := s <= t
end;
begin
   Identity(a);
   for i := 1 to order do
      for j := 1 to order do
         b[i, j] := i * 10 + j;
   Multiply(a, b, c);
   for i := 1 to order do
      begin
         for j := 1 to order do
            write(c[i, j] : 5);
         writeln(RowSum(c[i]) : 7)
      end;
   evens := [];
   for i := 1 to order do
      evens := evens + [2 * i, 4 * i];
   primes := [2, 3, 5, 7, 11, 13];
   both := evens * primes;
   writeln(IsSubset(both, evens), IsSubset(both, primes));
   writeln(IsSubset(primes, evens), 2 in both, 3 in both)
end.
