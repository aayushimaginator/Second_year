x = [1, 2, 4, 5];
y = [3, 1, 4, 2];

% Point to interpolate
xq = 7; 
yq = 0; 

n = length(x);

% Lagrange Interpolation
for j = 1:n
    L = 1;
    for k = 1:n
        if k ~= j
            L = L * (xq - x(k)) / (x(j) - x(k));
        end
    end
    
    yq = yq + y(j) * L;
end

% Display the result
fprintf('The interpolated value at x = %d is y = %.4f\n', xq, yq);