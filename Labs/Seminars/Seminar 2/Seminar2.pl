%Multiply the elements of a list with a constant k:
%multiplyList(L-list, K-number, R-return list)
%flow model : (i,i,o)
%Mathematical model :
%multiplyList(l1,l2,...,ln,k)=
%null, list is Empty(n=0)
%l1*k U (l2,l3,...,ln, k), otherwise


multiplyList([], _, []). % underscore can be replaced by K because of implicit cast
multiplyList([H|T], K, R):-
    multiplyList(T, K, Res2),
    NewH is H*K,
    R=[NewH|Res2].



