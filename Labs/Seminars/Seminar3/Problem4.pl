%Compute the gcd of all elems in a linear list
%gcd(A,B)=
%=A , B = 0
%=gcd(B, A % B), B !=0

%gcd_list(l1,..,ln)=
%l1 , if n = 1;
%gcdList([gcd(l1,l2),..,ln]) , otherwise
%flow model : (i,i,o) , (i,i,i)
%gcd(A-nr., B-nr., R-result)

%gcdList(l1,..,ln, g)=
%g, if n = 0
%gcdList(l2,..,ln, gcd(l1, g)) , n > 0  -> collectorgg

gcd(A, 0, A).
gcd(A, B, X):-
    B =\= 0,
    A1 is A mod B,
    gcd(B, A1, X).

gcdList([H], H).
gcdList([H1,H2|T], R):-
    gcd(H1,H2,X),
    gcdList([X|T], R).


