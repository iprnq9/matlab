clc; clear all; close all;

j = sqrt(-1);

Q_w = [10:10:384]*0.01; % testing varying Quality factors 0.1 to 3.84

%Q_w = 3.8;

figure();

for Q=Q_w
    fo = 5500;   
    c = [1 (2.*pi.*fo./Q) (2.*pi.*fo).^2];
    c = roots(c)
    plot(real(c),imag(c), 'x'); hold on; drawnow();
    grid on;
    xlim([-4e5 4e5]);
    ylim([-4e5 4e5]);
    title('Bandpass Filter (Varying Q)');
end;

figure();

for Q=Q_w
    f = 0:100:50e4;
    fo = 5500;
    H = 1.*(2.*pi.*fo./Q).*(j.*2.*pi.*f)./((j.*2.*pi.*f).^2 + (j.*2.*pi.*f).*(2.*pi.*fo./Q) + (2.*pi.*fo).^2);
    loglog(f,abs(H)); hold on; drawnow();
    grid on;
    title('Bandpass Filter (Varying Q)');
    xlabel('Frequency (Hz)');
    ylabel('Voltage Gain (dB)');
end;