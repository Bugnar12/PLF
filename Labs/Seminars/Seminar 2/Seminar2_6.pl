%Delete all occ. of an element E from a list L
%removeE([l1,...,ln], E)=
%[], n=0
%l1 U removeE([l2,...,ln), E), if l1 != E
%removeE([l2,...,ln), E)

deleteE([], _, []).
deleteE([E|T], E, R):-
    deleteE(T, E, R).
deleteE([H|T], E, [H|RT]):-
    H=\=E,
    deleteE(T, E, RT).
