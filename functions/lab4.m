% Ian Roberts
% EE 3411
% Lab 4: Amplitude and Phase Spectra Bandwidth 
% Deliverables: all three parts
clc; clear; close all;

% Part 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a
T = 0.001;
t = -.2:T:.2;

x = 10.*cos(15.*2.*pi.*t + 1.5) + 4.*cos(25.*2.*pi.*t - .5) + 6.*cos(30.*2.*pi.*t - 1);
y = 4.*cos(15.*2.*pi.*t + .8) + 6.*cos(25.*2.*pi.*t + .4) + 8.*cos(30.*2.*pi.*t - 1.6);
z = 10.*cos(15.*2.*pi.*t + .8) + 4.*cos(25.*2.*pi.*t + .4) + 6.*cos(30.*2.*pi.*t - 1.6);

figure();
plot(t,x, t,y, t,z);
title('Part 1a');
xlabel('Time');
ylabel('Amplitude');
legend('x','y', 'z');

% b
% figure();
% plot(t,z); hold on;
% plot(t,x);
% title('Part 1b');
% xlabel('Time');
% ylabel('Amplitude');
% legend('z','x');

% Part 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = 0.01;
t = -.5:T:.5;
x = -1.3 - 8.4.*cos(1.5.*pi.*t - 0.45) + 4.2.*sin(23.*t + 2.8) - 4.8.*sin(12.*pi.*t - 1.3);

f =  [-6,           -(23/(2*pi)),    -.75,    0,      .75,   (23/(2*pi)), 6];
A =  [-2.4,         2.1,             -4.2,    1.3,  -4.2,    2.1,        -2.4];
ph = [-(pi/2+1.3),  -(pi/2-2.8),      0.45,   0,    -0.45,   (pi/2-2.8), (pi/2+1.3)];

figure();
stem(f,abs(A));
title('Part 2');
xlabel('Frequency');
ylabel('Amplitude');
xlim([-10 10]);
figure();
stem(f,ph);
title('Part 2');
xlabel('Frequency');
ylabel('Phase');
xlim([-10 10]);

% Part 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=0.01;
t=-22:T:10;
x=t*0;
x(find(t==0))=1./T;
y=x*0;
x=[0 x];
y=[0 0 y];

a=.9+.2/T;
b=.6/T^2+.4/T;
c=.3/T^2;
d=.2/T;
e=.3/T^2+.4/T+.8;

for i=3:length(y)
    y(i)=(a*x(i-1)+b*y(i-1)-c*y(i-2)-d*x(i-2))/e;
end
x1=-3.9.*cos(.2.*pi.*t-1.5);
x2=3.75.*cos(.5.*pi.*t-.6);
x3=.5.*cos(1.2.*pi.*t+.2);

z1=conv(x1,y(3:end)).*T;
z2=conv(x2,y(3:end)).*T;
z3=conv(x3,y(3:end)).*T;

t1=-44:T:20;
figure();
title('Part 3');
time1=(t>-10 & t<10);
time2=(t1>-10 & t1<10);
subplot(311);plot(t(time1),x1(time1),t1(time2),z1(time2));
title('Part 3a');
legend('ip','op');
subplot(312);plot(t(time1),x2(time1),t1(time2),z2(time2));
subplot(313);plot(t(time1),x3(time1),t1(time2),z3(time2));

Amp=[max(abs(z1)) max(abs(z2)) max(abs(z3))];
freq=[.1 .25 .6];
figure();stem(freq,Amp);title('Part 3b');
xlim([0 .7]);
ylim([-1 6]);

% a


% b


% c


% d