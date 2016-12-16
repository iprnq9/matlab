clc; close all; clear all;

f = [2 4 8 9 10 11 12 15 17 20 25];
a = [2.92 2.8 2.36 2.24 2.14 2.04 1.96 1.76 1.68 1.36 1.14];
g = [22 22 15 15 13.4 15 13.6 12 11.8 10.4 7.8];

for x=1:length(f)-1
    slope = 20.*(log10(a(x)./1.14))/log10(f(x)./25)
end;

mean(slope)

figure();
loglog(f,a);
title('First Order RC Low Pass Filter Amplitude');
xlabel('Input Frequency (kHz)');
ylabel('Output Amplitude');

figure();
loglog(f,g);
title('First Order RC Low Pass Filter Phase Difference');
xlabel('Input Frequency (kHz)');
ylabel('Phase Difference (rad)');