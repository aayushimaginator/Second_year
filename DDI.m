 x = [1, 2, 4, 5];
y = [3, 1, 4, 2];

xq = 7; 
n = length(x);


F = zeros(n, n);
F(:, 1) = y'; 

for j = 2:n
    for i = 1:(n - j + 1)
        
        F(i, j) = (F(i + 1, j - 1) - F(i, j - 1)) / (x(i + j - 1) - x(i));
    end
end

yq = F(1, 1);
x_term = 1;

for j = 2:n
    x_term = x_term * (xq - x(j - 1));
    yq = yq + F(1, j) * x_term;
end


fprintf('The interpolated value at x = %d is y = %.4f\n', xq, yq);