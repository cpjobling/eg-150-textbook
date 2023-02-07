%% Reproduce Fig 1.8 from Karris (2012)
%% Plot the Unit Step

clf
syms t
u0(t) = heaviside(t); % allows us to type u0(t) in our formulae
A = 2; T = 2; % we need numerical values to get a successful plot
fplot(A*u0(t),'LineWidth',2),title('Unit step'),subtitle(texlabel('Au_0(t)')),grid,xlabel('t')
%% Example 3.1
% Use the MATLAB functions |subplot|, |heaviside| and |fplot| to reproduce the 
% figure below. 
% 
% 
% 
% We've done the first row for you.
%% 
% a). $-Au_0 (t)$

fig
sgtitle('Other forms of the unit step function');
subplot(331)
fplot(-A*u0(t),'LineWidth',2),grid,title(['a) ',texlabel('-A*u_0(t)')]),xlabel('t')
fig = gcf;
%% 
% b). $-A(t-T)$

subplot(332)
fplot(-A*u0(t - T),'LineWidth',2),grid,title(['b) ',texlabel('-A*u_0(t-T)')]),xlabel('t')
%% 
% c) $-A\left(t+T\right)$

subplot(333)
fplot(-A*u0(t + T),'LineWidth',2),grid,title(['c) ',texlabel('-A*u_0(t+T)')]),xlabel('t')
%% 
% Plot remaining examples
% 
% d). ${\textrm{Au}}_0 \left(-t\right)$

subplot(334)
fplot(A*u0(-t),'LineWidth',2),grid,title(['d) ',texlabel('A*u_0(-t)')]),xlabel('t')
%% 
% e). ${\mathrm{Au}}_0 \left(-t-T\right)$

subplot(335)
fplot(A*u0(-t-T),'LineWidth',2),grid,title(['e) ',texlabel('A*u_0(-t-T)')]),xlabel('t')
%% 
% f). ${\textrm{Au}}_0 \left(-t+T\right)$

subplot(336)
fplot(A*u0(-t + T),'LineWidth',2),grid,title(['f) ',texlabel('A*u_0(-t+T)')]),xlabel('t')
%% 
% g). ${-\textrm{Au}}_0 \left(-t\right)$

subplot(337)
fplot(-A*u0(-t),'LineWidth',2),grid,title(['g) ',texlabel('-A*u_0(-t)')]),xlabel('t')
%% 
% h). ${-\textrm{Au}}_0 \left(-t-T\right)$

subplot(338)
fplot(-A*u0(-t - T),'LineWidth',2),grid,title(['h) ',texlabel('-A*u_0(t-T)')]),xlabel('t')
%% 
% i). ${-\textrm{Au}}_0 \left(-t+T\right)$

subplot(339)
fplot(-A*u0(-t + T),'LineWidth',2),grid,title(['i) ',texlabel('-A*u_0(-t+T)')]),xlabel('t')
%%
exportgraphics(gcf,'pictures/unit_steps_plot.png')