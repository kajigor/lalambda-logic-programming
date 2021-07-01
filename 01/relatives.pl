:- consult('family.pl').

child(X,Y) :- parent(Y,X).

grandparent(X,Y) :- parent(X, Z), parent(Z, Y).

mother(X,Y) :- female(X), parent(X,Y).
father(X,Y) :- male(X), parent(X,Y).

sameParent(P,X,Y) :- parent(P,X), parent(P,Y).

sameMother(X,Y) :- sameParent(P,X,Y), female(P).
sameFather(X,Y) :- sameParent(P,X,Y), male(P).

sibling(X,Y) :- sameMother(X,Y), sameFather(X,Y), X \== Y.

halfSibling(X,Y) :- sameMother(X,Y), \+ sameFather(X,Y).
halfSibling(X,Y) :- sameFather(X,Y), \+ sameMother(X,Y).

uncle(X,Y) :-
  parent(Z,Y), (halfSibling(X,Z); sibling(X,Z)), male(X).

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).

% ancestor(X,Y) :- parent(X,Z), (Y = Z; ancestor(Z,Y)).

