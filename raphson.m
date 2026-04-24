f = @(x) x^3 - 5*x + 1;
df = @(x) 3*x^2 - 5; % The derivative
x0 = 0; % Initial guess
tol = 1e-5;
max_iter = 100;

fprintf('\nIter\t x_curr\t\t f(x)\t\t f''(x)\t\t x_next\n');
for i = 1:max_iter
    y = f(x0);
    dy = df(x0);
    
    if dy == 0
        disp('Derivative is zero.'); break;
    end
    
    x1 = x0 - (y / dy);
    fprintf('%d\t %.5f\t %.5f\t %.5f\t %.5f\n', i, x0, y, dy, x1);
    
    if abs(x1 - x0) < tol
        break;
    end
    x0 = x1;
end