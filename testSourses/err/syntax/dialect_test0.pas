program HelloWorld;
const a=9;
{! !!SyntaxError[E2003]: unexpected '=' at 4:12!! !}
var c: char='y' ;
 b: integer;
 const n:integer=0;
 const m:char='3';
  var l : array [1..3] of array[0..2] of array[2..6] of integer;
 procedure v();

 {! !!SyntaxError[E2003]: unexpected 'const' at 12:2!! !}
 const p:integer=0;
 begin
 l[2] [0]       [6] :=0;
 end;


begin
b:=0
end.