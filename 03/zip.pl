zip([], [], []). 
zip([H0|T0], [H1|T1], [(H0,H1)|Res]) :- zip(T0, T1, Res).

