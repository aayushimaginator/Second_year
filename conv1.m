[file, path] = uigetfile({'*.wav;*.mp3', 'Audio Files'}, 'Select Audio');
if isequal(file, 0), return; end
fullPath = fullfile(path, file);
[audio, fs] = audioread(fullPath);

if size(audio, 2) > 1, audio = mean(audio, 2); end
audio_orig = audio / max(abs(audio));

step_len = 10;
h = ones(step_len, 1);
audio_proc = audio_orig;
fs_proc = fs;

for i = 1:5
    audio_proc = conv(audio_proc, h, 'same');
    audio_proc = decimate(audio_proc, 2);
    fs_proc = fs_proc / 2;
end

audio_proc = audio_proc / max(abs(audio_proc));
figure('Name', 'Original vs. 5x Processed Audio', 'Position', [100, 100, 800, 600]);
subplot(2,1,1);
t_orig = (0:length(audio_orig)-1)/fs;
plot(t_orig, audio_orig, 'b');
title(['Original Audio (Fs: ', num2str(fs), ' Hz)']);
xlabel('Time (seconds)'); ylabel('Amplitude');
grid on;

subplot(2,1,2);
t_proc = (0:length(audio_proc)-1)/fs_proc;
plot(t_proc, audio_proc, 'r');
title(['After 5 Convolutions & Decimations (Fs: ', num2str(round(fs_proc)), ' Hz)']);
xlabel('Time (seconds)'); ylabel('Amplitude');
grid on;
fprintf('Playing Original...\n');
sound(audio_orig, fs);
pause(length(audio_orig)/fs + 1);

fprintf('Playing Final Processed Audio...\n');