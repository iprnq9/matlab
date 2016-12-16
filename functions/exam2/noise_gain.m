close all; clear all; clc;

% generate noise
x = randn(1,100000);

% find the noise's rms value
rms = sqrt(mean(x.^2))

% find the noise's power into a 1 ohm
power_watts_1_ohm = mean(x.^2)

% declare our desired power in dBm
desired_power_dbm = 0;

% convert the desired power into watts
desired_power_watts = 0.001 * 10^(desired_power_dbm/10)

% find the rms corresponding to the desired power in watts in 1 ohm
desired_rms = sqrt(desired_power_watts/1);

% find the gain - the ratio between the rms we want and the rms we have
gain = sqrt(desired_power_watts)/rms

% multiply our noise by the gain
x = x.*gain;

% find our new power to make sure it equals 1 mW
power = mean(x.^2)

% conver to dBm to check it = 0 dBm
power_dBm = 10*log10(power*1000)