x = linspace(0, 2*pi, 100);

y1 = sin(x).^2;
y2 = cos(x).^2;
figure;
plot(y1,y2)

title('Sine Squared vs Cosine Squared');
xlabel('x');
ylabel('f(x)');

e= rms(y1)