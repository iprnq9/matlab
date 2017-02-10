clear all; close all; clc;

j = sqrt(-1);

t = 0:0.001:10;

x = 5*sin(7*t - pi/2);

plot(t,x);

X = fft(x);

f = 
plot(X);