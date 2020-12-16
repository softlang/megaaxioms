%Subtyping
entity(X) :- artifact(X).
entity(X) :- language(X).
entity(X) :- system(X).
entity(X) :- function(X).
entity(X) :- concept(X).
artifact(X) :- folder(X).
artifact(X) :- file(X).
artifact(X) :- fragment(X).
artifact(X) :- transient(X).
system(X) :- technology(X).

%shortcuts for demos
part_ofT(A1,A1).
part_ofT(A1,A2) :- part_of(A1,A2).
part_ofT(A1,A3) :- part_of(A1,A2), part_ofT(A2,A3).

%inference rules
language(L) :- element_of(_,L).
element_of(-A,+L) :- defines(SPEC, +L), conforms_to(-A,SPEC).
element_of(+A,-L) :- conforms_to(+A,SPEC), defines(SPEC, -L),!.
element_ofT(A,L) :- element_of(A,L),!.
element_ofT(A,L) :- element_of(A,L2), subset_ofT(L2,L).

% implementation of language.
implement(S,L):- language(L), fun_type(F,(Ds,Rs)), implement(S,F),
    (member(L,Ds);member(L,Rs)).
implement(SYS,LC) :- subset_of(LC,L), implement(SYS,L).

function(F) :- fun_type(F,_).

subset_ofT(L,L).
subset_ofT(L1,L2) :- subset_of(L1,L2).
subset_ofT(L1,L3) :- subset_of(L1,L2), subset_ofT(L2,L3).

%Conformance
idealConformance(A1,A2):- defines(A2,L),element_of(A1,L)
 ; forall(part_of(A1p,A1), (part_of(A2p,A2),conforms_to(A1p,A2p))).
%conforms_to(A1,A2):- idealConformance(A1,A2).

%Correspondence
idealCorrespond(A1,A2):- not(part_of(_,A1)), A1==A2
 ; forall(part_of(A1p,A1),(part_of(A2p,A2),corresponds_to(A1p,A2p)))
  , forall(part_of(A2p,A2),(part_of(A1p,A1),corresponds_to(A2p,A1p))).
corresponds_to(A1,A2):- idealCorrespond(A1,A2).

% Utility rules for instantiating function types (languages)
typecheck([],[]).
typecheck([A|AS],[L|LS]):- element_of(A,L), typecheck(AS,LS).

inputOf(IS,F) :- fun_apply(F,(IS,_)).
outputOf(OS,F) :- fun_apply(F,(_,OS)).

domainOf(DS,F):- fun_type(F,(DS,_)).
rangeOf(RS,F):- fun_type(F,(_,RS)).

overloaded(F) :- fun_type(F,T1), fun_type(F,T2), T1 \= T2 .

% Usage
uses(W,C):- part_of(P,W),
      (element_of(P,C)
        ;uses(P,C)).

uses(W,C):- part_of(P,W),
    conforms_to(P,SPEC),
    defines(SPEC,C).
