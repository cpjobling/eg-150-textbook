%% Reproduce Fig 1.8 from Karris (2012)
%% Plot the Unit Step


syms t
u0(t) = heaviside(t); % allows us to type u0(t) in our formulae
A = 2; T = 2; % we need numerical values to get a successful plot
v1(t) = A*u0(t)
fplot(v1(t),'LineWidth',2),title('Unit step'),subtitle(texlabel('v_1(t) = Au_0(t)')),grid,xlabel('t')
%% Example 3.1
% Use the MATLAB functions |subplot|, |heaviside| and |fplot| to reproduce the 
% figure below. 
% 
% 
% 
% We've done the first row for you.
%% 
% a). $v_2 \left(t\right)\;=-Au_0 (t)$

clf % clear graphics
sgtitle('Other forms of the unit step function');
subplot(331)
v2(t) = -A*u0(t)
fplot(v2(t),'LineWidth',2),grid,title(['a) ',texlabel('v_2(t)=-A*u_0(t)')]),xlabel('t')
fig = gcf;
%% 
% b). $v_3 \left(t\right)-A(t-T)$

subplot(332)
v3(t) = -A*u0(t - T)
fplot(v3(t),'LineWidth',2),grid,title(['b) ',texlabel('v_3(t)=-A*u_0(t-T)')]),xlabel('t')
%% 
% c) $v_4 \left(t\right)-A\left(t+T\right)$

subplot(333)
v4(t) = -A*u0(t + T)
fplot(v4(t),'LineWidth',2),grid,title(['c) ',texlabel('v_4(t)=-A*u_0(t+T)')]),xlabel('t')
%% 
% Plot remaining examples
% 
% d). ${v_5 \left(t\right)=\textrm{Au}}_0 \left(-t\right)$

subplot(334)
v5(t) = A*u0(-t)
fplot(v5(t),'LineWidth',2),grid,title(['d) ',texlabel('v_5(t)=A*u_0(-t)')]),xlabel('t')
%% 
% e). $v_6 \left(t\right)={\textrm{Au}}_0 \left(-t-T\right)$

subplot(335)
v6(t) = A*u0(-t-T)
fplot(v6(t),'LineWidth',2),grid,title(['e) ',texlabel('v_6(t)=A*u_0(-t-T)')]),xlabel('t')
%% 
% f). ${v_7 \left(t\right)=\textrm{Au}}_0 \left(-t+T\right)$

subplot(336)
v7(t) = A*u0(-t + T)
fplot(v7(t),'LineWidth',2),grid,title(['f) ',texlabel('v_7(t)=A*u_0(-t+T)')]),xlabel('t')
%% 
% g). ${v_8 \left(t\right)=-\textrm{Au}}_0 \left(-t\right)$

subplot(337)
v8(t) = -A*u0(-t)
fplot(v8(t),'LineWidth',2),grid,title(['g) ',texlabel('v_8(t)=-A*u_0(-t)')]),xlabel('t')
%% 
% h). ${v_9 \left(t\right)=-\textrm{Au}}_0 \left(-t-T\right)$

subplot(338)
v9(t) = -A*u0(-t-T)
fplot(v9(t),'LineWidth',2),grid,title(['h) ',texlabel('v_9(t)=-A*u_0(t-T)')]),xlabel('t')
%% 
% i). ${v_{10} \left(t\right)=-\textrm{Au}}_0 \left(-t+T\right)$

subplot(339)
v10(t) = -A*u0(-t + T)
fplot(v10(t),'LineWidth',2),grid,title(['i) ',texlabel('v_{10}(t)=-A*u_0(-t+T)')]),xlabel('t')
%%
% Not needed in reference solution
exportgraphics(gcf,'pictures/unit_steps_plot.png')