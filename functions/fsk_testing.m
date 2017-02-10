% BFSK Communication
% Author: Ian P. Roberts

clc; clear all; close all;
j = sqrt(-1);

T = 0.00001;
t = 0:T:1;

% Data
fm = 1;
logic_high = 1;
m = logic_high/2*sign(sin(2*pi*fm*t))+logic_high/2;

% Carrier Wave
fc = 40;
c = cos(2*pi*fc*t);

% Modulation
multiplier = 1;
y = sin(2*pi*t.*(fc + fc*multiplier.*m/logic_high));

figure();
subplot(311); plot(t,m); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Data');

subplot(312); plot(t,c); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Carrier Wave');

subplot(313); plot(t,y); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Modulated Waveform');
