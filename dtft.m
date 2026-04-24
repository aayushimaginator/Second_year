N = 10;
k = -30:0.5:30;
numerator   = sin(k * (pi/5) * (5/2));
denominator = sin(k * (pi/10));

x1 = zeros(size(k));
for i = 1:length(k)
    if abs(denominator(i)) < 1e-10  
        x1(i) = N;
    else
        x1(i) = numerator(i) / denominator(i);
    end
end

figure;
plot(k, x1);

figure;
stem(k, x1, 'filled');