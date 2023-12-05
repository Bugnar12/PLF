%Given a sequence composed of distinct integer numbers, display all the
% subsequences which have a valley aspect.
% Ex : L=[5,3,4,2,7,11,1,8,6]
% Sols : [5,4,3,1] , [3,2,1,4,5,7,8] , [11, 6, 1, 3, 4, 5]
% Use permutations of subsets

%solve(l1,..,ln)=
%= S , if S = perm(subset(l1,..,ln)) and valley(S)

%subset(l1,..,ln)=
%= null , if n = 0
%= l1 U subset(l2,..,ln) , n > 0
%= subset(l2,..,ln) , n > 0

%perm(l1,..ln)=
%= null , n = 0
%= inserting(perm(l2,..,ln), l1) , n > 0

inserting(L, Elem, [Elem|L]).
inserting([H|T], Elem, [H|Out]):-
    inserting(T, Elem, Out).

%(i,o)
perm([], []).
perm([H|T], Res):-
    perm(T, TR),
    inserting(TR, H, Res).

subset([], []).
subset([H|T], R):-
    subset(T, TR),
    R is [H|TR].
subset([_|T], R):-
    subset(T,R).

solve(L, R):-
    subset(L, S),
    perm(S, P),
    valley(P),
    R = P.

main(L, 0):-
    findall(R, solve(L,R), 0).



