% Ian Roberts
% EE 3431 Lab Final
% Lowpass Filter

clc; clear all; close all;

j = sqrt(-1);

% theoretical
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
gain_lpf = -R2/R1

f = 0:10:1e6;

H = gain_lpf.*(2.*pi.*fo).^2./((j.*2.*pi.*f).^2 + (j.*2.*pi.*f).*(2.*pi.*fo./Q) + (2.*pi.*fo).^2);

max(abs(H))

figure();
%loglog(f,(abs(H)),'b'); hold on;
grid on;

% practical values
R1 = 2700;
R2 = 2400;
R3 = 2700;
R4 = 1000;
R5 = 2000;
R6 = 1000;
C1 = .01e-6;
C2 = .01e-6;

wo = 1/sqrt(R2*R4*C1*C2);
fo = wo/(2*pi);
Q = sqrt((C1*R3^2)/(R2*R4*C2))
BW = wo/Q;
gain_lpf = -R2/R1;

H2 = gain_lpf.*(2.*pi.*fo).^2./((j.*2.*pi.*f).^2 + (j.*2.*pi.*f).*(2.*pi.*fo./Q) + (2.*pi.*fo).^2);

loglog(f,(abs(H2)),'g'); hold on;

f_test = [0.001 0.01  0.025 0.050 0.075 0.1   0.2  0.3  0.4  0.5  0.6  0.7   0.8  0.9  1    1.1  1.2  1.3  1.5  1.7  2   2.3  2.5  2.8  3   3.2  3.5  3.8 4    4.5  5    5.5 6   6.5  7    7.5  8    8.5  9    9.5  10   10.5  11   11.5 12   13  14   15   16   18   20  25   30  35   40  45   50]*1e3; % in khz
a =      [4.24  4.24  4.24  4.24  4.24  4.24  4.24 4.5  4.5  4.5  4.5  4.5   4.5  4.54 4.54 4.54 4.54 4.58 4.62 4.64 4.7 4.74 4.82 4.84 4.9 4.96 5.08 5.1 5.18 5.3  5.34 5.4 5.3 5.1  4.88 4.54 4.18 3.82 3.46 3.14 2.86 2.6   2.36 2.18 1.98 1.7 1.46 1.26 1.12 .84  .68 .452 .33 .238 .2  .176 .144]/5; % pk pk input of 5 (find gain)

loglog(f_test,a,'r'); hold on; grid on;
title('LPF: Frequency vs Voltage Gain (dB)');
xlabel('Frequency (Hz)');
ylabel('Voltage Gain (dB)');
legend('Theoretical','Results','Location','southeast');


figure();
plot(f,abs(H),'g'); hold on;
plot(f,abs(H2),'b'); hold on;
%plot(f_test,a,'r');
grid on;
xlim([0 11000]);
title('LPF: Frequency vs Voltage Gain');
xlabel('Frequency (Hz)');
ylabel('Voltage Gain');


% figure();
% plot(f,angle(H),'g'); hold on;
% plot(f,angle(H2),'b'); hold on;
% %plot(f_test,a,'r');
% grid on;
% xlim([0 11000]);
% title('Frequency vs Phase Difference');
% xlabel('Frequency (Hz)');
% ylabel('Phase Difference');


figure();
c = [1 (2.*pi.*fo./Q) (2.*pi.*fo).^2];
c = roots(c)
plot(real(c),imag(c), 'x'); hold on; drawnow();
axis equal;
grid on;
xlabel('Real H(s)');
ylabel('Imaginary H(s)');
title('H(s) Pole-Zero Plot');