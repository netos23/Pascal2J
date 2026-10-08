# Deviations

This document describe what parts of ISO7185 unimplemented or changed 
in current Pascal dialect.
___

## Approved
List of approved deviations from the ISO standard.

### 1. Integer overflow. 
ISO makes it an error; the JVM wraps silently.

### 2. Variant records used for type punning.
The standard says reading a field of an inactive variant is an error;
Real programs do it deliberately.
In this implementation variants are a tagged union

### 3. Uninitialised variables.
ISO leaves them undefined. the JVM zero-initialises everything.

### 4. Evaluation order and short-circuiting.
The standard doesn't specify the evaluation order of expressions or the behavior of short-circuiting operators.
___
## Candidates
List of potential deviations from the ISO standard.

### 1. Real arithmetic and output format.
ISO specifies a default floating output format that is not Java's
Double.toString

### 2. Dispose and dangling pointers. 
On a garbage-collected host, dispose cannot make a pointer dangle.