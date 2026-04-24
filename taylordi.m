clear; clc;
f = @(x,y) exp(x + y);
ax = 0;  bx = 1;
ay = 0;  by = 2;
order = 8;   % Try 4, 6, 8, 10...
cx = (ax + bx)/2;
cy = (ay + by)/2;

syms x y
fsym = f(x, y);
T = taylor(fsym, [x y], 'ExpansionPoint', [cx cy], 'Order', order+1);
I_approx = double(int(int(T, y, ay, by), x, ax, bx));
fprintf('Approximate double integral using Taylor series (order %d) = %.5f\n', order, I_approx);
I_exact = integral2(f, ax, bx, ay, by);
fprintf('Accurate value = %.5f\n', I_exact);
fprintf('Absolute error = %.5f\n', abs(I_approx - I_exact));