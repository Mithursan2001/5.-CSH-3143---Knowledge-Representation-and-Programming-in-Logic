born(jan, date(20,3,1977)).
born(jeroen, date(2,2,1992)).
born(joris, date(17,3,1995)).
born(jelle, date(1,1,2004)).
born(jesus, date(24,12,0)).
born(joop, date(30,4,1989)).
born(jannecke, date(17,3,1993)).
born(jaap, date(16,11,1995)).


year(Year, Person) :-
    born(Person,
    date(_, _, Year)).
/* output 1.1
 ?- year(1995, Person).
Person = joris ;
Person = jaap.
*/



before(date(D1,M1,Y1), date(D2,M2,Y2)) :-
    ( Y1 < Y2 );
    ( Y1 = Y2, M1 < M2 );
    ( Y1 = Y2, M1 = M2, D1 < D2 ).
/* output 1.2
?- before(date(31,1,1990), date(7,7,1990)).
true .
 */


older(P1, P2) :-born(P1, Date1),
    born(P2, Date2),
    before(Date1, Date2).
/* output 1.3
?- older(jannecke, X).
X = joris ;
X = jelle ;
X = jaap ;
false.
 */


poly_sum([], P, P).
poly_sum([(C1,E)|T], P2, Sum) :-
    (   select((C2,E), P2, P2Rest)
    ->  C is C1 + C2,
        poly_sum(T, P2Rest, SumRest),
        Sum = [(C,E)|SumRest];
    poly_sum(T, P2, SumRest),
        Sum = [(C1,E)|SumRest]).
/* output 2
?- poly_sum([(5,3), (1,2)], [(1,3)], Sum).
Sum = [(6, 3),  (1, 2)].


?- poly_sum([(2,2), (3,1), (5,0)], [(5,3), (1,1), (10,0)], X).
X = [(2, 2),  (4, 1),  (15, 0),  (5, 3)].
 */


has_divisor(N, D) :-
    D*D =< N,
    (N mod D =:= 0 ;
    D1 = D+1,
    has_divisor(N, D1)).

/* output 3
?- prime(17).
true .

?- prime(18).
false.
 */



has_divisor(N, D) :-
    D*D =< N,
    (N mod D =:= 0 ;
    D1 = D+1,
    has_divisor(N, D1)).

prime(N) :-integer(N),N > 1,\+has_divisor(N, 2).


goldbach(N,P+Q):-
    N > 2,
    N mod 2 =:= 0,
    X is N/2,
    between(2,X,P),
    prime(P),
    Q is N-P,
    prime(Q).


/* output 4
?- goldbach(30, Solution).
Solution = 7+23 .

?- goldbach(17420000, Solution).
Solution = 109+17419891 .
 */
