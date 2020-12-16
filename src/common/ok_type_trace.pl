:- discontiguous(ok_type/1).
:- include("../../src/common/ok_type.pl").

ok_type(reference(R)):-
  encodes(_,R), resolves_to(R,_).

ok_type(trace(T)):-
  forall((member(TL,T),member(R,TL)), reference(R)).
