%remove_col(l1,..,ln , p1,..,pm, c1,..,ck)=
%=c1,..,ck , n = 0
%rem_col(l2,..,ln , p1,..,pm , c1,..,ck) , count(p1,..,pm , l1) = 1
%rem_col(l2,..,ln , p1,..,pm , c1,..ck U l1), count(p1,..,pm , l1) > 1
%c1,..,ck U l1 , because otherwise we get the list reversed

%main(l1,..,ln) = rem)col(l1,..,ln , l1,..,ln , col)
%main(List-list, Output-list)
%flow model : (i,o) , (i,i)

% removeCol(L-list, CL-copy list , ColL - collector list, R-result list)
% flow model : (i,i,i,o)

%Tail recursion:
%-recursion call is the last
%-deterministic predicate
%-means changing the stack frame and not pushing any elements unlike
%normal recursion

%Heteogenous lists:
%atomic(H) checks if it's a number, symbol or []
%number(H) - ...
%is_list(H) - ...

countO([], _, C, C).
countO([H|T], H, C, R):-
    %!,
    C1 is C+1,
    countO(T,H,C1,R).
countO([H|T], E, C, R):-
    H\=E,
    countO(T,E,C,R).

mainCO(L, E, R) :- countO(L, E, 0, R).

addToEnd([], E, [E]).
addToEnd([H|T], E, R):-
    addToEnd(T, E, TR),
    R=[H|TR].

rem_col([], _, C, C).
rem_col([H|T], L, C, R):-
    mainCO(L,H,1),!,
    rem_col(T, L, C, R).
rem_col([H|T], L, C, R):-
    addToEnd(C, H, NewC),
    rem_col(T, L, NewC, R).

main(L, Out):-
    rem_col(L,L,[],Out).










