kf = 0.5;
fc = 1/10;
fm = 1/50;
n = [1:fm/4:256];

y = cos(2*pi*fc*n);
figure();
plot(n,y);