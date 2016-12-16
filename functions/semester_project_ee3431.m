clc; clear all; close all;

j = sqrt(-1);

R1 = 222.2222;
R2 = 28.9373;
R3 = 222.2222;
R4 = 28.9373;
R5 = 100;
R6 = 100;
C1 = 1e-6;
C2 = 1e-6;

wo = 1/sqrt(R2*R4*C1*C2);
fo = wo/(2*pi);
Q = sqrt((C1*R3^2)/(R2*R4*C2));
BW = wo/Q;
gain = -R3/R1;

f = 0:10:1e6;

H = gain.*(wo./Q).*(j.*2.*pi.*f)./((j.*2.*pi.*f).^2 + (j.*2.*pi.*f).*wo./Q + wo.^2);

figure();
semilogx(f,20*log10(abs(H)),'g');
grid on;

figure(3);
plot(f,abs(H));
grid on;
xlim([0 11000]);

figure();
plot(real(H), imag(H), 'x');
axis equal;
grid on;
xlabel('Real H(s)');
ylabel('Imaginary H(s)');
title('H(s) Pole-Zero Plot');

figure(3);