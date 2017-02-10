% FM Communication
% Author: Ian P. Roberts

clc; clear all; close all;
j = sqrt(-1);

T = 0.00001;
fs = 1/T;
t = 0:T:.1;

% Message
fm = 25;
m = sin(2*pi*fm*t);
m = exp(t*40);

% Carrier Wave
fc = 400;
c = sin(2*pi*fc*t);

% Frequency Modulation
delta_f = 200;
mi = delta_f / fm;
y = sin(2*pi*fc*t + (mi.*m));


% % Frequency Domain
% Y = fft(y);
% freq = [0:length(Y)-1]*fs/length(Y);
% 
% figure();
% plot(freq,abs(Y)); grid on;
% xlabel('Frequency (Hz)');
% ylabel('Amplitude');
% title('Amplitude Spectrum');
% xlim([0 (fc+delta_f)*1.1])

figure();
subplot(311); plot(t,m); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Message');

subplot(312); plot(t,c); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Carrier Wave');

subplot(313); plot(t,y); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Modulated Waveform');

