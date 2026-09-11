grammar pascal;

options { caseInsensitive = true; }
block : label_decl? const_decl? type_decl? var_decl? proc_fun_decl? statement_decl;

program : program_heading SC program_block D EOF;
program_heading : PROGRAM identifier (OP program_parameter_list CP)?;
program_parameter_list : identifier_list;
program_block : block;

label_decl : LABEL label (C label)* SC;
label : UNSIGNED_INTEGER;

const_decl : CONST const_def (SC const_def)* SC;
const_def : identifier EQ constant;

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
	: sign? unsigned_number
	| sign? identifier
	| STRING
	;

sign : PLUS | MINUS;

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

proc_fun_decl : ((proc_decl | fun_decl) SC)+;

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

statement_decl: compound_statement;

compound_statement
	: BEGIN statement_sequence END
	;

statement_sequence
	: statement (SC statement)*
	;

statement
	: (label CO)? (simple_statement | structured_statement)?
	;

simple_statement
	: assignment_statement
	| procedure_statement
	| goto_statement
	;

assignment_statement
	: (variable_access | function_identifier) AS expression
	;

procedure_statement
	: procedure_identifier (
		actual_parameter_list
		| read_parameter_list
		| readln_parameter_list
		| write_parameter_list
		| writeln_parameter_list
	)?
	;

goto_statement
	: GOTO label
	;

structured_statement
	: compound_statement
	| conditional_statement
	| repetitive_statement
	| with_statement
	;

conditional_statement
	: if_statement
	| case_statement
	;

if_statement
	: IF boolean_expression THEN statement else_part?
	;

boolean_expression
	: expression
	;

else_part
	: ELSE statement
	;

case_statement
	: CASE case_index OF case_list_element (SC case_list_element)* SC? END
	;

case_index
	: expression
	;

case_list_element
	: case_constant_list CO statement
	;

repetitive_statement
	: repeat_statement
	| while_statement
	| for_statement
	;

repeat_statement
	: REPEAT statement_sequence UNTIL boolean_expression
	;

while_statement
	: WHILE boolean_expression DO statement
	;

for_statement
	: FOR control_variable AS initial_value (TO | DOWNTO) final_value DO statement
	;

control_variable
	: entire_variable
	;

initial_value
	: expression
	;

final_value
	: expression
	;

with_statement
	: WITH record_variable_list DO statement
	;

record_variable_list
	: record_variable (C record_variable)*
	;

variable_access
	: variable_identifier variable_access_suffix*
	;

variable_access_suffix
	: OB index_expression (C index_expression)* CB
	| D field_specifier
	| CARET
	;

entire_variable
	: variable_identifier
	;

variable_identifier
	: identifier
	;

component_variable
	: indexed_variable
	| field_designator
	;

array_variable
	: variable_access
	;

indexed_variable
	: array_variable OB index_expression (C index_expression)* CB
	;

index_expression
	: expression
	;

field_designator
	: record_variable D field_specifier
	| field_designator_identifier
	;

field_designator_identifier
	: identifier
	;

field_specifier
	: field_identifier
	;

field_identifier
	: identifier
	;

record_variable
	: variable_access
	;

identified_variable
	: pointer_variable CARET
	;

pointer_variable
	: variable_access
	;

buffer_variable
	: file_variable CARET
	;

file_variable
	: variable_access
	;

actual_parameter_list
	: OP actual_parameter (C actual_parameter)* CP
	;

actual_parameter
	: expression
	| variable_access
	| procedure_identifier
	| function_identifier
	;

procedure_identifier
	: identifier
	;

function_identifier
	: identifier
	;

function_designator
	: function_identifier actual_parameter_list?
	;

expression
	: simple_expression (relational_operator simple_expression)?
	;

simple_expression
	: sign? term (adding_operator term)*
	;

term
	: factor (multiplying_operator factor)*
	;

factor
	: variable_access
	| unsigned_constant
	| function_designator
	| set_constructor
	| OP expression CP
	| NOT factor
	| bound_identifier
	;

bound_identifier
	: identifier
	;

unsigned_constant
	: unsigned_number
	| STRING
	| constant_identifier
	| NIL
	;

constant_identifier
	: identifier
	;

unsigned_number
	: UNSIGNED_INTEGER
	| UNSIGNED_REAL
	;

set_constructor
	: OB (member_designator (C member_designator)*)? CB
	;

member_designator
	: expression (SQ expression)?
	;

relational_operator
	: EQ
	| NE
	| LT
	| GT
	| LE
	| GE
	| IN
	;

adding_operator
	: PLUS
	| MINUS
	| OR
	;

multiplying_operator
	: MUL
	| SLASH
	| DIV
	| MOD
	| AND
	;

read_parameter_list
	: OP (file_variable C)? variable_access (C variable_access)* CP
	;

readln_parameter_list
	: OP (file_variable | variable_access) (C variable_access)* CP
	;

write_parameter_list
	: OP (file_variable C)? write_parameter (C write_parameter)* CP
	;

writeln_parameter_list
	: OP (file_variable | write_parameter) (C write_parameter)* CP
	;

write_parameter
	: expression (CO expression (CO expression)?)?
	;

pointer_type
	: new_pointer_type
	| pointer_type_identifier
	;

pointer_type_identifier
	: type_identifier
	;

simple_type
	: ordinal_type
	| real_type_identifier
	;

simple_type_identifier
	: type_identifier
	;

real_type_identifier
	: type_identifier
	;

structured_type
	: new_structured_type
	| structured_type_identifier
	;

structured_type_identifier
	: type_identifier
	;




UNSIGNED_REAL
	: DIGIT_SEQUENCE (D FRACTIONAL_PART (E SCALE_FACTOR)? | E SCALE_FACTOR)
	;

UNSIGNED_INTEGER
	: DIGIT_SEQUENCE
	;

fragment FRACTIONAL_PART
	: DIGIT_SEQUENCE
	;

fragment SCALE_FACTOR
	: ('+' | '-')? DIGIT_SEQUENCE
	;

fragment DIGIT_SEQUENCE
	: DIGIT+
	;
fragment E: 'e';

STRING
	: '\'' (STRING_ESCAPE | ~['\r\n])+ '\''
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
COMMENT
	: ('{' | '(*') .*? ('}' | '*)')
	-> skip
	;
