freq = 1000;
fs = 44100;
t = [0:1/fs:1.5];
x = sin(2.*pi.*freq.*t);
plot(t,x)
xlabel('Samples');
ylabel('Amplitude');

audiowrite('tone.wav',x,fs);