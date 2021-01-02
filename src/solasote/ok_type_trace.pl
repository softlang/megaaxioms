:- discontiguous(ok_type/1).
:- include("../../src/solasote/ok_type.pl").

ok_type(reference(R)):-
  encodes(_,R), resolves_to(R,_).

ok_type(trace(T)):-
  forall(
   (member(TUPLE,T),member(R,TUPLE)),
   reference(R)).
