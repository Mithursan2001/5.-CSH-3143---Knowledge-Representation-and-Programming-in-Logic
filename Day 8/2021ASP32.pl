memberx(N,[N|_]).
memberx(N,[_|T]):-memberx(N,T).
/*
?- memberx(2,[1,2,3]).
true ;
false.

?- memberx([1,2,a],[1,2,3,[1,2,a]]).
true .

?- memberx(4,[1,2,3,[1,2,a]]).
false.
*/

insertinto(N, [], [N]).
insertinto(N,[H|T],[N,H|T]):-N=<H,!.
insertinto(N,[H|T],[H|Y]):-insertinto(N,T,Y).
/*
?- insertinto(3,[1,2,4,5], X).
X = [1, 2, 3, 4, 5].
*/

memberx(N,[N|_]).
memberx(N,[_|T]):-memberx(N,T).

deleteall(_,[],[]).
deleteall(N,[N|T],U):-!,deleteall(N,T,U).
deleteall(N,[H|T],[H|U]):-deleteall(N,T,U).

delete_dupl([],[]).
delete_dupl([H|T],Y):-memberx(H, T),!,deleteall(H,T,T1),delete_dupl(T1,Rest),Y=[H|Rest].
delete_dupl([_|T],Y):-delete_dupl(T,Y).

/*
?- delete_dupl([a,b,1,c,3,d,2,2,f,3], X).
X = [3, 2] ;
false.
*/


memberx(N,[N|_]).
memberx(N,[_|T]):-memberx(N,T).

delete_unique([],[]).
delete_unique([H|T],[H|Y]):-memberx(H,T),!,delete_unique(T,Y).
delete_unique([_|T],Y):-delete_unique(T,Y).

/*
 * ?- delete_unique([6,2,3,3,5,2,3,1,4], X).
X = [2, 3, 3].
?- delete_unique([6,2,3,3,5,2,3,1,4], X).
X = [2,3,3,2,3].
*/


memberx(N,[N|_]).
memberx(N,[_|T]):-memberx(N,T).

deleteall(_,[],[]).
deleteall(N,[N|T],U):-!,deleteall(N,T,U).
deleteall(N,[H|T],[H|U]):-deleteall(N,T,U).

make_unique([],[]).
make_unique([H|T],[H|Y]):-deleteall(H,T,T1),make_unique(T1,Y).
/*
?- make_unique([a,b,c,d,a,b,e,f], X).
X = [a,b,c,d,e,f].
*/


memberx(N,[N|_]).
memberx(N,[_|T]):-memberx(N,T).

make_unique([],[]).
make_unique([H|T],Y):-memberx(H,T),!,make_unique(T,Y).
make_unique([H|T],[H|Y]):-make_unique(T,Y).
/*
?- make_unique([a,b,c,d,a,b,e,f], X).
X = [c,d,e,f].
*/


maximumx(P,D,P):-P>=D,!.
maximumx(_,D,D).

max([H],H).
max([H|T], X):-max(T,S),maximumx(H,S,X).
/*
?- max([1,-2,3], X).
X = 3.
*/

morethan(_,[],[]).
morethan(K,[H|T],[H|U]):-H >= K,!,morethan(K,T,U).
morethan(K,[_|T],U):-morethan(K,T,U).

/*
?- morethan(5, [4,6,7,3], X).
X = [6,7].
*/


deleteall(_,[],[]).
deleteall(N,[N|T],U):-!,deleteall(N,T,U).
deleteall(N,[H|T],[H|U]):-deleteall(N,T,U).
/*
?- deleteall(3, [1,3,2,3,0,1,2], X).
X = [1,2,0,1,2].
*/


deleteat(_,[],[]).
deleteat(0,[_|T],T):-!.
deleteat(N,[H|T],[H|Y]):-N1 is N-1,deleteat(N1,T,Y).
/*
?- deleteat(2, [a,b,c,d], X).
X = [a,b,d].
*/

split_list(_,[],[[],[]]).
split_list(0,L,[[],L]).
split_list(N,[H|T],[[H|Y],Z]):-N1 is N-1,split_list(N1,T,[Y,Z]).
/*
?- split_list(4, [a,b,c,1,2,3,d,e,f], X).
X = [[a,b,c,1],[2,3,d,e,f]].
*/

