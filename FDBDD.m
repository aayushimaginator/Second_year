x = [3, 4, 5, 6]; 
y = [27, 64, 125, 216]; 
n = length(x);
h = x(2) - x(1);

D = zeros(n, n);
D(:, 1) = y';
for j = 2:n
    for i = 1:(n - j + 1)
        D(i, j) = D(i+1, j-1) - D(i, j-1);
    end
end

dy_forward = 0;
for i = 1:(n-1)
    sign = (-1)^(i-1); 
    dy_forward = dy_forward + (sign * D(1, i+1) / i);
end
dy_forward = dy_forward / h;

dy_backward = 0;
for i = 1:(n-1)
   
    dy_backward = dy_backward + (D(n-i, i+1) / i);
end
dy_backward = dy_backward / h;


fprintf('Derivative at start (x=%g) using Forward: %.4f\n', x(1), dy_forward);
fprintf('Derivative at end   (x=%g) using Backward: %.4f\n', x(n), dy_backward);