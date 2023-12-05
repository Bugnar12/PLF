%Insert an element E at the end of a list
%insertE(l1,...,ln, E)=
%[E], n = 0
%l1 U insertE(l2,...,ln), otherwise
%insertE(L-list, E-elem, R-result list)
%flow model(i,i,o) (i,i,i)

InsertE([], E, [E]).
insertE([H|T], E, [H|TR]):-
    insertE(T, E, TR).


%OR insert([H|T], E, [H|TR]) and without last line R=...
%in essence; place the head of the list and then the remaining is TR
