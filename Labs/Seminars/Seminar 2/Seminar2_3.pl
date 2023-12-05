%Compute the sum of elements of a list
%list_sum(l1,...,ln)=
%0, n=0
%l1+list_sum(l2,...,ln), otherwise
%list_sum(L-list, S-Sum)
%flow model (i,o), (i,i)

suma([], 0).
suma([H|T], S):-
    suma(T, TS),
    S is H+TS.

