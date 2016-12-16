% HW 4.3-4: Read in and plot audio file using time in seconds
close all; clear all; clc;

[x,fs] = audioread('nineoneone.wav');

% To start at 10.3 sec:
%t = [(length(x)-1)*-1:0]/fs+10.3;

% To end at 10.3 sec:
t = [(length(x)-1)*-1:0]/fs+10.3;

figure();
plot(t,x);
xlabel('Time (sec)');
ylabel('Voltage');
title('nineoneone.wav');
grid on;
