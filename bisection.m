clc; clear; close all;

e = 2.71828;
f = @(x) e^(-x) - x;
a = 0; b = 1;
tol = 1e-5;
max_iter = 100;

fprintf('Iter\t a\t\t b\t\t x\t\t f(x)\n');
for i = 1:max_iter
    c = (a + b) / 2;
    fc = f(c);
    fprintf('%d\t %.5f\t %.5f\t %.5f\t %.5f\n', i, a, b, c, fc);
    
    if abs(fc) < tol || (b - a)/2 < tol
        break;
    end
    
    if f(a) * fc < 0
        b = c;
    else
        a = c;
    end
end