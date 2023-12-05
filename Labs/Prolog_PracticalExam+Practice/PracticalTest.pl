%Given a numerical linear list delete all sequences (with at least two
% elements) of consecutive numbers.

%removeConsecutive(l1,..,ln)=
% =[] , if n = 0
% =[l1] , if n = 1
% =[] , if n = 2 and l2 = l1 + 1
% =removeConsecutive(l2,..,ln), if l2 = l1 + 1 and l3 = l2 + 1
% =removeConsecutive(l3,..,ln), if l2 = l1 + 1 and l3 != l2 + 1
% = l1 U removeConsecutive(l2,..,ln) , if l2 != l1 + 1

% flow model :(i,i) or (i,o)
% removeConsecutive(L-list, R-result)

removeConsecutive([],[]). %only reached when entering an empty list
removeConsecutive([H],[H]).
removeConsecutive([H1,H2],[]):- H2 =:= H1 + 1.
removeConsecutive([H1,H2,H3|T],R):- %H1 for sure not compatible
    H2 =:= H1 + 1,
    H3 =:= H2 + 1,
    !,
    removeConsecutive([H2,H3|T],R).
removeConsecutive([H1,H2,H3|T],R):- %means the pair H1 and H2 is surely gone
    H2 =:= H1 + 1,
    H3 =\= H2 + 1,
    !,
    removeConsecutive([H3|T],R).
removeConsecutive([H1,H2|T],[H1|R]):- %only favorable case where we put head in result
	H2 =\= H1 + 1,
    removeConsecutive([H2|T],R).
