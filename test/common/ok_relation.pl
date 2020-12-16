:- include("../../src/common/ok_relation.pl").

:- begin_tests(ok_relation).

test(part_of) :-
  findall((X,Y),(part_of(X,Y),not(ok_relation(part_of(X,Y)))),RESULT),
  assertion(RESULT == []).

test(element_of) :-
  findall((X,Y),(element_of(X,Y),not(ok_relation(element_of(X,Y)))),RESULT),
  assertion(RESULT == []).

test(subset_of) :-
  findall((X,Y),(subset_of(X,Y),not(ok_relation(subset_of(X,Y)))),RESULT),
  assertion(RESULT == []).

test(fun_type) :-
  findall((X,Y),(fun_type(X,Y),not(ok_relation(fun_type(X,Y)))),RESULT),
  assertion(RESULT == []).

test(fun_apply) :-
  findall((X,Y),(fun_apply(X,Y),not(ok_relation(fun_apply(X,Y)))),RESULT),
  assertion(RESULT == []).

test(defines) :-
  findall((X,Y),(defines(X,Y),not(ok_relation(defines(X,Y)))),RESULT),
  assertion(RESULT == []).

test(implement) :-
  findall((X,Y),(implement(X,Y),not(ok_relation(implement(X,Y)))),RESULT),
  assertion(RESULT == []).

test(conforms_to) :-
  findall((X,Y),(conforms_to(X,Y),not(ok_relation(conforms_to(X,Y)))),RESULT),
  assertion(RESULT == []).

test(corresponds_to) :-
  findall((X,Y),(corresponds_to(X,Y),not(ok_relation(corresponds_to(X,Y)))),RESULT),
  assertion(RESULT == []).

test(uses) :-
  findall((X,Y),(uses(X,Y),not(ok_relation(uses(X,Y)))),RESULT),
  assertion(RESULT == []).

test(facilitates) :-
  findall((X,Y),(facilitates(X,Y),not(ok_relation(facilitates(X,Y)))),RESULT),
  assertion(RESULT == []).

test(complies_to) :-
  findall((X,Y),(complies_to(X,Y),not(ok_relation(complies_to(X,Y)))),RESULT),
  assertion(RESULT == []).

:- end_tests(ok_relation).
