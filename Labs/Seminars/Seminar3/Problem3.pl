%Remove the sublists from a heterogenous list.
%remove_sublist(l1,..,ln)=
%=[] , if n = 0
%=l1 U (l2,..,ln) , if l1 is Number
%=remove_sublist(l2,..,ln) , if l1 is a List

%remove_sublist(L-list, R-list)
%flow model : (i,i) / (i,o)

remove_sublist([], []).
remove_sublist([H|T], R):-
    atomic(H),
    remove_sublist(T, R1),
    R=[H|R1].

remove_sublist([H|T], R):-
    is_list(H),
    remove_sublist(T, R).
