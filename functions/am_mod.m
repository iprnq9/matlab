clc; clear all; close all;
j = sqrt(-1);

[m, fs] = audioread('nineoneone.wav');

m = m';

T = 1/(1*fs);
t = [0:(length(m)-1)]*T;

fc = 400;
%m = sin(2*pi*t);

yam = ammod(m,fc,fs);
yssb = ssbmod(m,fc,fs);

figure();
subplot(411); plot(t,m); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Message');

subplot(412); plot(t,yam); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Carrier');

subplot(413); plot(t,yssb); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Modulated Waveform');

f = fs*(0:(length(m)-1))/length(m);

Y = fft(yam); 
figure();
plot(f,abs(Y)); grid on;
title('Modulated Amplitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');





