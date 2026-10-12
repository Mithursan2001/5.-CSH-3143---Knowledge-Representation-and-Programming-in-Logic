print_list([]):- nl.
print_list([H|T]):- write(H), write(' '), print_list(T).


addtoend(H, [], [H]).
addtoend(X, [H|T], [H|T1]):- addtoend(X, T, T1).

reversex([], []).
reversex([H|T], Y):- reversex(T, T1), addtoend(H, T1, Y).


create_list(X, X, [X]).
create_list(A, X, [A|T]):- AA is A+1, create_list(AA, X, T).


sum_list([], 0, 0).
sum_list([H|T], Length, Sum):- sum_list(T, L1, S1), Length is L1+1, Sum is S1+H.

mean(L, M):- sum_list(L, Length, Sum), M is Sum / Length.


numberinlist([]):- fail.
numberinlist([X|_]) :- number(X).
numberinlist([_|T]) :- numberinlist(T).


increment([], []).
increment([H|T], [X|Y]):- increment(T, Y), X is H+1.

factorial(0, 1).
factorial(N, X):- N > 0, N1 is N-1, factorial(N1, S), X is S * N.


appendx([], A, A).
appendx([H|T], A, [H|U]):- appendx(T, A, U).


encapsulate([], []).
encapsulate([H|T], [[H]|Y]):- encapsulate(T, Y).


insert_zeros([], []).
insert_zeros([H|T], [H, 0|Y]):- insert_zeros(T, Y).

clone_list(T, [T, T]).

modify_list([], _, _, []).
modify_list([_|T], 0, X, [X|T]).
modify_list([H|T], N, X, [H|Y]) :-N > 0, N1 is N - 1, modify_list(T, N1, X, Y).


addtoend(X, [], [X]).
addtoend(X, [H|T], [H|T1]) :- addtoend(X, T, T1).
rotate_list([H|T], L1) :-addtoend(H, T, L1).


fib(1, 1).
fib(2, 1).
fib(N, F):-N >2,N1 is N - 1,N2 is N - 2,fib(N1, F1),fib(N2, F2),F is F1 + F2.


random10(N) :- random_between(0, 9, N).
rand_row(0, []).
rand_row(N, [H|T]) :- N > 0,random10(H), N1 is N - 1,rand_row(N1, T).
square_matrix_rand(N, S) :-smr(N, N, S).
smr(_, 0, []).
smr(N, X, [R|T]) :- X > 0, rand_row(N, R), X1 is X - 1, smr(N, X1, T).









