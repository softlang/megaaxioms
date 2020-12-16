:- include("../../src/models/emf_trace_generate.pl").
:- include("../../src/common/ok_type_trace.pl").
:- include("../../src/common/ok_relation_trace.pl").
:- include("../../test/common/ok_type.pl").
:- include("../../test/common/ok_relation.pl").

:- begin_tests(ok_trace_generate).

test(trace) :-
  findall(X,(trace(X),not(ok_type(trace(X)))),RESULT),
  assertion(RESULT == []).

test(reference) :-
  findall(X,(reference(X),not(ok_type(reference(X)))),RESULT),
  assertion(RESULT == []).

test(encodes) :-
  findall((X,Y),(encodes(X,Y),not(ok_relation(encodes(X,Y)))),RESULT),
  assertion(RESULT == []).

test(resolves_to) :-
  findall((X,Y),(resolves_to(X,Y),not(ok_relation(resolves_to(X,Y)))),RESULT),
  assertion(RESULT == []).

test(refers_to) :-
  findall((X,Y),(refers_to(X,Y),not(ok_relation(refers_to(X,Y)))),RESULT),
  assertion(RESULT == []).

:- end_tests(ok_trace_generate).


