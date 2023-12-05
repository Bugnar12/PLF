%Compute the number of occurences of an element e in a list.
%count(l1,..,ln, x)=
%=0 , if n = 0
%=(l2,..,ln , x) , if n >= 1 && x != l1
%1 + count(l2,..,ln) , if n >= 1 && x == l1
%count(L-list, X-number, R-result)
%flow model : (i,i,o)

count([], _, 0).
count([H|T], X, R):-
    X \= H,
    count(T, X, R1),
    R is R1.
count([H|T], X, R):-
    H = X,
    count(T, X, R1),
    R is R1+1.
