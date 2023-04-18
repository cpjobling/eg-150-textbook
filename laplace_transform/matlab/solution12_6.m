%% solution5 - Verification of Solution for Example 12.6 from notes.
syms s;
% -

z1 = 13*s + 8/s;
z2 = 5*s + 10;
z3 = 20 + 16/s;

z = z1 + z2 * z3 /(z2 + z3)