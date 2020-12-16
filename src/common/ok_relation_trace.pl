:- discontiguous(ok_relation/1).
:- include("../../src/common/ok_relation.pl").

ok_relation(encodes(A,R)):-
  artifact(A), reference(R).

ok_relation(resolves_to(R,A)):-
  reference(R), artifact(A).

ok_relation(refers_to(A1,A2)):-
  part_ofT(P,A1), encodes(P,R),
  resolves_to(R,A2).
