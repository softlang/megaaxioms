# Axiom-based Formalization of Megamodels

This project allows development of Prolog-based megamodels for SoLaSoTe.
It serves as further evaluation of a revised version of the axiomatization described [here](http://softlang.uni-koblenz.de/megaaxioms/).

## Loading

Load EMF model using `swipl src/models/emf.pl`

Use `halt.` to stop the SWIPL session.

## Testing

Run tests by loading the test file `swipl test/models/emf.pl`
and executing `?- run_tests.`. If you want to execute a single unit test specify
the test by its qualified name, e.g., `?- run_tests(ok_relation:part_of).`.

We test the KB for the emf model src/models/emf.pl against the constraints
implemented in src/common/ok_type.pl and src/common/ok_relation.pl.

Tests follow this pattern:

```
:- begin_tests(ok_relation).

test(part_of) :-
  findall((P,W),(part_of(P,W),not(ok_relation(part_of(P,W)))),RESULT),
  assertion(RESULT == []).

:- end_tests(ok_relation).
```

We use `findall/3` and `assertion/1` to receive proper output for a failing test.
When a test fails, the possible values for RESULT are printed.

