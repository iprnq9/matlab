% HW 4.2: Read in and plot audio file using time in seconds
close all; clear all; clc;

[x,fs] = audioread('nineoneone.wav');

t = [0:length(x)-1]/fs;
figure();
plot(t,x);
xlabel('Time (sec)');
ylabel('Voltage');
title('nineoneone.wav');
grid on;
