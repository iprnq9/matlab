% Ian Roberts
% EE 3431 Lab Final
% Bandpass Filter

clc; clear all; close all;

j = sqrt(-1);
f = 0:10:1e6;

% Ideal Values
R1 = 100;
R2 = 1000;
R3 = 100;
R4 = 1000;
R5 = 1000;
R6 = 1000;
C1 = .1e-6;
C2 = .1e-6;

wo = 1/sqrt(R2*R4*C1*C2);
fo = wo/(2*pi)
Q = sqrt((C1*R3^2)/(R2*R4*C2))
BW = wo/Q;
gain = -R3/R1

H = gain.*(wo./Q).*(j.*2.*pi.*f)./((j.*2.*pi.*f).^2 + (j.*2.*pi.*f).*wo./Q + wo.^2);

figure();
loglog(f,(abs(H)),'b'); hold on;
grid on;

% Lab Supplies
R1 = 100;
R2 = 1000;
R3 = 100;
R4 = 1000;
R5 = 1000;
R6 = 1000;
C1 = .1e-6;
C2 = .1e-6;

wo = 1/sqrt(R2*R4*C1*C2);
fo = wo/(2*pi);
Q = sqrt((C1*R3^2)/(R2*R4*C2))
BW = wo/Q;
gain = -R3/R1;

H2 = gain.*(wo./Q).*(j.*2.*pi.*f)./((j.*2.*pi.*f).^2 + (j.*2.*pi.*f).*wo./Q + wo.^2);

loglog(f,(abs(H2)),'g'); hold on; grid on;

% Experimental Results
f_test = [0.1 0.3 0.5 0.7  0.9  1    1.1  1.5 2    3   4    5    6    7    8    9    9.5 10   10.5 11   12   14   16   20   25   30  40  50]*1e3; % in khz
a =      [1.5 1.7 1.7 1.72 1.74 1.74 1.76 1.8 1.84 1.9 1.94 1.96 1.96 1.96 1.94 1.92 1.9 1.88 1.86 1.84 1.82 1.72 1.68 1.62 1.56 1.5 1.4 1.32]/20; % pk pk input of 2 (find gain)

%loglog(f_test,a,'r'); hold on;
title('BPF: Frequency vs Voltage Gain (dB)');
xlabel('Frequency (Hz)');
ylabel('Voltage Gain (dB)');
legend('Ideal','Lab Supply','Actual Results','Location','southeast');


% plot linear scale
figure();
plot(f,abs(H),'b'); hold on;
plot(f,abs(H2),'g'); hold on;
plot(f_test,a,'r');
grid on;
xlim([0 15000]);
title('BPF: Frequency vs Voltage Gain (Linear)');
xlabel('Frequency (Hz)');
ylabel('Voltage Gain');
legend('Ideal','Lab Supply','Actual Results','Location','southeast');

% plot pole-zero
figure();
c = [1 (2.*pi.*fo./Q) (2.*pi.*fo).^2];
c = roots(c);
plot(real(c),imag(c), 'x'); hold on; drawnow();
axis equal;
grid on;
xlabel('Real H(s)');
ylabel('Imaginary H(s)');
title('BPF: H(s) Pole-Zero Plot');

% phase plot
figure();
plot(f,angle(H2)); hold on; drawnow(); grid on;
xlabel('Frequency');
ylabel('Phase');
title('BPF: Phase Plot');