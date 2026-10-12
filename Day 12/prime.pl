has_divisor(N, D) :-
    D*D =< N,
    (N mod D =:= 0 ;
    D1 = D+1,
    has_divisor(N, D1)).

prime(N) :-
    integer(N),N > 1,\+has_divisor(N, 2).


goldbach(N,P+Q):-
    N > 2,
    N mod 2 =:= 0,
    X is N/2,
    between(2,X,P),
    prime(P),
    Q is N-P,
    prime(Q).








