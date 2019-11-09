path(a, b, 10).
path(a, e, 30).
path(b, c, 15).
path(c, f, 10).
path(d, c, 5).
path(d, b, 10).
path(e, f, 5).
path(f, d, 10).
path(g, c, 15).
path(g, d, 10).

bpath(A, B, D) :- 
    path(A, B, D).
bpath(A, B, D) :-
    path(B, A, D).

solve(A, A, [A], 0).
solve(A, B, P, D) :-
    solve(A, B, P, D, [A]).

solve(A, B, [A, B], D, V) :-
    bpath(A, B, D),
    \+member(B, V).
solve(A, B, [A | P], D, V) :-
    bpath(A, C, M),
    \+member(C, V),
    C \== B,
    solve(C, B, P, N, [C | V]),
    D is M + N.

%test cases that I used
%
%solve(a, a, P, D).
%solve(a, b, P, D).
%solve(a, d, P, D).
%solve(d, a, P, D).
%solve(f, e, P, D).
%solve(d, f, P, D).