%insert_on_m (l1,...,ln, E, M)=
%[E], M=1 and L=[]
%[], M>1 and L=[]
%E U L if M=1 and L != []
%l1 U insertOnM(l2,...,ln, E, M-1), if M>1 and L != []
%insertM(L-list, E-elem, M-position, R-result list)
%flow model(i,i,i,o) or (i,i,i,i)

insertM([], E, 1, [E]).
insertM([], E, M, []) :- M>1.
insertM([H|T], E, 1, [E, H|T]).
insertM([H|T], E, M, R):-
    M>1,
    NewM is M-1,
    insertM(T, E, NewM, RT),
    R=[H|RT].
