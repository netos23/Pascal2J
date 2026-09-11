# Pascal test corpus

Test inputs for the `pascal.g4` grammar and for the semantic analysis that
follows it. Every file is a complete compilation unit derived from
**ISO/IEC 7185:1990** (`docs/iso7185.pdf`), the unextended Pascal standard.

## Directory contract

The directory a file lives in *is* its expected outcome, so a runner can be
table-driven with no per-file metadata:

| Directory | Parser | Semantic analysis |
|---|---|---|
| `ok/` | accepts | accepts |
| `err/lexical/` | rejects (during tokenisation) | not reached |
| `err/syntax/` | rejects (during parsing) | not reached |
| `err/semantic/` | **accepts** | rejects |

`err/semantic/` is the important case: those files are deliberately free of
syntax errors, so they parse cleanly and isolate a single semantic rule. A
change that makes one of them fail to *parse* is a regression in the test, not
a pass.

Every file names the ISO 7185 clause it exercises in its opening comment, and
every file under `err/` also states the diagnostic it is expected to provoke.
The wording is a description of intent, not a string to match.

## Positive tests — `ok/`

| Directory | ISO 7185 clause | Covers |
|---|---|---|
| `lexical/` | 6.1 | identifiers and case insensitivity, numbers and scale factors, character-strings with doubled apostrophes, both commentary delimiter styles including the mixed forms, the special-symbols |
| `blocks/` | 6.2 | all declaration parts present, all of them absent, nested scopes and shadowing, recursive activation, labels and `goto` |
| `constants/` | 6.3 | every form of constant: signed and unsigned numbers, constant-identifiers, strings, `maxint` |
| `types/` | 6.4 | required simple-types, enumerated, subrange, arrays (multidimensional and packed), records with fixed and variant parts, sets, files and `text`, pointers with forward-referenced domains, and the worked example of 6.4.7 |
| `variables/` | 6.5 | every type-denoter in a variable-declaration, entire and indexed variables, field-designators, identified variables, buffer variables |
| `routines/` | 6.6 | procedure and function declarations, the `forward` directive and mutual recursion, value and variable parameters, procedural and functional parameters, conformant array parameters, and the required routines (`abs`…`arctan`, `trunc`, `round`, `ord`, `chr`, `succ`, `pred`, `odd`, `eof`, `eoln`, `new`, `dispose`, `pack`, `unpack`, `get`, `put`, `reset`, `rewrite`) |
| `expressions/` | 6.7 | operator precedence and parenthesisation, arithmetic on integer and real, Boolean and relational operators, set operators and set-constructors, function-designators as factors |
| `statements/` | 6.8 | assignment and assignment-compatibility, procedure-statement forms, compound and empty statements, the dangling `else`, `case` with constant lists, `repeat`, `while`, `for` both ways, `with` over a record-variable-list, `goto` out of a structured statement |
| `io/` | 6.9 | `read`, `readln`, `write` with field widths and fraction lengths, `writeln`, `page`, and the two file-copying programs given as examples in 6.10 |
| `programs/` | 6.10 | program headings with and without parameters, plus three integration programs: the sieve of Eratosthenes, an ordered binary tree, and matrix and set algebra |

`ok/test0.pas` predates the grammar — it is a fragment, not a program, and does
not parse. It is left where it was found and is not part of this corpus.

## Negative tests — `err/`

`lexical/` — unterminated strings and commentaries, a string broken across a
line, an identifier starting with a digit, an identifier containing an
underscore, a real literal with no fractional digits, characters outside the
alphabet.

`syntax/` — a missing program heading, terminating full stop or semicolon;
declaration parts out of order and duplicated; `=` used for assignment; an
expression in a constant-definition; a semicolon before `else`; missing `then`,
`of`, `do` and `until`; a `case`-constant written as a range; unbalanced
`begin`/`end`; malformed array, record, subrange and set syntax; a function
heading with no result type; malformed parameter lists; empty parentheses on a
parameterless call; a dereferenced function result; a `goto` to an identifier;
a nested program; a variant part before the fixed part; a procedure heading
with neither block nor directive.

`semantic/` — undeclared variables and types; identifiers and record fields
declared twice; assignment-compatibility violations including real-to-integer
and `nil` to a non-pointer; assignment to a constant; the four ways of
threatening a `for` control variable, plus control variables that are real or
non-local; non-ordinal `case` indices, duplicate and mistyped case-constants;
non-ordinal array index-types and set base-types; a file whose component
contains a file; reversed and mistyped subrange bounds; operand and relational
type errors; set members of the wrong base type; functions with no result
assignment, with a result assigned from the wrong block, or with a structured
result type; calls with the wrong parameter count, the wrong parameter types,
an expression where a variable parameter is required, and non-congruous
parameter lists; unused, undeclared and duplicated labels; `goto` into a
structured statement or into another routine; dereferencing, indexing, field
selection and `with` applied to variables of the wrong type; recursive types
without a pointer; a `forward` declaration with no body and one that repeats
its parameter list; undeclared and duplicated program parameters; required
routines applied to the wrong types; `new` and `dispose` given the wrong
case-constants.

## Adding a test

One rule per file, named for the rule it tests. State the ISO 7185 clause in
the opening comment, and for a negative test state the expected diagnostic.
Keep negative tests minimal: a `err/semantic/` file that also fails to parse
tests nothing about semantic analysis.

Note when writing the comments: a commentary opened with `{` is closed by the
first `}` **or** `*)` that follows, so a comment that talks about commentary
delimiters has to spell them out in words.
