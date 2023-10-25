% Write a predicate to determine the difference of two sets
%
% We need an auxiliary predicative to check if an ELEMENT from a list is
% contained in the other list
%
% included(L-list, E-element, R-boolean)
% flow_model : (i,i)
% included(l1,...ln, E)=
% false, n = 0 (this is implicitly checked by Prolog)
% true, l1 = E
% included(l2,...,ln, E), otherwise

included([E|_], E).
included([_|T], E) :- included(T,E).

%Now the actual implementation
%
%set_difference(l1,...,ln , k1,...,km)=
% [], if n = 0
% set_difference(l2,...,ln , k1,...,km) , if included(l1 ,
% k1,...,km) = true
% l1 U set_difference(l2,...,ln , k1,...,km), otherwise
% set_difference(A-list, B-list, R-list)
% flow_model : (i,i,o) or (i,i,i)

set_difference([], _, []).
set_difference([H|T], B, R) :-
    included(B, H),
    set_difference(T, B, R).
set_difference([H|T], B, [H|R]):-
    set_difference(T, B, R).

