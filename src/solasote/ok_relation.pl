ok_relation(part_of(P,W)):-
  system(W), (artifact(P); system(P)),
  not(part_of(W,P);W==P).

ok_relation(part_of(P,W)):-
  artifact(W), not(fragment(W)),
  artifact(P).

ok_relation(part_of(P,W)):-
  fragment(W), fragment(P).

% simplification for informal specifications
ok_relation(element_of(_,html)):- !.
ok_relation(element_of(_,pdf)):- !.
ok_relation(element_of(_,java)):- !.
ok_relation(element_of(_,python)):- !.

ok_relation(element_of(A,L)):-
  artifact(A), language(L),
  defines(SPEC,L),
  conforms_to(A,SPEC).

ok_relation(element_of(A,L)):-
  artifact(A), language(L),
  fun_type(F,(Ds,Rs)),
  fun_apply(F,(Is,Os)),
  zip(Is,Ds,IsDs), zip(Os,Rs,OsRs),
  (member((A,L),IsDs);
  member((A,L),OsRs)).

ok_relation(subset_of(L1,L2)):-
  language(L1), language(L2),
  not(subset_of(L2,L1)).

ok_relation(subset_ofT(L1,L1)):-
  language(L1).

ok_relation(subset_ofT(L1,L2)):-
  subset_of(L1,L2).

ok_relation(subset_ofT(L1,L2)):-
  subset_of(L1,L), subset_ofT(L,L2).

ok_relation(fun_type(F,(Ds,Rs))):-
  function(F),
  forall(member(D,Ds), language(D)),
  forall(member(R,Rs), language(R)).

ok_relation(fun_apply(F,(IS,OS))):-
  function(F),
  forall(member(I,IS), artifact(I)),
  forall(member(O,OS), artifact(O)),
  fun_type(F,(DS,RS)),
  zip(IS,DS,IDs),
  forall(member((I,D),IDs),
    element_ofT(I,D)),
  zip(OS,RS,ORs),
  forall(member((O,R),ORs),
    element_ofT(O,R)).

ok_relation(defines(A,E)):-
  artifact(A), entity(E).

ok_relation(implement(X,Y)):-
  (artifact(X);system(X)),
  (function(Y);language(Y)).

ok_relation(conforms_to(A1,A2)):-
  artifact(A1),artifact(A2),((
  defines(A2,L),element_ofT(A1,L));
  forall(part_of(P1,A1),(
    part_of(P2,A2),
    conforms_to(P1,P2)))).

ok_relation(corresponds_to(A1,A2)):-
  artifact(A1),artifact(A2),
  ok_directed(corresponds_to(A1,A2)),
  ok_directed(corresponds_to(A2,A1)).

ok_directed(corresponds_to(A1,A2)):-
  forall(part_of(P1,A1),(
    part_of(P2,A2),
    corresponds_to(P1,P2))),!.

ok_directed(corresponds_to(A1,A2)):-
  not(part_of(_,A1);part_of(_,A2)),
  same_as(A1,A2).

ok_relation(uses(S,T)):-
  technology(T), facilitates(T,C),
  (uses(S,C);facilitates(S,C)).

ok_relation(uses(S,C)):-
  concept(C), defines(A,C),
  (part_ofT(P,S);
  uses(S,T),part_ofT(P,T)),
  complies_to(P,A).

ok_relation(facilitates(T,C)):-
  technology(T), concept(C).

ok_relation(complies_to(E,A)):-
  artifact(A), entity(E).

ok_relation(uses(S1,S2)):-
  system(S1), system(S2),
  not(technology(S2)).

ok_relation(uses(S,L)):-
  language(L), part_ofT(P,S),
  element_ofT(P,L).

ok_relation(uses(S,A)):-
  artifact(A),
  (artifact(S); system(S)).

zip([],[],[]).
zip([X|XS],[Y|YS],[(X,Y)|ZS]) :-
  zip(XS,YS,ZS).
