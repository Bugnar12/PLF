%gcd(A-number, B-number, C-number(result))
%flow model : (i,i,o) or (i,i,i)
% = A , if B = 0
% = B , if A = 0
% gcd(A % B, B) , if A >= B
% gcd(A, B % A) , if B >= A

gcd(A,0,A):-!.
gcd(0,B,B):-!.
gcd(A, B, R):-
    A >= B,
    NewA is A mod B,
    gcd(NewA, B, R).
gcd(A, B, R):-
    B >= A,
    NewB is B mod A,
    gcd(A, NewB, R).

