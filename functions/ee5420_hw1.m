% Homework 1
% EE 5420
% Author: Ian Roberts

clc; clear all; close all;

% Part 1
fs = 1000;
t = -10:1/fs:10;

A = pi;
f0 = 200;
x = A*cos(2*pi*f0*t);
figure();
plot(t,x); grid on; hold on;
xlabel('Time (s)'); ylabel('Amplitude (V)');
title('Part 1a');

A = sqrt(5);
f0 = log(4);
x = A*cos(2*pi*f0*t).*(le(t,(1/f0)) & ge(t,(-1/f0)));
figure();
plot(t,x); grid on; hold on;
xlabel('Time (s)'); ylabel('Amplitude (V)');
title('Part 1b');

A = factorial(5);
a = 4;
x = A*exp(-a*t).*(gt(t,0) & ge(a,0));
figure();
plot(t,x); grid on; hold on;
xlabel('Time (s)'); ylabel('Amplitude (V)');
title('Part 1c');


% Part 2
T = 0.001;
t = 0:T:9.8777;
x1 = 10*cos(10*t);
x2 = 20*cos(20*t);
x = x1 + x2;
figure();
subplot(311);
plot(t,x); grid on;
xlabel('Time (s)'); ylabel('Amplitude (V)');
title('Part 2: x(t)');
subplot(312);
plot(t,x1); grid on;
xlabel('Time (s)'); ylabel('Amplitude (V)');
title('Part 2: 10cos(10t)');
subplot(313);
plot(t,x2); grid on;
xlabel('Time (s)'); ylabel('Amplitude (V)');
title('Part 2: 20cos(20t)');


