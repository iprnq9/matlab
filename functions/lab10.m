% Ian Roberts
% EE 3411
% Lab 10: Communication Systems and Signals
% Deliverables: Formal Report

clc; clear; close all;

% Part 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = 0.0002;
t = -0.5:T:0.4998;
m  = 2.*cos(40.*pi.*t + 2.1) + 6.*sin(80.*pi.*t) + 4.*cos(160.*pi.*t - 0.9);
xc = 10.*cos(800.*pi.*t);
xm = m .* xc;

dfm = 0.001;
[fm, M, N, No]=ctft(t,m,dfm);
[fxc, XC, N, No]=ctft(t,xc,dfm);
[fxm, XM, N, No]=ctft(t,xm,dfm);

% Plotting the carrier and message in time and frequency

figure();
subplot(311);
plot(t(find(t<0.04 & t>-0.04)),m(find(t<0.04 & t>-0.04))); hold on; 
plot(t(find(t<0.04 & t>-0.04)),xc(find(t<0.04 & t>-0.04)));
title('Time: Carrier Signal and Message');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-12 12])
legend('Message','Carrier');

subplot(312);
plot(fm(find(fm<1000 & fm>-1000)),abs(M(find(fm<1000 & fm>-1000)))); hold on; 
plot(fxc(find(fxc<1000 & fxc>-1000)),abs(XC(find(fxc<1000 & fxc>-1000))));
title('Amplitude Spectra: Carrier Signal and Message');
xlabel('Frequency (Hz)');
ylabel('Amplitude'); ylim([0 4]);
legend('Message','Carrier');

subplot(313);
plot(fm(find(fm<1000 & fm>-1000)),angle(M(find(fm<1000 & fm>-1000)))); hold on; 
plot(fxc(find(fxc<1000 & fxc>-1000)),angle(XC(find(fxc<1000 & fxc>-1000))));
title('Phase Spectra: Carrier Signal and Message');
xlabel('Frequency (Hz)');
ylabel('Phase'); ylim([0 4]);
legend('Message','Carrier');

% Plotting the modulated in time and frequency

figure();
subplot(311);
plot(t(find(t<0.04 & t>-0.04)),xm(find(t<0.04 & t>-0.04)));
title('Time: Modulated Signal');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-120 120])

subplot(312);
plot(fxm(find(fxm<1000 & fxm>-1000)),abs(XM(find(fxm<1000 & fxm>-1000))));
title('Amplitude Spectra: Modulated Signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude'); ylim([0 20]);

subplot(313);
plot(fxm(find(fxm<1000 & fxm>-1000)),angle(XM(find(fxm<1000 & fxm>-1000))));
title('Phase Spectra: Modulated Signal');
xlabel('Frequency (Hz)');
ylabel('Phase'); ylim([0 4]);

% Part 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% multiply by local oscillator
LO = 0.25.*cos(800.*pi.*t);
y1 = xm.*LO;
[fy1, Y1, N, No]=ctft(t,y1,dfm);


% create LPF
df = 0.01;
f  = -1000:df:1000;
B = 200; % Bandwidth
K = 0.8;  % Gain
H = K.*pie(f./(2.*B)); % LPF equation

dtm = 0.01;
[~,h,~]=ctift(f,H,dtm); % find impulse response of LPF

y = conv(y1,h,'same').*T; % filtered by LPF

dfm = 0.001;
[fy, Y, N, No]=ctft(t,y,dfm);

figure();
subplot(311);
plot(t(find(t<0.04 & t>-0.04)),y1(find(t<0.04 & t>-0.04)));
title('Time: Y1 Signal');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-24 24])

subplot(312);
plot(t(find(t<0.04 & t>-0.04)),y(find(t<0.04 & t>-0.04)));
title('Time: Demodulated Signal');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-12 12])

subplot(313);
plot(fy1(find(fy1<1000 & fy1>-1000)),abs(Y1(find(fy1<1000 & fy1>-1000)))); hold on;
plot(fy(find(fy<1000 & fy>-1000)),abs(Y(find(fy<1000 & fy>-1000))));
title('Amplitude Spectra: Y1 and Demodulated Signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude'); ylim([0 4]);
legend('Y1', 'Demodulated');

figure();
plot(t(find(t<0.04 & t>-0.04)),m(find(t<0.04 & t>-0.04))); hold on; 
plot(t(find(t<0.04 & t>-0.04)),y(find(t<0.04 & t>-0.04)));
title('Time: Message and Demodulated Signals');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-12 12])

