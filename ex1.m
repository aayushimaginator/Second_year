clear
clc

% % 1. Signal Generation Parameters
fs = 1000;    % Sampling frequency 
t = 0:1/fs:1; %0.04;      % Time vector (for 2 cycles=0.04)

% % a. Sine and Cosine waveforms
% Vpeak = 20; f = 50;
% 
% sine_wave = Vpeak * sin(2*pi*f*t);  %Mathematical eqn
% cosine_wave = Vpeak * cos(2*pi*f*t);
% 
% figure;
% subplot(2,1,1);
% plot(t, sine_wave);
% title('Sine Wave (20V, 50Hz)');
% xlabel('Time (s)');
% ylabel('Amplitude (V)');
% 
% subplot(2,1,2);
% plot(t, cosine_wave);
% title('Cosine Wave (20V, 50Hz)');
% xlabel('Time (s)');
% ylabel('Amplitude (V)');
% 
% plot(t, sine_wave); hold on; plot(t, cosine_wave);


% % % %% b. Mathematical operations: (sine)^2 and (cosine)^2
% sine_sq = sine_wave.^2;
% cosine_sq = cosine_wave.^2;
% % 
% figure;
% plot(sine_sq, cosine_sq);
% % title('(Sine)^2 vs (Cosine)^2');
% xlabel('Sine^2');
% ylabel('Cosine^2'); 
% grid on;
% 
% plot(sine_wave, cosine_wave)

% % %% c. Square waveforms
% f_sq = 20e3; % 20 kHz
% T_sq = 1/f_sq; % 50 micro-sec
% fs = 1000000;
% 
% % % Time vector for square wave (shorter for 20kHz signals)
% t_sq = 0:(1/fs):(2*T_sq);  % n*T_sq where n=no. of cycles
% 
% % % (a) Square wave with 40% TON
% duty1 = 40;
% sq_wave1 = 50 * square(2*pi*f_sq*t_sq, duty1);
% 
% % % (b) Square wave with 70% TOFF → 30% TON
% duty2 = 100-70;
% sq_wave2 = 50 * square(2*pi*f_sq*t_sq, duty2);
% % 
% figure;
% subplot(2,1,1);
% plot(t_sq, sq_wave1); 
% title('Square Wave 1 (50V, 20kHz, 40% TON)');
% xlabel('Time (s)');
% ylabel('Amplitude (V)');
% 
% subplot(2,1,2);
% plot(t_sq, sq_wave2);
% title('Square Wave 2 (50V, 20kHz, 70% TOFF)');
% xlabel('Time (s)');
% ylabel('Amplitude (V)');
% % % 
% % % %% d. Product of square waves
% product_sq = sq_wave1 .* sq_wave2;
% 
% figure;
% plot(t_sq, product_sq);
% title('Product of Square Wave 1 and Square Wave 2');
% xlabel('Time (s)');
% ylabel('Amplitude (V)');


% % %% e. Triangular signals with phase shifts
% f_tri = 1e3;   % 1 kHz
% T_tri = 1/f_tri; 
% fs = 1e5;
% t_tri = 0:1/fs:2*T_tri;  % n*T_ri where n=no. of cycles
% 
% % Base triangular signal
% tri_base = sawtooth(2*pi*f_tri*t_tri, 0.5);  % 0.5 controls the symmetry; like here symmetric triangle
% tri90 = sawtooth(2*pi*f_tri*t_tri + pi/2, 0.5);
% tri180 = sawtooth(2*pi*f_tri*t_tri + pi, 0.5);
% 
% % Normalize to same peak
% % tri_base = tri_base * 20;
% % tri90 = tri90 * 20;
% % tri180 = tri180 * 20;
% % 
% tri_sum = tri_base + tri90 + tri180;
% 
% figure;
% plot(t_tri, tri_base, '-r', t_tri, tri90, '-y', t_tri, tri180, '-b'); %, t_tri, tri_sum, '-k');
% title('Triangular Signals (0°, 90°, 180°) and Their Sum');
% xlabel('Time (s)');
% ylabel('Amplitude (V)');
% % % 

% %%%%%% Calculations %%%%
% RMS_sine = rms(sine_wave)   %For Sine-signal
% Vpk  = max(abs(sine_wave))

% Vrms = rms(tri_base)      %For triangular-signal
% Vpk  = max(abs(tri_base))
