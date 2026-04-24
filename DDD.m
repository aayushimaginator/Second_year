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

for j = 2:n
    
    sum_term = 0;
    
    for m = 1:(j-1)
        product_term = 1;
        for k = 1:(j-1)
            if k ~= m
                product_term = product_term * (xq - x(k));
            end
        end
        sum_term = sum_term + product_term;
    end
    
   
    yq_prime = yq_prime + F(1, j) * sum_term;
end

fprintf('The interpolated derivative f''(x) at x = %d is %.4f\n', xq, yq_prime);