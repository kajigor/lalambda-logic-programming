and(true, true, true).
and(false, true, false).
and(true, false, false).
and(false, false, false).

or(true, true, true).
or(false, true, true).
or(true, false, true).
or(false, false, false).

not(true, false).
not(false, true).

eval(St, conj(X, Y), U) :- eval(St, X, V), eval(St, Y, W), and(V, W, U).
eval(St, disj(X, Y), U) :- eval(St, X, V), eval(St, Y, W), or(V, W, U).
eval(St, neg(X), U) :- eval(St, X, V), not(V, U).
eval(St, var(Z), U) :- elem(Z, St, U).

elem(o, cons(H, _), H).
elem(s(N), cons(_, T), V) :- elem(N, T, V).
