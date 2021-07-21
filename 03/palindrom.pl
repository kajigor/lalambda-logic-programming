append([], Y, Y). 
append([H|X], Y, [H|Z]) :- append(X, Y, Z).

rev([], []). 
rev([H|T], R) :- rev(T, R1), append(R1, [H], R).

palindrom(X) :- rev(X, X).
