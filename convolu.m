[file, path] = uigetfile({'*.wav;*.mp3', 'Audio Files'}, 'Select Audio');
if isequal(file, 0), return; end
fullPath = fullfile(path, file);
[audio, fs] = audioread(fullPath);

if size(audio, 2) > 1, audio = mean(audio, 2); end

audio = audio / max(abs(audio));
fprintf('Playing Original Audio...\n');
sound(audio, fs);
pause(length(audio)/fs + 0.5);

step_len = 100; 
h = ones(step_len, 1);
convolved_audio = audio;

for i = 1:5
    convolved_audio = conv(convolved_audio, h, 'same');
    convolved_audio = convolved_audio / max(abs(convolved_audio));
    fprintf('Playing Audio after Convolution #%d...\n', i);
    sound(convolved_audio, fs);
    pause(length(convolved_audio)/fs + 0.5); 
end

fprintf('Done!\n');
