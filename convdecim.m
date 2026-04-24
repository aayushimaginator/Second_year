[file, path] = uigetfile({'*.wav;*.mp3', 'Audio Files'}, 'Select Audio');
if isequal(file, 0), return; end
fullPath = fullfile(path, file);
[audio, fs] = audioread(fullPath);


audio = audio / max(abs(audio));
fprintf('Playing Original Audio (Fs = %d Hz)...\n', fs);
sound(audio, fs); 
pause(length(audio)/fs + 0.5);

step_len = 100; 
h = ones(step_len, 1);
current_audio = audio;
current_fs = fs;

for i = 1:5
    current_audio = conv(current_audio, h, 'same');
    current_audio = decimate(current_audio, 2);
    current_fs = current_fs / 2;
    current_audio = current_audio / max(abs(current_audio));
    fprintf('Iteration %d: Fs = %d Hz | Samples = %d\n', i, round(current_fs), length(current_audio));
    if current_fs < 1000
        fprintf('Sampling rate too low for standard playback. Skipping audio.\n');
    else
        sound(current_audio, current_fs);
        pause(length(current_audio)/current_fs + 0.5); 
    end
end