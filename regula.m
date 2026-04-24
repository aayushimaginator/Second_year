a = 0; b = 1;
fprintf('\nIter\t a\t\t b\t\t x\t\t f(x)\n');
for i = 1:max_iter
    fa = f(a); fb = f(b);
    c = (a*fb - b*fa) / (fb - fa);
    fc = f(c);
    fprintf('%d\t %.5f\t %.5f\t %.5f\t %.5f\n', i, a, b, c, fc);
    
    if abs(fc) < tol
        break;
    end
    
    if fa * fc < 0
        b = c;
    else
        a = c;
    end
end