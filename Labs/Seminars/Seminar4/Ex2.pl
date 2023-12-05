%Given a heterogenous list of numbers & list of numbers, remove the odd
% numbers from the sublists with a mountain aspect(at least 3 elements ;
% increasing seq. followed by decreasing sequence ( 6 7 6 )
% removeOdd(l1,..,ln)=
% =[], if n = 0
% removeOdd(l2,..,ln) if l1 mod 2 = 1
% l1 U removeOdd(l2,..,ln) if l1 mod 2 = 0
% removeOdd(L-list, R-list)
% flow model : (i,o), (i,i)
removeOdd([], []).
removeOdd([H|T], [H|R]):-
    H mod 2 =:= 0, !,
    removeOdd(T, R).
removeOdd([_|T], R):-
    removeOdd(T, R).

%isMountain(l1,..,ln, flag)=
% = true , if flag = 1, n = 1
% = isMountain(l2,..,lk,..,ln, 0) , increasing, l1<l2, flag = 0 ;lk-top
% = isMountain(l2,..,ln, 1) , decreasing , l1 > l2 , flag = 0
% = isMountain(l2,..,ln, 1) , decreasing , l1 > l2 , flag = 1
% = false , otherwise
% flow model : (i,i)

%main(l1,..,ln)
%isMountain(l1,..,ln, 0) , if l1 < l2 (we must start with increasing)
%false, otherwise

%flow model : (i,i)
isMountain([_], 1).
isMountain([H1,H2|T], 0):-
    H1 < H2,
    isMountain([H2|T], 0).
isMountain([H1,H2|T], _):- %either flag 0 or 1, still transform it to 1
    H1 > H2,
    isMountain([H2|T], 1).

%flow model : (i)
mountain_main([H1,H2|T]):-
    H1 < H2,
    isMountain([H1,H2|T], 0).

%mountainOnLists(l1,..,ln) =
% = [] , if n = 0
% = l1 U mountainOnLists(l2,..,ln) , l1 atomic or not mountain list
% = removeOdd(l1) U mountainOnLists(l2,..,ln) , l1 is mountain list

mountainOnLists([], []).
mountainOnLists([H|T], Out):-
    is_list(H),
    mountain_main(H),!,
    mountainOnLists(T, NewOut),
    removeOdd(H, NewH),
    Out = [NewH | NewOut].
mountainOnLists([H|T], Out):-
    mountainOnLists(T, NewOut),
    Out = [H|NewOut].
