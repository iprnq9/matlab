% Ian Roberts
% EE 3411
% Lab 2

clc;clear;close all;

% #1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=-.1:.001:.1;
i_1 = 2.4.*cos(15.*pi.*t-0.8)
i_2 = 4.2.*cos(15.*pi.*t-1.9)

i_3 = i_1 + i_2;

plot(t, i_1, t, i_2, t, i_3);
legend('i1','i2','i1+i2');
xlabel('time');
ylabel('Current (Amps)');
title('Part 1');

% #2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=-10:.001:10;
x = 2.*us(t+2.5)+2.*ur(t+2)-10.*us(t+1)-ur(t)-ur(t-1)+us(t-1)+0.5.*ur(t-2.5)-0.5.*ur(t-6.5)
figure(); % create new figure
plot(t,x);
title('Part 2');

% #3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure();
R = 2e3;
C = 10e-6;
for T=.01:.01:.2
    %break; % comment this line to run the for loop
    %T = .01;
    t=.6:T:1.6;
    x = t.*[us(t-.8)-us(t-1.1)];
    a = (R*C)/T;
    y = zeros(1,1+size(t,2)); % want the column value of t
    for i=2:length(t)
        y(i) = x(i) + a.*y(i-1)./(1+a);
    end;
    plot(t, y(2:end));
    title(T);
    break;
    drawnow();
    pause(.3);
end;
title('Part 3');
xlabel('time');
ylabel('Voltage (V)');

% #4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = .01;
t = .6:T:1.6;
x = t.*[us(t-.8)-us(t-1.1)];
x = [0,x];
a = R*C;
b = 1;
c = 1;
y = zeros(1, length(t)+1);
for i=2:length(y)
    y(i) = (c*T*[x(i)+x(i-1)]+(2*a-b*T)*y(i-1))/(2*a+b*T);
end;
figure();
plot(t,y(2:end));
title('Part 4');
xlabel('time');
ylabel('Voltage (V)');

% #5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = .01;
t = -.1:T:.2;
R = 2e3;
C = 10e-6;
a = (R*C)/T;

h = 1./(R*C) .* exp(-t./(R*C)) .* us(t);

figure();
plot(t,h);
hold on;

impulse = zeros(1,size(t,2));
impulse(find(t==0)) = 1./T; % find returns index where t == 0

y = zeros(1,1+size(t,2));
for i=2:length(t)
    y(i) = impulse(i) + a.*y(i-1)./(1+a);
end;
plot(t,y(2:end));
title('Part 5');

% #6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = .01;
t = 0:T:10;
a = 0.3/T^2 + 0.4/T + 0.8;
b = 0.6/T^2 + 0.4/T;
c = -(0.3/T^2);
d = 0.9 + 0.2/T;
e = -0.2/T;

x = (-3.*t+6).*(t>=1 & t<2)+(-3.*t+9).*(t>=2 & t<3)+(-3.*t+12).*(t>=3 & t<4);
x = [0,x]; % append 0 to begginning of x

y = zeros(1,length(t)+2);
y(1) = 2;
y(2) = 2 - 0.35.*T;
for i=3:length(t)
    y(i) = (b.*y(i-1) + c.*y(i-2) + d.*x(i) + e.*x(i-1)) ./ a;
end;
figure();
plot(t,x(2:end));
title('Part 6');hold on;
plot(t,y(3:end));
xlabel('time');
ylabel('Voltage (V)');
legend();