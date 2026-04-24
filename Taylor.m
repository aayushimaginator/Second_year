clc;
clear;

% Function dy/dx
f = @(x,y) x + y;

% Initial values
x = 0;
y = 1;

h = 0.1;

% First derivative
y1 = f(x,y);

% Second derivative: y'' = 1 + x + y
y2 = 1 + x + y;

% Taylor 2nd order approximation
y_next = y + h*y1 + (h^2/2)*y2;

x_next = x + h;

fprintf('Value of y at x = %.1f is %.6f\n', x_next, y_next);