clc; clear all; close all;

j = sqrt(-1);

Q_w = [10:10:384]*0.01; % testing varying Quality factors 0.1 to 3.84

Q_w = 0.1;

R1 = 3800;
R2 = 1000;
R3 = 100;
R4 = 1000;
R5 = 1000;
R6 = 1000;
C1 = .01e-6;
C2 = .01e-6;

wo = 1/sqrt(R2*R4*C1*C2);
fo = wo/(2*pi);
Q = sqrt((C1*R3^2)/(R2*R4*C2))
BW = wo/Q;
gain_bpf = -R3/R1;
gain_lpf = -R2/R1;

% BPF
figure();
for Q=Q
    f = 0:100:100e3;
    fo = 5500;
    H = gain_bpf.*(2.*pi.*fo./Q).*(j.*2.*pi.*f)./((j.*2.*pi.*f).^2 + (j.*2.*pi.*f).*(2.*pi.*fo./Q) + (2.*pi.*fo).^2);
    loglog(f,abs(H)); hold on; drawnow();
    grid on;
    title(Q);
    xlabel('Frequency (Hz)');
    ylabel('Gain');
end;

% LPF
figure();
for Q=Q
    f = 0:100:20e3;
    fo = 5500;
    H = gain_lpf.*(2.*pi.*fo).^2./((j.*2.*pi.*f).^2 + (j.*2.*pi.*f).*(2.*pi.*fo./Q) + (2.*pi.*fo).^2);
    loglog(f,abs(H)); hold on; drawnow();
    grid on;
    title(Q);
    xlabel('Frequency (Hz)');
    ylabel('Gain');
end;

figure();
for Q=Q_w
    fo = 5500;   
    c = [1 (2.*pi.*fo./Q) (2.*pi.*fo).^2];
    c = roots(c);
    plot(real(c),imag(c), 'x'); hold on; drawnow();
    grid on;
    xlim([-4e5 4e5]);
    ylim([-4e5 4e5]);
    title('Pole-Zero Plot');
    xlabel('Real(s)');
    ylabel('Imag(s)');
end;