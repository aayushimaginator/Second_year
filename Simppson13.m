%inetgration of f(x)=1/(5+3x); in the limits[1,2],with
%subintervals 4
f = @(x) 1/(5+3*x);
a=1;
b=2;
n=4;
h = (b - a) / n;
sum = 0;
x = a:h:b;
for i = 2:n
    sum = sum + f(x(i));
end
I = (h / 2) * (f(a) + (2 * sum) + f(b));
fprintf('The integral: %.6f\n', I);