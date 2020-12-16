:- include("../../src/solasote/ok_type.pl").

:- begin_tests(ok_type).

test(artifact) :-
  findall(X,(artifact(X),not(ok_type(artifact(X)))),RESULT),
  assertion(RESULT == []).

test(fragment) :-
  findall(X,(fragment(X),not(ok_type(fragment(X)))),RESULT),
  assertion(RESULT == []).

test(transient) :-
  findall(X,(transient(X),not(ok_type(transient(X)))),RESULT),
  assertion(RESULT == []).

test(function) :-
  findall(X,(function(X),not(ok_type(function(X)))),RESULT),
  assertion(RESULT == []).

test(language) :-
  findall(X,(language(X),not(ok_type(language(X)))),RESULT),
  assertion(RESULT == []).

test(concept) :-
  findall(X,(concept(X),not(ok_type(concept(X)))),RESULT),
  assertion(RESULT == []).

:- end_tests(ok_type).
