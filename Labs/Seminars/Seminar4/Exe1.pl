%Given a list of numbers & sublists of numbers, substitue each
% [H1|[H2|T]] sublist in which the sum of elements is odd with the first
% element of that sublist
% HELPER PREDICATE
% sum(l1,..,ln)=
% = 0 , n = 0
% l1 + sum(l2,..,ln) , otherwise
%sum(L-list, S-sum)
%flow model : (i,i), (i,o)

sum([], 0).
sum([H|T], R):-
    sum(T,R1),
    R is H + R1.

%sub(l1,..,ln)=
%=[] , n = 0
%= l1 U sub(l2,..,ln), n>=1 and atom(l1)
%= l11 U sub(l2,..,ln), n>=1 and list(l1) and sum(l1) % 2 == 1
%= l1 U sub(l2,..,ln) , n>=1 and list(l1) and sum(l1) % 2 == 0
%sub(L-list, R-list)
%flow model : (i,i) , (i,o)

sub([], []).
sub([H|T], [H|R]):-
    atomic(H),
    sub(T,R).
sub([H|T], [H1|R]):-
    is_list(H),
    sum(H, S),
    S mod 2 =:= 1,
    H = [H1,_],
    sub(T,R1),
    R = [H1|R1].

sub([H|T], R):-
    is_list(H),
    sum(H, S),
    S mod 2 =:= 0,
    sub(T, R1),
    R = [H|R1].

sub2([], []).
sub2([H|T], R):-
    H=[H1|_], %check if it's a list
    sum(H, S), %compute sum
    S mod 2 =:= 1, %if sum mod 2 == 1 => we found a solution => STOP
    !,
    sub(T, R1),
    R=[H1|R1].
sub2([H|T], [H|R]):-
    sub2(T,R).
