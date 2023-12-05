divisible(X,Y) :- 0 is X mod Y, !. %left op. in is HAS to be const or unified
divisible(X,Y) :-
    X > Y+1,
    divisible(X, Y+1).

is_prime(2) :- true,!.
is_prime(A) :- A < 2, !, false.
is_prime(A) :- not(divisible(A,2)).

%find_divisors(E-int, C-int, R-List)
%find_divisors
% =[] , if N = 0
% = find_divisors(E, C+1, [C|R]) , if E % C == 0
% = find_divisors(E, C+1, [R]) , otherwise
find_divisors(N, N, []).
find_divisors(E, C, [C, C3|R]):-
    E mod C =:= 0,
    C * C =< E,
    !,
    C2 is C+1,
    C3 is E / C,
    find_divisors(E, C2, R).

find_divisors(E, C, R):-
    C2 is C+1,
    find_divisors(E,C2,R).

find_divisors2(N, N, L, L).
find_divisors2(N, _, L, L):- N=<2.
find_divisors2(N, D, L, [D|R]):-
    N mod D =:= 0,
    !,
    D1 is D + 1,
    find_divisors2(N, D1, L, R).
find_divisors2(N, D, L, R):-
    D1 is D + 1,
    find_divisors2(N, D1, L, R).


%add_divisors(L-list, R-list)
%add_divisors(l1,..,ln)=
% =l1 U wrapperDiv(l1) U add_divisors(l2,..,ln) , if l1 != prim
% = l1 U add_divisors(l2,..,ln) , if l1 = prim

add_divisors([], []).
add_divisors([H|T], [H|R]):-
    add_divisors(T,RD),
    find_divisors2(H, 2, RD, R).
% meaning of RD : if no divisors are found, the ALREADY CREATED LIST
% with numbers and divisors should be brought back and the H should be
% appended to it
% better said : to transfer the list so it can be recursively called by
% add_divisors(T, RD)

%insert(L-list, E-element)
%insert(l1,..,ln, E)=
% = [], if n = 0
% = l1 U l1 U insert(l2,..,ln) , if l1 = E
% = l1 U insert(l2,..,ln), otherwise

inserting1([], _, []).
inserting1([H|T], E, [H,H|R]):-
    H =:= E,!,
    inserting1(T, E, R).

inserting1([H|T], E, [H|R]):-
    inserting1(T, E, R).



%double_prime(L-list, R-list)
%double_prime(l1,..,ln)=
% = [], if n = 0
% = l1 U insert(l1) U double_prime(l2,..,ln) , if l1 is prime
% = l1 U double_prime(l2,..,ln), otherwise
% flow model : (i,i) or (i,o)

double_prime([], []).
double_prime([H|T], [H,H|R]):-
    is_prime(H),
    !,
    double_prime(T, R).
double_prime([H|T], [H|R]):-
    double_prime(T,R).
