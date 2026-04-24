g = @(x) (x^3 + 1) / 5; % The rearranged function
x0 = 0;
fprintf('\nIter\t x_prev\t\t x_new\t\t error\n');
for i = 1:max_iter
    x_new = g(x0);
    err = abs(x_new - x0);
    fprintf('%d\t %.5f\t %.5f\t %.5f\n', i, x0, x_new, err);
    
    if err < tol
        break;
    end
    x0 = x_new;
end