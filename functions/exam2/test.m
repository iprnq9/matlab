close all; clear all; clc;

[x,fs] = audioread('nineoneone.wav');
x = x(:); % make it a column vector

t = [0:length(x)-1]/fs;
t = t(:);

noise = sin(440*2*pi*t);

x = x/(sqrt(mean(x.^2)));
noise = noise/(sqrt(mean(noise.^2)));

SNR_dB = 10;

signal_amp = sqrt(10^(SNR_dB/10))

both = x*signal_amp + noise;

both = both / (max(abs(both)));

figure();
subplot(311); plot(t,x);
subplot(312); plot(t,noise);
subplot(313); plot(t,both);

sound(both,fs);