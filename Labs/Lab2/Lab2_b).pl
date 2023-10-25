% Write a predicate to add value 1 after every even element from a list.
%
% one_after_even(l1,...,ln)=
% [], if n = 0
% l1 U (l2,...,ln), if l1 is odd
% l1 U [1] U (l2,...,ln), otherwise
% one_after_even(List A, List R)
% flow_model(i,o) or (i,i)
%
% 2 auxiliary predicates to check if a number is odd or even

is_odd(N) :- N mod 2 =:= 1.
is_even(N) :- N mod 2 =:= 0.


one_after_even([], []).
one_after_even([H|T], [H,1|R]):-
    is_even(H),
    one_after_even(T, R).

one_after_even([H|T], [H,10|R]):-
    is_odd(H),
    one_after_even(T, R).

