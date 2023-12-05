% b. Write a predicate to delete first occurrence of the minimum number from a list.

% min(a,b) =
% a , if a < b
% b, otherwise

min(A,B,A):-
    A < B.
min(A,B,B):-
    A >= B.

% minList(l1l2...ln) =
% l1, if n = 1
% min(l1, minList(l2...ln)), otherwise

% minList(L:list,R:list)
% (i,o)

minList([H],H).
minList([H|T],R1):-
    minList(T,R),
    min(H,R,R1).
