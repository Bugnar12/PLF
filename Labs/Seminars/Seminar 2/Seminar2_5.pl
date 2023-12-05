%Sum with a collector variable
%sumC(L-list, C-collector, S-result sum)
%flow_model(i,i,o)
%sumC([], C, C)
%sumC([H|T], C, S):-

sumC([], C, C).
sumC([H|T], C, S):-
    NewC is C+H,
    sumC(T, NewC, S).

