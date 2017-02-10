clc; clear all; close all;
j = sqrt(-1);

[m, fs] = audioread('nineoneone.wav');

m = m';

T = 1/(1*fs);
t = [0:(length(m)-1)]*T;

fc = 400;
c = sin(2*pi*fc.*t);

y = (1+m).*c;

figure();
subplot(411); plot(t,m); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Message');

subplot(412); plot(t,c); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Carrier');

subplot(413); plot(t,y); grid on;
xlabel('Time'); ylabel('Amplitude'); title('Modulated Waveform');

f = fs*(-(length(m)-1)/2:(length(m)-1)/2)/length(m);
M = fft(m); 
figure();
subplot(311); plot(f,abs(M)); grid on;
title('Message Amplitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

C = fft(c); 
subplot(312); plot(f,abs(C)); grid on;
title('Carrier Amplitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

Y = fft(y); 
subplot(313); plot(f,abs(Y)); grid on;
title('Modulated Amplitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

lo = sin(2*pi*fc*t);
d = y.*lo;
D = fft(d);
lpf = pie(f/(2*1500));
Z = lpf.*D;

figure();
subplot(411); plot(f,abs(Y)); grid on;
title('Modulated Amplitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

subplot(412); plot(f,abs(D)); grid on;
title('Modulated Mixed with LO Amplitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

subplot(413); plot(f,abs(lpf)); grid on;
title('Low Pass Filter');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

subplot(414); plot(f,abs(Z)); grid on;
title('Demodulated Amplitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude'); ylim([0 150]);





