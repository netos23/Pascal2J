{ ISO 7185, 6.3 Constant-definitions.
  A constant is a signed or unsigned number, a signed or unsigned
  constant-identifier, or a character-string.  A constant-identifier may
  itself be defined in terms of an earlier constant-identifier, and the
  required constant-identifiers maxint, true and false may be used. }
program ConstantDefinitionsOfEveryForm(output);
const
   unsignedinteger = 100;
   positiveinteger = +100;
   negativeinteger = -100;
   unsignedreal = 2.5;
   negativereal = -2.5;
   scaledreal = 2.5e3;
   stringconstant = 'a character-string constant';
   charconstant = 'z';
   aliasofaconstant = unsignedinteger;
   negatedconstant = -unsignedinteger;
   positedconstant = +unsignedinteger;
   largest = maxint;
   smallest = -maxint;
   yes = true;
   no = false;
var
   i : integer;
   r : real;
   c : char;
   b : Boolean;
begin
   i := aliasofaconstant + negatedconstant + positedconstant;
   r := scaledreal + negativereal + unsignedreal;
   c := charconstant;
   b := yes or no;
   writeln(stringconstant);
   writeln(i, r, c, b, largest, smallest, positiveinteger, negativeinteger)
end.
