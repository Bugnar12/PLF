%given a list of pozitive and negative numbers, create 2 lists each
% containing only pozitive/negative numbers
%1 auxiliary function, is_pozitive
%is_pozitive(E-element)
%return true , if element is pozitive
%return false, if element is negative

check_sign(E, positive):-
    E > 0.
check_sign(E, negative):-
    E < 0.
check_sign(E, zero):-
    E =:= 0.
%predicate for inserting at the head
%insert_first(E - int, L - list, R -list)
insert_first(E, L, [E|L]).

%splitting(L-list, R1-list, R2-list)
%l1 U R1, if l1 < 0
%l1 U R2, if l1 > 0
%l2...ln , otherwise

splitting([], [], []).
splitting([H|T], [H|RN], P):-
    check_sign(H, negative),
    splitting(T, RN, P).

splitting([H|T], N, [H|RP]):-
    check_sign(H, positive),
    splitting(T, N, RP).

%determine minimum from each list (positive and negative)
det_min([H1], H1).
det_min([H|T], M):-
    det_min(T, TM),
    M is min(H, TM).
