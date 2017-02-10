t = 0:.001:10;

x = 10*cos(10*t) + 20*cos(20*t);

figure();
plot(t,x); grid on;
xlabel('Time'); ylabel('Amplitude');
title('x(t)');

X = fft(x);
f = -length(x)/2:length(x)/2-1;

figure();
plot(f,abs(X)); grid on;
xlabel('Frequency'); ylabel('Amplitude');
title('X(f)');