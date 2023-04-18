%% solution12_6 - Verification of Solution for Example 12.6 from notes.
syms s;
% -

Z1 = 13*s + 8/s;
Z2 = 5*s + 10;
Z3 = 20 + 16/s;

Z = Z1 + Z2 * Z3 /(Z2 + Z3)