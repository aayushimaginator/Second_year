close all;
clear;

[file, path] = uigetfile({'*.wav;*.mp3', 'Audio Files'}, 'Select Audio');
if isequal(file, 0), return; end
fullPath = fullfile(path, file);
[y, fs] = audioread(fullPath); 
y = y(:,1)';
N = length(y);
h_lp = [1, 1] / sqrt(2); 
h_hp = [1, -1] / sqrt(2);
g_lp = h_lp; 

details = cell(1, 5);
approximations = cell(1, 5);
current_sig = y;

fprintf('\n--- Playing Original Audio ---\n');
sound(y, fs);
pause(N/fs + 1);
fprintf('--- Starting 5-Level Decomposition ---\n');

for i = 1:5
    lp_filtered = conv(current_sig, h_lp, 'same');
    hp_filtered = conv(current_sig, h_hp, 'same');
    current_sig = lp_filtered(1:2:end); 
    details{i} = hp_filtered(1:2:end);
    approximations{i} = current_sig; 
    temp_stretch = current_sig;
    for j = 1:i
        upsampled = zeros(1, length(temp_stretch) * 2);
        upsampled(1:2:end) = temp_stretch;
        temp_stretch = conv(upsampled, g_lp, 'same');
    end
    play_me = zeros(1, N);
    len = min(length(temp_stretch), N);
    play_me(1:len) = temp_stretch(1:len);
    
    fprintf('Playing Level %d Low-Pass (Muffled)...\n', i);
    sound(play_me, fs); 
    pause(N/fs + 0.5); 
end
recon_signal = approximations{5}; 
g_hp = -h_hp; 

for i = 5:-1:1
    up_low = zeros(1, length(recon_signal) * 2);
    up_low(1:2:end) = recon_signal;
    recon_signal = conv(up_low, g_lp, 'same');
end
recon_signal = recon_signal(1:N);

fprintf('Playing Final Reconstruction...\n');
sound(recon_signal, fs);
figure('Name', 'Simplified Signal Analysis');
subplot(3,1,1); 
plot(y); 
title('Original Signal (Full Bandwidth)');
grid on;
subplot(3,1,2); 
plot(approximations{5}, 'Color', [0 .5 .5]); 
title('Level 5 Low-Pass (Highly Decimated)');
grid on;
subplot(3,1,3); 
plot(recon_signal, 'r'); 
title('Final Reconstructed Signal');
grid on;