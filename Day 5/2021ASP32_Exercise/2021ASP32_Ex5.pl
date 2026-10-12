male(john).
male(bob).
female(mary).
female(susan).
parent(john,bob).
parent(mary,bob).
parent(mary,susan).

father(X,Y):-parent(X,Y),male(X).
mother(X,Y):-parent(X,Y),female(X).
child(X,Y):-parent(Y,X).

/* output
?- mother(X, bob).
X = mary.

?- parent(X, susan).
X = mary.

?- female(X), child(X, _).
X = susan.
*/
