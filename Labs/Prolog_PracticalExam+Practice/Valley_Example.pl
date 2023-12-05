%isValley(l1,..,ln, flag)=
% = true , if n = 1 and flag = 1
% = isValley(l2,..,ln, 0) , if decreasing l2 < l1 , flag = 0
% = isValley(l2,..,ln, 1) , if increasing l2 > l1 , flag = 0
% = isValley(l2,..,ln, 1) , if increasing l2 > l1 , flag = 1
% = false , otherwise

%isValley(L-list, F-number(bit))
%flow model : (i,i)

isValley([_], 1).
isValley([H1,H2|T], 0):-
    H2 < H1,
    isValley([H2|T], 0).
isValley([H1,H2|T], 0):-
    H1 < H2,
    isValley([H2|T], 1).
isValley([H1,H2|T], 1):-
    H1 < H2,
    isValley([H2|T], 1).

valleyMain([H1,H2|T]):-
    H1 > H2,
    isValley([H1,H2|T], 0).

%Calculate the alternate sum of a list
%sumOdd(L-list)=
% =l1 , if n = 0
% =l1 + (l3,..,ln) , otherwise

sumOdd([], 0, 0).
sumOdd([H], H, 0).
sumOdd([H1,H2|T], R1, R2):-
    sumOdd(T, RO, RE),
    R1 is RO + H1,
    R2 is RE + H2.

sum([],0).
sum([H], H).
sum([H1,H2|T], R2):-
    sum(T,R),
    R1 is H1 - H2,
    R2 is R + R1.
