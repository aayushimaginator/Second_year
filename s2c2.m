x = linspace(0, 2*pi, 100); % 100 points from 0 to 2π

y1 = sin(x).^2; 
y2 = cos(x).^2; 


figure;
plot(x, y1, 'b-', 'LineWidth', 2);
hold on; 
plot(x, y2, 'r-', 'LineWidth', 2);
hold off;

title('Sine Squared and Cosine Squared');
xlabel('x (radians)');
ylabel('Function Value');
legend('sin^2(x)', 'cos^2(x)');

r= rms(y1)
m= rms(y2)