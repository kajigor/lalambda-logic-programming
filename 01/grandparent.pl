grandparent(X,Y) :- parent(X, Z), parent(Z, Y).
sibling(X,Y) :- parent(Z, X), parent(Z, Y).
cousin(X,Y) :- grandparent(Z,X), grandparent(Z,Y).

parent(grandgrandfather_f_f,grandfather_f).
parent(grandgrandmother_f_f,grandfather_f).
parent(grandgrandfather_f_m,grandmother_f).
parent(grandgrandfather_f_m,grandmother_f).
parent(grandgrandfather_m_f,grandfather_m).
parent(grandgrandmother_m_f,grandfather_m).
parent(grandgrandfather_m_m,grandmother_m).
parent(grandgrandfather_m_m,grandmother_m).
parent(grandfather_f, father).
parent(grandmother_f, father). 
parent(grandfather_m, mother). 
parent(grandmother_m, mother).
parent(father, me). 
parent(mother, me).
parent(father, brother). 
parent(mother, brother). 
parent(grandmother_m, aunt).
parent(grandmother_m, uncle).
