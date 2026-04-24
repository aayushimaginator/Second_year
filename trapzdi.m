clear; clc;
f = @(x,y) x.^3 + y.^2 + x + 3;
a = 0; b = 2;
c = 0; d = 3;
nx = 50;
ny = 50;
x = linspace(a, b, nx+1);
y = linspace(c, d, ny+1);

[X, Y] = meshgrid(x, y);
Z = f(X, Y);
Ix = trapz(x, Z, 2);
I  = trapz(y, Ix);
fprintf('Approximate value of double integral = %.5f\n', I);
I_exact = integral2(f, a, b, c, d);
fprintf('Accurate value = %.5f\n', I_exact);
fprintf('Absolute error = %.5f\n', abs(I - I_exact));