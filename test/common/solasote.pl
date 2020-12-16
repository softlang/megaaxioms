:- include("../../src/common/solasote.pl").

:- begin_tests(element_of).

element_of(a,l).
language(L):- element_of(_,L).

test(language) :-
  language(l).

:- end_tests(element_of).

:- begin_tests(inference).

test(language_triangle1):-
  findall((A,SPEC,L),(element_of(A,L),defines(SPEC,L),not(conforms_to(A,SPEC))),RESULT),
  assertion(RESULT == []).

test(language_triangle2):-
  findall((A,SPEC,L),(defines(SPEC,L),conforms_to(A,SPEC),not(element_of(A,L))),RESULT),
  assertion(RESULT == []).

:- end_tests(inference).
