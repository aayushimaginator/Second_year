%question:find inetgration of f(x)=1/(5+3x); in the limits[1,2],with
%subintervals 3
f = @(x) 1 / (5 + 3*x);
a = 1;
b = 2;
n = 3; 
h = (b - a) / n;
x = a:h:b;
sum = 0;
for i = 2:n
     sum = sum + f(x(i));
end
I = (3*h / 8) * (f(a) + (3 * sum) + f(b));
fprintf('The integral: %.6f\n', I)