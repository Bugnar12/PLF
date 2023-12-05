generate_parentheses(0, []).
generate_parentheses(N, ['('|T]) :-
    N > 0,
    N1 is N - 1,
    generate_parentheses(N1, T).

generate_parentheses(N, [')'|T]) :-
    N > 0,
    N1 is N - 1,
    generate_parentheses(N1, T).

generate_all_parentheses(N, Result) :-
    findall(X, generate_parentheses(N, X), Result).
