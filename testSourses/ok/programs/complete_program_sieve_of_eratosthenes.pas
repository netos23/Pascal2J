{ An integration test: the sieve of Eratosthenes.
  Combines a constant-definition, a subrange-type, a packed array of
  Boolean, a nested procedure with a var parameter, for-statements counting
  both ways, a while-statement, a repeat-statement and formatted output.
  ISO 7185 clauses 6.3, 6.4.2.4, 6.4.3.2, 6.6.3.3, 6.8.3.8 and 6.9.3. }
program SieveOfEratosthenes(output);
const
   limit = 200;
type
   candidate = 2..limit;
   sieve = packed array [candidate] of Boolean;
var
   isprime : sieve;
   n : integer;
   count : integer;
procedure Initialise(var s : sieve);
var
   i : candidate;
begin
   for i := 2 to limit do
      s[i] := true
end;
procedure Strike(var s : sieve; p : candidate);
var
   multiple : integer;
begin
   multiple := p + p;
   while multiple <= limit do
      begin
         s[multiple] := false;
         multiple := multiple + p
      end
end;
function CountPrimes(var s : sieve) : integer;
var
   i : candidate;
   total : integer;
begin
   total := 0;
   for i := limit downto 2 do
      if s[i] then
         total := total + 1;
   CountPrimes := total
end;
begin
   Initialise(isprime);
   n := 2;
   repeat
      if isprime[n] then
         Strike(isprime, n);
      n := n + 1
   until n * n > limit;
   count := CountPrimes(isprime);
   for n := 2 to limit do
      if isprime[n] then
         write(n : 5);
   writeln;
   writeln('primes below ', limit : 1, ': ', count : 1)
end.
