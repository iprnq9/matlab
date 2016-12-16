% HW 4.1: Read in and plot audio file
close all; clear all; clc;

[x,fs] = audioread('nineoneone.wav');

figure();
plot(x);
xlabel('Time (samples)');
ylabel('Voltage');
title('nineoneone.wav');
grid on;
