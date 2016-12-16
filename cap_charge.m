clc; clear all; close all;


Vs = 1;
T = 0.0000000001;
t = 0:T:0.00000001;
bit_time = 120e-6;
transition_time = 0.2 * bit_time;
logic_high = zeros(1,length(t));
logic_high(1:end) = 0.9 * Vs;

tau = (log(-(logic_high(1) - 1)) / (-bit_time*transition_time))^-1

V = Vs * (1 - exp(-t/tau));

plot(t, V); hold on;
plot(t, logic_high,'--');
grid on;
str = sprintf('RC circuit, tau = %d' , tau);
title(str)
xlabel('Time (s)')
ylabel('Voltage across capacitor (V)')