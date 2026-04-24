%Adams-Bashforth method
f = @(x,y) x + y;
x0 = 0; y0 = 1; h = 0.1; xn = 0.5;
x = x0:h:xn;
n = length(x);
y = zeros(1, n);
y(1) = y0;
for i = 1:3
    k1 = h * f(x(i), y(i));
    k2 = h * f(x(i) + h/2, y(i) + k1/2);
    k3 = h * f(x(i) + h/2, y(i) + k2/2);
    k4 = h * f(x(i) + h, y(i) + k3);
    y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
end
for i = 4:n-1
    y(i+1) = y(i) + h/24 * (55*f(x(i),y(i)) - 59*f(x(i-1),y(i-1)) + 37*f(x(i-2),y(i-2)) - 9*f(x(i-3),y(i-3)));
end
disp([x' y'])