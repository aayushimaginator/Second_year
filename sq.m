V = 50;
f = 20000;
t = 0:1/f:0.1;
duty = 50;
y = V*square(2*pi*f*t, duty);

figure;
plot(t, y, 'b-', 'LineWidth', 2);
title('Square Wave: V = 50V, Frequency = 20 kHz');
xlabel('Time (s)');
ylabel('Voltage (V)');

r = rms(y)