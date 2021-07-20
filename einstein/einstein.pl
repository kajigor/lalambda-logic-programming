len([], 0).
len([_|T], N) :- len(T, N1), N is N1 + 1.

leftToRight(X, Y, [X, Y | _]).
leftToRight(X, Y, [_ | T]) :- leftToRight(X, Y, T).

adjacent(A, B, List) :- leftToRight(A, B, List); leftToRight(B, A, List).

nth(1, [X|_], X).
nth(2, [_,X|_], X).
nth(3, [_,_,X|_], X).
nth(4, [_,_,_,X|_], X).
nth(5, [_,_,_,_,X|_], X).

mem(X, [X|_]).
mem(X, [_|T]) :- mem(X, T).

% solve/2 - The main predicate for solving the puzzle
solve(WaterDrinker, ZebraOwner, Street) :-
  % На улице стоят пять домов.
  len(Street, 5),
  % Англичанин живёт в красном доме.
  mem(h(english, red, _, _, _), Street),
  % У испанца есть собака.
  mem(h(spanish, _, dog, _, _), Street),
  % В зелёном доме пьют кофе.
  mem(h(_, green, _, coffee, _), Street),
  % Украинец пьёт чай.
  mem(h(ukrainian, _, _, tea, _), Street),
  % Зелёный дом стоит сразу справа от белого дома.
  leftToRight(h(_, white, _, _, _), h(_, green, _, _, _), Street),
  % Тот, кто курит Old Gold, разводит улиток.
  mem(h(_, _, snails, _, old_gold), Street),
  % В жёлтом доме курят Kool.
  mem(h(_, yellow, _, _, kool), Street),
  % В центральном доме пьют молоко.
  nth(3, Street, h(_, _, _, milk, _)),
  % Норвежец живёт в первом доме.
  nth(1, Street, h(norwegian, _, _, _, _)),
  % Сосед того, кто курит Chesterfield, держит лису.
  adjacent(h(_, _, _, _, chesterfield), h(_, _, fox, _, _), Street),
  % В доме по соседству с тем, в котором держат лошадь, курят Kool.
  adjacent(h(_, _, _, _, kool), h(_, _, horse, _, _), Street),
  % Тот, кто курит Lucky Strike, пьёт апельсиновый сок.
  mem(h(_, _, _, orange_juice, lucky_strike), Street),
  % Японец курит Parliament.
  mem(h(japanese, _, _, _, parliament), Street),
  % Норвежец живёт рядом с синим домом.
  adjacent(h(norwegian, _, _, _, _), h(_, blue, _, _, _), Street),
  % Кто пьёт воду?
  mem(h(WaterDrinker, _, _, water, _), Street),
  % Кто держит зебру?
  mem(h(ZebraOwner, _, zebra, _, _), Street).

?- solve(X,Y,Street).
