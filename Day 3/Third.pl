likes(mary,food).
likes(mary,wine).
likes(john,wine).
likes(john,mary).

friends(X,Y):-likes(X,Y),likes(Y,X).
hates(X,Y):-not(likes(X,Y)).
enemies(X,Y):-not(likes(X,Y)),not(likes(Y,X)).

