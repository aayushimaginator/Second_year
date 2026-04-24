t = 0:0.01:2*pi; 
amplitude = 1;   
frequency = 1;   

y = amplitude * sin(frequency * t);

figure;
plot(t, y);
title('Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');