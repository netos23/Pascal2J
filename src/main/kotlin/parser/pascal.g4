grammar pascal;

options { caseInsensitive = true; }
block : label_decl? const_decl? type_decl? var_decl? proc_fun_decl? statement_decl;

label_decl : LABEL LABEL_VALUE (C LABEL_VALUE)* SC;

const_decl : CONST const_def (SC const_def)* SC;
const_def : identifier EQ (SIGNED_NUMBER | STRING | identifier);

type_decl : TYPE type_def (SC type_def)* SC;
type_def : identifier EQ type_denoter;

type_denoter
	: type_identifier
	| new_type
	;

type_identifier : identifier;

new_type
	: new_ordinal_type
	| new_structured_type
	| new_pointer_type
	;

new_ordinal_type
	: enumerated_type
	| subrange_type
	;

ordinal_type
	: new_ordinal_type
	| ordinal_type_identifier
	;

ordinal_type_identifier : type_identifier;

enumerated_type : OP identifier_list CP;
identifier_list : identifier (C identifier)*;

subrange_type : constant SQ constant;

constant
	: SIGNED_NUMBER
	| SIGN? identifier
	| STRING
	;

new_structured_type : PACKED? unpacked_structured_type;

unpacked_structured_type
	: array_type
	| record_type
	| set_type
	| file_type
	;

array_type : ARRAY OB index_type (C index_type)* CB OF component_type;
index_type : ordinal_type;
component_type : type_denoter;

record_type : RECORD field_list END;

field_list
	: ((fixed_part (SC variant_part)? | variant_part) SC?)?
	;

fixed_part : record_section (SC record_section)*;
record_section : identifier_list CO type_denoter;

variant_part : CASE variant_selector OF variant (SC variant)*;
variant_selector : (tag_field CO)? tag_type;
tag_field : identifier;
tag_type : ordinal_type_identifier;
variant : case_constant_list CO OP field_list CP;
case_constant_list : case_constant (C case_constant)*;
case_constant : constant;

set_type : SET OF base_type;
base_type : ordinal_type;

file_type : FILE OF component_type;

new_pointer_type : CARET domain_type;
domain_type : type_identifier;

identifier : IDEN;

var_decl : VAR var_def (SC var_def)* SC;
var_def : identifier_list CO type_denoter;

proc_fun_decl : (proc_decl | fun_decl)+;

proc_decl
    : proc_header SC  directive
    | proc_identification SC block
    | proc_header SC block
    ;
proc_identification: PROCEDURE identifier;
proc_header: PROCEDURE identifier fromal_param_list?;

fun_decl
    : fun_header SC directive
    | fun_identification SC block
    | fun_header SC block
    ;
fun_identification : FUNCTION identifier;
fun_header : FUNCTION identifier fromal_param_list? CO type_identifier;



directive: identifier;
fromal_param_list
    : OP formal_param_section (SC formal_param_section)* CP
    ;

formal_param_section
    : value_param_spec
    | variable_param_spec
    | procedural_param_spec
    | functional_param_spec
    | conformant_array_param_spec
    ;

value_param_spec
    : identifier_list CO type_identifier
    ;

variable_param_spec
    : VAR identifier_list CO type_identifier
    ;

procedural_param_spec
    : proc_header
    ;

functional_param_spec
    : fun_header
    ;

conformant_array_param_spec
    : value_conformant_array_spec
    | variable_conformant_array_spec
    ;

value_conformant_array_spec
    : identifier_list CO conformant_array_schema
    ;

variable_conformant_array_spec
    : VAR identifier_list CO conformant_array_schema
    ;

conformant_array_schema
    : packed_conformant_array_schema
    | unpacked_conformant_array_schema
    ;

packed_conformant_array_schema
    : PACKED ARRAY OB index_type_specification CB OF type_identifier
    ;

unpacked_conformant_array_schema
    : ARRAY OB index_type_specification (SC index_type_specification)* CB OF (type_identifier | conformant_array_schema)
    ;

index_type_specification
    : identifier SQ identifier CO ordinal_type_identifier
    ;

statement_decl: ;




LABEL_VALUE: DIGIT_SEQUENCE;

SIGNED_NUMBER
	: SIGNED_INTEGER
	| SIGNED_REAL
	;

SIGNED_REAL
	: SIGN? UNSIGNED_REAL
	;

SIGNED_INTEGER
	: SIGN? UNSIGNED_INTEGER
	;

UNSIGNED_NUMBER
	: UNSIGNED_INTEGER
	| UNSIGNED_REAL
	;

SIGN
	: PLUS
	| MINUS
	;

UNSIGNED_REAL
	: DIGIT_SEQUENCE (D FRACTIONAL_PART)? (E SCALE_FACTOR)?
	;

UNSIGNED_INTEGER
	: DIGIT_SEQUENCE
	;

fragment FRACTIONAL_PART
	: DIGIT_SEQUENCE
	;

fragment SCALE_FACTOR
	: SIGN? DIGIT_SEQUENCE
	;

fragment DIGIT_SEQUENCE
	: DIGIT+
	;
fragment E: 'e';

STRING
	: '\'' (STRING_ESCAPE | ~['\r\n])* '\''
	;

fragment STRING_ESCAPE
	: '\'\''
	;

PLUS : '+';
MINUS : '-';
MUL : '*';
SLASH : '/';
EQ : '=';
LT : '<';
GT : '>';
OB: '[';
CB: ']';
D: '.';
C: ',';
CO: ':';
SC: ';';
CARET: '^';
CP: ')';
OP: '(';
NE: '<>';
LE: '<=';
GE: '>=';
AS: ':=';
SQ: '..';

AND: 'and';
ARRAY: 'array';
BEGIN: 'begin';
CASE: 'case';
CONST: 'const';
DIV: 'div';
DO: 'do';
DOWNTO: 'downto';
ELSE: 'else';
END: 'end';
FILE: 'file';
FOR: 'for';
FUNCTION: 'function';
GOTO: 'goto';
IF: 'if';
IN: 'in';
LABEL: 'label';
MOD: 'mod';
NIL: 'nil';
NOT: 'not';
OF: 'of';
OR: 'or';
PACKED: 'packed';
PROCEDURE: 'procedure';
PROGRAM: 'program';
RECORD: 'record';
REPEAT: 'repeat';
SET: 'set';
THEN: 'then';
TO: 'to';
TYPE: 'type';
UNTIL: 'until';
VAR: 'var';
WHILE: 'while';
WITH: 'with';

IDEN : LETTER (LETTER | DIGIT)*;
LETTER : [a-z];
DIGIT : [0-9];

WS          :   ( ' ' | '\t' | '\n' | '\r' )+ -> skip ;
COMMENT_1
	: '{'.*? '}'
	-> skip
	;
COMMENT_2
	: '(*' .*? '*)'
	-> skip
	;
