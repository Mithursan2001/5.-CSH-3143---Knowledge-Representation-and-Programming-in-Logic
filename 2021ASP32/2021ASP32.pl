% ============================================
% Prolog Solutions for ICAE03
% ============================================

% ---------------------------
% 01. Robot – Key – Box Problem
% ---------------------------

initial(state(door, center, table, no, no)).
goal(state(door, _, _, _, yes)).

action(move(From, To),
       state(From, Box, Key, On, Has),
       state(To,   Box, Key, On, Has)).

action(push(From, To),
       state(From, From, Key, no, Has),
       state(To,   To,   Key, no, Has)).

action(climb_on,
       state(Pos, Pos, Key, no, Has),
       state(Pos, Pos, Key, yes, Has)).

action(climb_down,
       state(Pos, Box, Key, yes, Has),
       state(Pos, Box, Key, no, Has)).

action(pick_key,
       state(Pos, Box, Pos, On, no),
       state(Pos, Box, Pos, On, yes)).

action(drop_key,
       state(Pos, Box, Pos, On, yes),
       state(Pos, Box, Pos, On, no)).

solve_robot :- initial(S), dfs_robot(S, [], Path), write_list(Path).

dfs_robot(S, _, []) :- goal(S), !.
dfs_robot(S, Visited, [A|T]) :-
    action(A, S, S2),
    \+ member(S2, Visited),
    dfs_robot(S2, [S2|Visited], T).

write_list([]).
write_list([H|T]) :- write(H), nl, write_list(T).

% ---------------------------
% 02. Missionaries and Cannibals
% ---------------------------

initial_mc(state(3,3,0,0,left)).
goal_mc(state(0,0,3,3,right)).

safe(state(ML,CL,MR,CR,_)) :-
    (ML =:= 0 ; ML >= CL),
    (MR =:= 0 ; MR >= CR).

move_pair(1,0). move_pair(2,0).
move_pair(0,1). move_pair(0,2).
move_pair(1,1).

transition(state(ML,CL,MR,CR,left),
           state(ML2,CL2,MR2,CR2,right),(M,C)) :-
    move_pair(M,C),
    ML2 is ML - M, CL2 is CL - C,
    MR2 is MR + M, CR2 is CR + C,
    ML2>=0, CL2>=0,
    safe(state(ML2,CL2,MR2,CR2,right)).

transition(state(ML,CL,MR,CR,right),
           state(ML2,CL2,MR2,CR2,left),(M,C)) :-
    move_pair(M,C),
    MR2 is MR - M, CR2 is CR - C,
    ML2 is ML + M, CL2 is CL + C,
    MR2>=0, CR2>=0,
    safe(state(ML2,CL2,MR2,CR2,left)).

solve_mc :- initial_mc(S), dfs_mc(S, [], Path), write(Path).

dfs_mc(S, _, []) :- goal_mc(S), !.
dfs_mc(S, Visited, [(M,S2)|T]) :-
    transition(S, S2, M),
    \+ member(S2, Visited),
    dfs_mc(S2, [S2|Visited], T).

% ---------------------------
% 03. Water Jug Problem
% ---------------------------

initial_jug(state(0,0)).
goal_jug(state(2,_)).

action_j(fill4,  state(_,J3),    state(4,J3)).
action_j(fill3,  state(J4,_),    state(J4,3)).
action_j(empty4, state(_,J3),    state(0,J3)).
action_j(empty3, state(J4,_),    state(J4,0)).

action_j(pour4to3, state(J4,J3), state(J4R,J3R)) :-
    Space is 3 - J3,
    T is min(J4, Space),
    J4R is J4 - T,
    J3R is J3 + T.

action_j(pour3to4, state(J4,J3), state(J4R,J3R)) :-
    Space is 4 - J4,
    T is min(J3, Space),
    J4R is J4 + T,
    J3R is J3 - T.

solve_jug :- initial_jug(S), dfs_jug(S, [], Path), write_list(Path).

dfs_jug(S, _, []) :- goal_jug(S), !.
dfs_jug(S, Visited, [A|T]) :-
    action_j(A, S, S2),
    \+ member(S2, Visited),
    dfs_jug(S2, [S2|Visited], T).

% ---------------------------
% 04. 8-Puzzle
% ---------------------------

goal8([1,2,3,4,5,6,7,8,0]).

move_blank(P1, P2) :-
    (P2 is P1+1; P2 is P1-1; P2 is P1+3; P2 is P1-3).

valid(P1,P2) :-
    P1>=0, P1<9, P2>=0, P2<9,
    ((P1 mod 3) =:= (P2 mod 3) ; abs(P1-P2)=:=3).

replace([_|T],0,X,[X|T]).
replace([H|T],I,X,[H|R]) :- I>0, I1 is I-1, replace(T,I1,X,R).

shift(State, NewState) :-
    nth0(B,State,0),
    move_blank(B,P2),
    valid(B,P2),
    nth0(P2,State,Tile),
    replace(State,B,Tile,R1),
    replace(R1,P2,0,NewState).

% ---------------------------
% 05. Tower of Hanoi
% ---------------------------

hanoi(1,A,B,_) :- write(move(A,B)), nl.
hanoi(N,A,B,C) :-
    N>1, M is N-1,
    hanoi(M,A,C,B),
    hanoi(1,A,B,C),
    hanoi(M,C,B,A).

