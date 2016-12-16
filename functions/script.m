clear all; close all; clc;

dBm = [-3.8 -22.7 -31.8 -37.4 -41.7];
watts = 0;

for k=1:1:length(dBm)
    watts = watts + 10^(dBm(k)/10);
end;

watts

dBm = [-3.8 -22.7 -31.8 -37.4 -41.7];
watts = 0;

for k=1:1:length(dBm)
    watts = watts + 2.*10^((dBm(k)+10.*log10(50*10^-3))/10);
end;

watts/50

