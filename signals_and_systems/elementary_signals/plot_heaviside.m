syms t
fplot(heaviside(t),[-1,1],'LineWidth',2),grid,ylim([0 1.25])
heaviside(0)