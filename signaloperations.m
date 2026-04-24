t=0:0.01:5*pi;
y = sin(t);
y1 = sin(t+1);
y2 = sin(-t+1);

figure;
plot(t, y);
hold on;
plot(t,y1);
plot(t,y2);
hold off;
grid on;