f = @(x,y) x^3 + y;

h = 0.2;
x = 0:h:0.6;

y(1) = 2;

for i = 1:3
    
    k1 = h * f(x(i), y(i));
    k2 = h * f(x(i) + h/2, y(i) + k1/2);
    k3 = h * f(x(i) + h/2, y(i) + k2/2);
    k4 = h * f(x(i) + h, y(i) + k3);
    
    y(i+1) = y(i) + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
end

disp(y)