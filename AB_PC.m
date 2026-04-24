f = @(x,y) 1./(x.^2) - y./x;

h = 0.1;
tol = 0.00004;   % stopping condition

x = [1.0 1.1 1.2 1.3];
y = [1.0 0.996 0.986 0.972];

for i = 1:4
    fval(i) = f(x(i), y(i));
end

xp = 1.4;

yp = y(4) + (h/24)*(55*fval(4) - 59*fval(3) + 37*fval(2) - 9*fval(1));

y_old = yp;

while true
    fp = f(xp, y_old);
    
    y_new = y(4) + (h/24)*(9*fp + 19*fval(4) - 5*fval(3) + fval(2));
    if abs(y_new - y_old) < tol
        break;
    end
    
    y_old = y_new;
end

fprintf('y(1.4) = %.6f\n', y_new);