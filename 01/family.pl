child(X,Y) :- parent(Y,X).
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
halfSibling(X,Y) :- parent(Z,X), parent(Z,Y), parent(W, X), parent(V, Y), X \== Y, Z \== W, Z \== V, W \== V.
sibling(X,Y) :- parent(Z,X), parent(Z,Y), parent(W,X), parent(W,Y), X \== Y, Z \== W.
mom(X,Y) :- parent(X,Y), female(X).
dad(X,Y) :- parent(X,Y), male(X). 
brother(X,Y) :- sibling(X,Y), male(X). 
sister(X,Y) :- sibling(X,Y), female(X). 
aunt(X,Y) :- sister(X,Z), parent(Z,Y).
uncle(X,Y) :- brother(X,Z), parent(Z,Y).


parent(d, me).
parent(m, me). 
parent(d, s).
parent(m, s). 
parent(d, b).
parent(m, b). 
parent(mm, m). 
parent(dm, m). 
parent(mm, sm). 
parent(dm, sm). 
parent(wdm, bm).
parent(dm, bm). 
parent(md, d). 
parent(dd, d).
parent(mmm,mm).
parent(dmm,mm).
parent(mdm, dm). 
parent(ddm, dm). 
parent(mmd, md). 
parent(dmd, md). 
parent(mmd, bmd). 
parent(dmd, bmd). 
parent(mdd, dd). 
parent(ddd, dd). 

male(b).
male(bm).
male(d).
male(dm). 
male(bmd). 
male(dd).
male(dmm).
male(ddm).
male(dmd).
male(ddd). 

female(s).
female(sm).
female(m).
female(mm).
female(md).
female(mmm).
female(mdm).
female(mmd).
female(mdd).
female(wdm).
