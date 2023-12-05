% 8. Generate all strings of n parenthesis correctly closed.
%    Eg: n=4 => (()) and () ()
% !!!NOTE!!! : I added more comments since this homework will not be
% verbally explained

%helper predicates that identify parentheses
parenthesis('(').
parenthesis(')').

%Helper predicate to determine a combination of parentheses

% allcombinations(n, i, c) =
% = c, if i = n
% = allcombinations(n, i + 1, paranteza(x) + c), otherwise

% allcombinations(N:number, I:number, C:list, R:list)
% flow model : (i,i,i,o)

allcombinations(N, N, C, C) :- !.
allcombinations(N, I, C, R) :-
    parenthesis(X),
    NI is I + 1,
    allcombinations(N, NI, [X|C], R).

%Predicate to check if a certain combination of parentheses is valid
%by adding and substracting from C if we encounter '(' or ')'
%at the end if C = 0 it means that : nr. of '(' = nr. of ')'

% check(l1l2...ln, c) =
% = true, if n = 0 and c = 0
% = check(l2...ln, c + 1), if l1 = '('
% = check(l2...ln, c - 1), if l1 = ')' and c > 0
% = false, otherwise
% check(L-list, C-number)
% flow model : (i,o) (i,i)

check([],0):-!.
check([H|T],C):-
    H == '(',
    C1 is C + 1,
    check(T,C1).
check([H|T],C):-
    H == ')',
    C > 0, %dismiss cases like ')('
    C1 is C - 1,
    check(T,C1).


% oneSol(N: number, R:result list)
% oneSol is not used for recursively calling itself => no model
% flow model : (i,o)


oneSol(N,R):-
    allcombinations(N,0,[],R),
    check(R,0). %check if the value C is equal to 0 so parantheses are in right order

%generate ALL the solutions using finall()
%wrapper predicate, again no model needed
%flow model : (i,o)
allSols(N,R):-
    findall(RPartial,oneSol(N,RPartial),R).
%findall(+Template, :Goal, -Bag)
%Template - shape of solution (valid parantheses of size N)
% Goal - predicate whose solutions are desired to be found - pass just
% oneSol; it will find the others
%Bag - list containing all the solutions - returned list
