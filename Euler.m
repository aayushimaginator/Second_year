clc;
clear;

% Define function dy/dx = f(x,y)
f = @(x,y) x + y;

% Initial conditions
x = 0;
y = 1;

% Step size
h = 0.1;

% Target point
x_end = 0.1;

% Euler iteration
while x < x_end
    y = y + h * f(x,y);
    x = x + h;
end

fprintf('Value of y at x = %.2f is %.4f\n', x, y);