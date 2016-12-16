% Ian Roberts
% EE 3431 Lab Final
% Bandpass Filter

clc; clear all; close all;

j = sqrt(-1);
f = 0:10:100e3;

% Ideal Values
R1 = 3000;
R2 = 2400;
R3 = 3000;
R4 = 1000;
R5 = 2000;
R6 = 1000;
C1 = .01e-6;
C2 = .01e-6;

wo = 1/sqrt(R2*R4*C1*C2);
fo = wo/(2*pi)
Q = sqrt((C1*R3^2)/(R2*R4*C2))
BW = wo/Q;
gain = -R3/R1

H = gain.*(wo./Q).*(j.*2.*pi.*f)./((j.*2.*pi.*f).^2 + (j.*2.*pi.*f).*wo./Q + wo.^2);

figure(1);
%loglog(f,(abs(H)),'b'); hold on;
grid on;

% Lab Supplies
R1 = 2700;
R2 = 2400;
R3 = 2700;
R4 = 1000;
R5 = 2000;
R6 = 1000;
C1 = .01e-6;
C2 = .01e-6;

wo = 1/sqrt(R2*R4*C1*C2);
fo = wo/(2*pi)
Q = sqrt((C1*R3^2)/(R2*R4*C2))
BW = wo/Q;
gain = -R3/R1;

H2 = gain.*(wo./Q).*(j.*2.*pi.*f)./((j.*2.*pi.*f).^2 + (j.*2.*pi.*f).*wo./Q + wo.^2);

loglog(f,(abs(H2)),'g'); hold on; grid on;

% Experimental Results
f_test = [0.001 0.01  0.025 0.050 0.075 0.1   0.3  0.4  0.5   0.6   0.7   0.8   0.9  1     1.1   1.2   1.5   2    2.5 3    3.5  4    4.5  5    5.5  6   6.5 7    7.5  8    8.5  9    9.5  10   10.5  11   12   14   16   18   20   25   30  35  40  50]*1e3; % in khz
a =      [0.037 0.042 0.043 0.072 0.082 0.093 0.13 0.27 0.348 0.382 0.448 0.504 0.58 0.632 0.696 0.752 0.946 1.24 1.6 1.96 2.32 2.72 3.14 3.54 3.92 4.2 4.4 4.48 4.46 4.36 4.26 4.08 3.90 3.40 3.54  3.36 3.04 2.52 2.14 1.88 1.68 1.32 1.1 .96 .84 0.68]/5; % pk pk input of 2 (find gain)

loglog(f_test,a,'r'); hold on; grid on;
title('BPF: Frequency vs Voltage Gain (dB)');
xlabel('Frequency (Hz)');
ylabel('Voltage Gain (dB)');
legend('Theoretical','Results','Location','southeast');


% plot linear scale
figure();
plot(f,abs(H),'b'); hold on;
plot(f,abs(H2),'g'); hold on;
plot(f_test,a,'r');
grid on;
xlim([0 1e5]);
title('BPF: Frequency vs Voltage Gain (Linear)');
xlabel('Frequency (Hz)');
ylabel('Voltage Gain');
legend('Lab Supply','Actual Results','Location','southeast');

% plot pole-zero
figure();
c = [1 (2.*pi.*fo./Q) (2.*pi.*fo).^2];
c = roots(c)
r = sqrt(real(c).^2 + imag(c).^2)
plot(real(c),imag(c), 'x'); hold on; grid on; drawnow();

xlim([-2e4 0]);
ylim([-10e4 10e4]);
xlabel('Real H(s)');
ylabel('Imaginary H(s)');
title('H(s) Pole-Zero Plot');

figure(1);
%vline(r);