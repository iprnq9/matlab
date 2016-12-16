clc; close all; clear all;
format long;

k = 0:15;
xk = (1/2).^k
 
fft(xk);
 
n = k;
xn = (1-2.^-16)./(1-0.5.*exp(-i*pi.*n./8));


figure();
plot(k,real(fft(xk))); hold on;
plot(n,real(xn));
figure()
plot(k,imag(fft(xk))); hold on;
plot(n,imag(xn));

clc; close all; clear all;
k = 0:15;
xk = cos(pi.*k./2);
fft(xk)
