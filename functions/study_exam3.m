clc; close all; clear all;

f = -1e8:100:1e8;

data_rate = 1e6;
D = 1/data_rate .* sinc(1/data_rate .* f);

figure(1);
plot(f,abs(D));
xlim([-4e6 4e6]);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('D(f) - unfiltered');

% create LPF
df = 0.01;
B = data_rate; % Bandwidth
K = 1;  % Gain
H = K.*pie(f./(2.*B)); % LPF equation

D = D.*H;

figure(2);
plot(f,abs(D));
xlim([-4e6 4e6]);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('D(f) - LP Filtered');




