recObj = audiorecorder(8000, 8, 1);
disp('Speak now...');
recordblocking(recObj, 5);
y = getaudiodata(recObj);
fs = recObj.SampleRate;
t = (0:length(y)-1)/fs;
plot(t, y);
xlabel('Time (s)'); ylabel('Amplitude'); title('Live Audio Signal');
sound(y,fs);

T = (-length(y)+1:0)/fs;
plot(T, y);