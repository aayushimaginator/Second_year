f =@(x) 1/(1+x);

a = input('Enter lower limit (a): ');
b = input('Enter upper limit (b): ');
n = input('Enter number of subintervals (n): ');

h = (b - a) / n;
x = a:h:b;

sum = f(a) + f(b);

for i = 2:n
    sum = sum + 2 * f(x(i));
end

I = (h/2) * sum;
fprintf('Approximate integral = %.6f\n', I);