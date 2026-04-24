x0 = 0; x1 = 1;
fprintf('\nIter\t x0\t\t x1\t\t x2\t\t f(x2)\n');
for i = 1:max_iter
    fx0 = f(x0);
    fx1 = f(x1);
    
    if (fx1 - fx0) == 0
        disp('Denominator is zero.'); break;
    end
    
    x2 = x1 - (fx1 * (x1 - x0)) / (fx1 - fx0);
    fx2 = f(x2);
    fprintf('%d\t %.5f\t %.5f\t %.5f\t %.5f\n', i, x0, x1, x2, fx2);
    
    if abs(fx2) < tol
        break;
    end
    x0 = x1;
    x1 = x2;
end