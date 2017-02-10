clc; clear all; close all;
j = sqrt(-1);

fs = 100000;
T = 1/fs;
N = 10000;
t = [0:(N-1)]*T;

fc = 2000;
c = cos(pi*fc.*t);

m = cos(20*pi*t);

y = (m).*c;

figure();
subplot(411); plot(t,m); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Message');

subplot(412); plot(t,c); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Carrier');

subplot(413); plot(t,y); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Modulated Waveform');