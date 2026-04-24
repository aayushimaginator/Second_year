clc;
clear;


x = [1 2 3 4];
y = [2 3 5 4];

n = length(x);
h = x(2) - x(1);

% Difference table
D = zeros(n,n);
D(:,1) = y';

for j = 2:n
    for i = 1:n-j+1
        D(i,j) = D(i+1,j-1) - D(i,j-1);
    end
end

xp = 2.5;

% Forward
pf = (xp - x(1)) / h;
yf = D(1,1);
term = 1;

for i = 1:n-1
    term = term * (pf - (i-1)) / i;
    yf = yf + term * D(1,i+1);
end

% Backward
pb = (xp - x(n)) / h;
yb = D(n,1);
term = 1;

for i = 1:n-1
    term = term * (pb + (i-1)) / i;
    yb = yb + term * D(n,i+1);
end

% Results
fprintf('Forward Interpolation = %.4f\n', yf);
fprintf('Backward Interpolation = %.4f\n', yb);