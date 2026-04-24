% Parameters
f_sq = 20e3; % Frequency of square wave (20 kHz)
T_sq = 1/f_sq; % Period of square wave (50 microseconds)
fs = 1000000; % Sampling frequency (1 MHz)

% Time vector for square wave (2 periods)
t_sq = 0:(1/fs):(2*T_sq);  % Time vector for 2 cycles

% (a) Square wave with 40% TON
duty1 = 40; % Duty cycle for the first square wave
sq_wave1 = 50 * square(2 * pi * f_sq * t_sq, duty1);

% (b) Square wave with 30% TON (70% TOFF)
duty2 = 100 - 70; % Duty cycle for the second square wave
sq_wave2 = 50 * square(2 * pi * f_sq * t_sq, duty2);

% Product of square waves
product_sq = sq_wave1 .* sq_wave2;

% Plotting all in the same figure
figure;
hold on; % Retain current plot
plot(t_sq, sq_wave1, 'r', 'DisplayName', 'Square Wave 1 (40% TON)'); % Red line for sq_wave1
plot(t_sq, sq_wave2, 'b', 'DisplayName', 'Square Wave 2 (30% TON)'); % Blue line for sq_wave2
plot(t_sq, product_sq, 'g', 'DisplayName', 'Product of sq_wave1 and sq_wave2'); % Green line for product
hold off; % Release the plot hold

% Add title and labels
title('Square Waves and Their Product');
xlabel('Time (s)');
ylabel('Amplitude (V)');
legend show; % Display legend
grid on; % Add grid

r= rms(sq_wave1)
m= rms(sq_wave2)
s= rms(product_sq)