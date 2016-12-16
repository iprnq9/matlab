close all; clear all; clc;

kf = 0.5;
fc = 1/10;
fm = 1/50;
n = [1:fm/4:256];

x = sin(2*pi*fm*n);
y = cos(2*pi*fc*n);
z = cos(2*pi*fc*n + 2*pi*kf*cos(2*pi*fm*n));

figure();
subplot(311); plot(n,y); title('Carrier'); ylabel('Amplitude');
subplot(312); plot(n,x); title('Message'); ylabel('Amplitdue');
subplot(313); plot(n,z); title('Modulated'); ylabel('Amplitdue');