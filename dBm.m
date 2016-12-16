clear; close all; clc;

dBm = [-28];
watts = 0;

for k=1:1:length(dBm)
    watts = watts + 2.*10^((dBm(k)+10.*log10(50*10^-3))/10);
end;

watts/50
