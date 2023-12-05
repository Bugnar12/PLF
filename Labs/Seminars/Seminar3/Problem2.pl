%Write a pred to remove from a list all the elements that appear only
% once
% [1,2,1,4,1,3,4] ->[1,1,4,1,4]
% WITHOUT COLLECTOR
% remove_occurences(l1,..,ln , p1,..,pm)=
% =null , if n = 0
% =l1 U remove_occurences(l2,..,ln , p1,..,pm) , count(p1,..,pm , l1)>1
% =remove_occurences(l2,..,ln , p1,..,pm) , count(p1,..,pm , l1) == 1
% main(l1,..,ln) = remove_occ(l1,..,ln , l1,..,ln)
% main(i,o)

count([], _, 0).
count([H|T], X, R):-
    X \= H,
    count(T, X, R1),
    R is R1.
count([H|T], X, R):-
    H = X,
    count(T, X, R1),
    R is R1+1.
%remove_occurences(list, copy, result)
%flow model : (i,i,o)

remove_occurences([],_, []).
remove_occurences([H|T], L, Out):-
    count(L, H, R1),
    R1 > 1,
    remove_occurences(T, L, [H|Out]).
remove_occurences([H|T], L, Out):-
    count(L, H, 1),
    remove_occurences(T, L, Out).

main2(List, Out):-
    remove_occurences(List, List, Out).
