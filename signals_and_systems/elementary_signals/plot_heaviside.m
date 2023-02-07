syms t
fplot(heaviside(t),[-1,1],'LineWidth',2),grid,ylim([0 1.25]),...
title('The Heaviside function $$u_0(t)$$','interpreter','latex'),xlabel('t')
heaviside(0)