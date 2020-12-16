ok_type(artifact(A)):-
  element_of(A,_).

ok_type(file(A)) :-
  ok_type(artifact(A)).

ok_type(folder(A)) :-
  ok_type(artifact(A)).

ok_type(fragment(F)):-
  ok_type(artifact(F)),
  part_of(F,A), artifact(A).

ok_type(transient(T)):-
  fun_apply(_,(_,OS)),
  member(T1,OS),
  part_ofT(T,T1).

% simplification for informal specifications
ok_type(language(html)):- !.
ok_type(language(pdf)):- !.
ok_type(language(java)):- !.
ok_type(language(python)):- !.

ok_type(language(L)):-
  (defines(_,L); implement(_,L)).

ok_type(function(F)):-
  okFun1(function(F)),
  okFun2(function(F)).

ok_type(concept(C)):-
  defines(_,C).

%Helper predicates
okFun1(function(F)):-
  fun_type(F,_).

okFun2(function(F)):-
  defines(_,F);implement(_,F).