% Part 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure();
subplot(511);
plot(t(find(t<0.5 & t>-0.5)),m(find(t<0.5 & t>-0.5)));
title('Message Signal');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-12 12])
legend('Message');

subplot(512);
plot(t(find(t<0.5 & t>-0.5)),xc(find(t<0.5 & t>-0.5)));
title('Carrier Signal');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-12 12])

subplot(513);
plot(t(find(t<0.5 & t>-0.5)),xm(find(t<0.5 & t>-0.5)));
title('Modulated Signal');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-120 120])

subplot(514);
plot(t(find(t<0.5 & t>-0.5)),y1(find(t<0.5 & t>-0.5)));
title('Y1 Signal');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-24 24])

subplot(515);
plot(t(find(t<0.5 & t>-0.5)),y(find(t<0.5 & t>-0.5)));
title('Demodulated Signal');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-12 12])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% multiply by local oscillator
freq_error = 1;
phase_error = pi/4;
LO = 0.25.*cos((800.*pi-2.*pi.*freq_error).*t-phase_error);
y1 = xm.*LO;
[fy1, Y1, N, No]=ctft(t,y1,dfm);

% create LPF
df = 0.01;
f  = -1000:df:1000;
B = 200; % Bandwidth
K = 0.8;  % Gain
H = K.*pie(f./(2.*B)); % LPF equation

dtm = 0.01;
[~,h,~]=ctift(f,H,dtm); % find impulse response of LPF

y = conv(y1,h,'same').*T; % filtered by LPF

dfm = 0.001;
[fy, Y, N, No]=ctft(t,y,dfm);

figure();
subplot(311);
plot(t(find(t<0.04 & t>-0.04)),y1(find(t<0.04 & t>-0.04)));
title('Time: Y1 Signal');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-24 24])

subplot(312);
plot(t(find(t<0.04 & t>-0.04)),y(find(t<0.04 & t>-0.04)));
title('Time: Demodulated Signal');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-12 12])

subplot(313);
plot(fy1(find(fy1<1000 & fy1>-1000)),abs(Y1(find(fy1<1000 & fy1>-1000)))); hold on;
plot(fy(find(fy<1000 & fy>-1000)),abs(Y(find(fy<1000 & fy>-1000))));
title('Amplitude Spectra: Y1 and Demodulated Signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude'); ylim([0 4]);
legend('Y1', 'Demodulated');

figure();
plot(t(find(t<0.04 & t>-0.04)),m(find(t<0.04 & t>-0.04))); hold on; 
plot(t(find(t<0.04 & t>-0.04)),y(find(t<0.04 & t>-0.04)));
title('Time: Message and Demodulated Signals');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-12 12])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% multiply by local oscillator
freq_error = 5;
phase_error = pi/2;
LO = 0.25.*cos((800.*pi-2.*pi.*freq_error).*t-phase_error);
y1 = xm.*LO;
[fy1, Y1, N, No]=ctft(t,y1,dfm);

% create LPF
df = 0.01;
f  = -1000:df:1000;
B = 200; % Bandwidth
K = 0.8;  % Gain
H = K.*pie(f./(2.*B)); % LPF equation

dtm = 0.01;
[~,h,~]=ctift(f,H,dtm); % find impulse response of LPF

y = conv(y1,h,'same').*T; % filtered by LPF

dfm = 0.001;
[fy, Y, N, No]=ctft(t,y,dfm);

figure();
subplot(311);
plot(t(find(t<0.04 & t>-0.04)),y1(find(t<0.04 & t>-0.04)));
title('Time: Y1 Signal');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-24 24])

subplot(312);
plot(t(find(t<0.04 & t>-0.04)),y(find(t<0.04 & t>-0.04)));
title('Time: Demodulated Signal');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-12 12])

subplot(313);
plot(fy1(find(fy1<1000 & fy1>-1000)),abs(Y1(find(fy1<1000 & fy1>-1000)))); hold on;
plot(fy(find(fy<1000 & fy>-1000)),abs(Y(find(fy<1000 & fy>-1000))));
title('Amplitude Spectra: Y1 and Demodulated Signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude'); ylim([0 4]);
legend('Y1', 'Demodulated');

figure();
plot(t(find(t<0.04 & t>-0.04)),m(find(t<0.04 & t>-0.04))); hold on; 
plot(t(find(t<0.04 & t>-0.04)),y(find(t<0.04 & t>-0.04)));
title('Time: Message and Demodulated Signals');
xlabel('Time (sec)');
ylabel('Amplitude'); ylim([-12 12])
