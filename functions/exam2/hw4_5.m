% HW 4.5: Read in and plot audio file from 1000-2000 mseconds
close all; clear all; clc;

[x,fs] = audioread('nineoneone.wav');

t = [0:(length(x)-1)]/fs*1000;

start = round(100e-3 * fs);
stop  = round(200e-3 * fs);
x = x(start:stop);
x = x(:);

t = [0:length(x)-1]*1000/fs;

figure();
plot(t,x);
xlabel('Time (msec)');
ylabel('Voltage');
title('nineoneone.wav');
grid on;
