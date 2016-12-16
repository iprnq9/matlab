% HW 4.5: Read in and plot audio file from 1000-2000 mseconds 5 times
close all; clear all; clc;

[x,fs] = audioread('nineoneone.wav');

t = [0:(length(x)-1)]/fs*1000;

sampling_rate = fs
duration_samples = length(x)
duration_seconds = length(x)/fs
max_voltage = max(x)
min_voltage = min(x)
max_abs_voltage = max(abs(x))
dc_level = mean(x)
instantaneous_power_1_ohm_watts = x.^2/1;
plot(t,instantaneous_power_1_ohm_watts)
peak_power_5_ohm_watts = max(x.^2)/5
average_power_1_ohm_watts = mean(x.^2/1)
average_power_50_ohm_dBW = 10.*log10(mean(x.^2/1))
average_power_100_ohm_dBm = 10.*log10(1000*mean(x.^2/1))
rms = sqrt(mean(x.^2))
crest_factor = max(abs(x))/sqrt(mean(x.^2))

figure();
plot(t,x);
xlabel('Time (msec)');
ylabel('Voltage');
title('nineoneone.wav');
grid on;
