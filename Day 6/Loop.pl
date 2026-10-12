count_to_10(10):-write(10),nl.

count_to_10(X) :-write(X),nl,Y is X +1,count_to_10(Y).

/*?- count_to_10(3).
3
4
5
6
7
8
9
10
true .

?- count_to_10(5).
5
6
7
8
9
10
true .
*/


testloop(0).
testloop(N) :- N>0, write('Number : '), write(N), nl, M is N-1, testloop(M).

/*
?- testloop(3).
Number : 3
Number : 2
Number : 1
true .

?- testloop(5).
Number : 5
Number : 4
Number : 3
Number : 2
Number : 1
true .
*/



test:-write('Type the word: '), read(Word),write('Input was '),write(Word), nl,(Word = end; test).

/*

?- test.
Type the word: welcome.
Input was welcome
Type the word: |: tceusl.
Input was tceusl
Type the word: |: end.
Input was end
true .
*/

gt(X,Y) :- X >= Y,write('X is greater or equal').
gt(X,Y) :- X < Y,write('X is smaller').
gte(X,Y) :- X > Y,write('X is greater').
gte(X,Y) :- X =:= Y,write('X and Y are same').
gte(X,Y) :- X < Y,write('X is smaller').

/*

?- gt(10,100).
X is smaller
true.

?- gt(150,100).
X is greater or equal
true .

?- gte(10,20).
X is smaller
true.

?- gte(100,100).
X and Y are same
true .

*/

count_down(L, H) :-between(L, H, Y),Z is H - Y,write(Z), nl.
count_up(L, H) :-between(L, H, Y),Z is L + Y,write(Z), nl.

/*

?- count_down(12,17).
5
true .

?-  count_up(5,12).
10
true .
*/

 parent(jhon,bob).
 parent(lili,bob).
 male(jhon).
 female(lili).
 father(X,Y) :- parent(X,Y),male(X).
 mother(X,Y) :- parent(X,Y),female(X).
 child_of(X,Y) :- father(X,Y);mother(X,Y).

father(a,b).
father(a,c).
father(b,d).
father(b,e).
father(c,f).

% a) Brothers: same father, different individuals
brother(X,Y):-father(Z,X),father(Z,Y),X \= Y.

% b) Cousins: their fathers are brothers
cousin(X,Y):-father(A,X),father(B,Y),brother(A,B).

% c) Grandson: X is son of Z, Z is son of Y
grandson(X,Y):-father(Z,X),father(Y,Z).

% d) Descendent: X is child or descendent of Y
descendent(X,Y):-father(Y,X).

descendent(X,Y):-father(Z,X),descendent(Z,Y).


father(a,b).
father(a,c).
father(b,d).
father(b,e).
father(c,f).


brother(X,Y) :- father(F,X), father(F,Y), X \= Y.

cousin(X,Y) :-father(F1,X),father(F2,Y),brother(F1,F2).

grandson(X,Y) :-father(Y,Z),father(Z,X).

descendent(X,Y) :-father(Y,X).
descendent(X,Y) :-father(Y,Z),descendent(X,Z).


/*
output
?- brother(b,c).      % true
?- cousin(d,f).       % true
?- grandson(d,a).     % true
?- descendent(f,a).   % true

brother(X,Y): [(b, c), (c, b)]
cousin(X,Y): [(d, f), (f, d), (e, f), (f, e), (e, d), (d, e)]
grandson(X,Y): [(d, a), (e, a), (f, a)]
descendent(X,Y): [(b, a), (c, a), (d, b), (e, b), (f, c)]
*/
