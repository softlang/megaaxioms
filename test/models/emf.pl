:- include("../../test/solasote/ok_type.pl").
:- include("../../test/solasote/ok_relation.pl").
:- include("../../src/models/emf.pl").

:- begin_tests(ci).

test(failing) :-
  1 == 2.

:- end_tests(ci).

:- run_tests.
