[file, path] = uigetfile({'*.wav;*.mp3', 'Audio Files'}, 'Select Audio');
if isequal(file, 0), return; end
fullPath = fullfile(path, file);
[audio, fs] = audioread(fullPath);

if size(audio, 2) > 1, audio = mean(audio, 2); end
audio = audio / max(abs(audio));

h_low = ones(10, 1); 
h_high = [1, -1];   
lp_audio = audio;
hp_audio = audio;
fs_final = fs;

for i = 1:5
    lp_audio = conv(lp_audio, h_low, 'same');
    lp_audio = decimate(lp_audio, 2);
    hp_audio = conv(hp_audio, h_high, 'same');
    hp_audio = decimate(hp_audio, 2);
    fs_final = fs_final / 2;
end

lp_audio = lp_audio / max(abs(lp_audio));
hp_audio = hp_audio / max(abs(hp_audio));

figure('Name', 'Low-Pass vs High-Pass Comparison');
t_final = (0:length(lp_audio)-1) / fs_final;

subplot(2,1,1);
plot(t_final, lp_audio, 'Color', [0, 0.5, 0]);
title('Low Pass (5x Convolve + Decimate)');
ylabel('Amplitude'); grid on;

subplot(2,1,2);
plot(t_final, hp_audio, 'Color', [0.8, 0.2, 0]);
title('High Pass (5x Convolve + Decimate)');
ylabel('Amplitude'); xlabel('Time (s)'); grid on;

fprintf('Playing Low Pass (Should sound muffled/bassy)...\n');
sound(lp_audio, fs_final);
pause(length(lp_audio)/fs_final + 1);

fprintf('Playing High Pass (Should sound tinny/sharp/noisy)...\n');
sound(hp_audio, fs_final);