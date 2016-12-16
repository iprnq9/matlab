% Ian Roberts
% EE 3411
% Lab 3: Superposition Integral Evaluation
% Deliverables: All 4 parts in report
clc; clear; close all;

% Part 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = 0.05;
t = -4:T:4;

x = -(t+0.25.*(us(t+2)-us(t-1)));
y = 2.*exp(-0.4.*(t+0.5)).*cos(0.5.*pi.*t)-pi./4.*(us(t+0.5)-us(t-2.5));
z = conv(x,y).*T; % normalize

figure();
plot(t,x); hold on;
plot(t,y);
title('Part 1');
xlabel('Time');
ylabel('Amplitude');
legend('x','y');

figure();
plot(-8:T:8,z); % double the time of x and y for z because you have both x and y in a convolution
title('Part 1');
xlabel('Time');
ylabel('Amplitude');
legend('z');

% Part 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
%close all; % comment this out for testing
T = .01;
t = -8:T:8;
x = exp(-0.5.*t).*us(t);
y = 2.*exp(0.75.*t).*us(-t);
w = conv(x,y).*T;
z = 1.6.*exp(0.75.*t).*(t<0) +  1.6.*exp(-.5.*t).*(t>=0);

figure();
plot(t,z); hold on;
plot(-16:T:16,w); % must double the time dimension when using conv(x,y)
title('Part 2');
xlabel('Time');
ylabel('Amplitude');
legend('z (given)','w (conv(x,y))');

% Part 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
%close all; % comment this out for testing
T = .005;
t = -2:T:3;
x = 3.*pie((t-0.875)/1.75);
y = 1.5.*sin(4*pi*t);

w = conv(x,y).*T;
z = -(2.25./pi) .* cos(4.*pi.*t);

figure();
plot(t,x); hold on;
plot(t,y);
title('Part 3');
xlabel('Time');
ylabel('Amplitude');
legend('x','y');

figure();
plot(t,z); hold on;
plot(-4:T:6,w); % must double the time dimension when using conv(x,y)
title('Part 3');
xlabel('Time');
ylabel('Amplitude');
legend('z (given)','w (conv(x,y))');

% Part 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%close all;
T = .01;
t = -1:T:12;

a = 0.3/T^2 + 0.4/T + 0.8;
b = 0.6/T^2 + 0.4/T;
c = -(0.3/T^2);
d = 0.9 + 0.2/T;
e = -0.2/T;

x = t*0;
x(find(t==0)) = 1./T;
x = [0,x]; % append 0 to beginning of x

y = zeros(1,length(t)+2);
y(1) = 2;
y(2) = 2 - 0.35.*T;
for i=3:length(y)
    y(i) = (b.*y(i-1) + c.*y(i-2) + d.*x(i-1) + e.*x(i-2)) ./ a;
end;

%split up x to prove distrubitive property for convolution
x = 2 - cos(.2.*pi.*t)
v = conv(x,y(3:end)).*T;
x = 0.25.*cos(2.*pi.*t);
w = conv(x,y(3:end)).*T;
w = w + v;

figure();
title('Part 4');
plot(-2:T:24,w);
title('Part 4');
xlabel('Time');
ylabel('Amplitude');
legend('w=conv(x,y)');