% Ian Roberts
% EE 3411
% Lab 7: Frequency Response
% Deliverables: 

clc; clear; close all;

% Part 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a
T = 0.001;
t=-0.1:T:0.2;
R = 2e3;
C = 10e-6;
h = 1/(R*C) .* exp(-t/(R*C)) .* us(t);

dfm = 0.01;
[f,X,N,no] = ctft(t,h,dfm); % find freq response of h(t)

figure();
plot(f,abs(X));
title('Part 1a');
xlabel('Frequency');
ylabel('Amplitude');

figure();
plot(f,angle(X));
title('Part 1a');
xlabel('Frequency');
ylabel('Phase');

% b
x1 = -1.5*cos(8*pi*t); % freq at 4 Hz
x2 = 0.4*cos(40*pi*t); % freq at 20 Hz
y1 = conv(x1,h).*T ;
y2 = conv(x2,h).*T;

gain1 = max(abs(y1))/max(abs(x1)) % gain at 4 Hz
gain2 = max(abs(y2))/max(abs(x2)) % gain at 20 Hz

% c
% Skip, he'll tell us later...

% Part 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a
% x = -3.9*cos(0.2*pi*t - 1.5) + 3.75*cos(0.5*pi*t-0.6) + 0.5*cos(1.2*pi*t+0.2);
%---START LAB 3, PART 4---%

T=.002;
t=-1:T:12;
x=zeros(1,length(t));
x(find(t==0))=1/T;

a=.9+.2/T;
b=.2/T;
c=.6/T^2+.4/T;
d=.3/T^2;
e=.3/T^2+.4/T+.8;
y(1)=0;
y(2)=0;
x=[0 x];
for i=3:length(t)
y(i)=(a*x(i)-b*x(i-1)+...
c*y(i-1)-d*y(i-2))./e;
end

% 2b
dfm=0.1;
[f, H, N, No]=ctft(t,y,dfm);
figure();
subplot(2,1,1);
plot(f, abs(H)); title('Part 2b: Low Pass Filter'); xlabel('Frequency');ylabel('Amplitude');
subplot(2,1,2);
plot(f, angle(H)); xlabel('Frequency');ylabel('Phase');

% 2a
% input and out convolved signals input should be x1 x2 x3 and
% output y1 y2 y3
x1=-3.9*cos(.2*pi*t-1.5); % freq of 0.1 Hz
x2=3.75*cos(.5*pi*t-.6);  % freq of 0.25 Hz
x3=.5*cos(1.2*pi*t+.2);   % freq of 0.6 Hz

y1=conv(x1,y)*T;
y2=conv(x2,y)*T;
y3=conv(x3,y)*T;

[f1, H1, ~, ~]=ctft(t,x1,dfm);
[f2, H2, ~, ~]=ctft(t,y1,dfm);
figure();
% subplot(2,1,1);
% plot(f1,abs(H1),f1,abs(H2));
% subplot(2,1,2);
% plot(f2,angle(H1),f2,angle(H2)); 
t1 = -2:T:24;
%higher frequencies are getting filtered out
subplot(311); plot(t(find(t>0 & t<10)),x1(find(t>0 & t<10)),t1(find(t1>0 & t1<10)),y1(find(t1>0 & t1<10)));
title('2a: Freq of 0.1 Hz: Filtered Least'); xlabel('Frequency');ylabel('Amplitude');
subplot(312); plot(t(find(t>0 & t<10)),x2(find(t>0 & t<10)),t1(find(t1>0 & t1<10)),y2(find(t1>0 & t1<10)));
title('Freq of 0.25 Hz: Filtered Some'); xlabel('Frequency');ylabel('Amplitude');
subplot(313); plot(t(find(t>0 & t<10)),x3(find(t>0 & t<10)),t1(find(t1>0 & t1<10)),y3(find(t1>0 & t1<10)));
title('Freq of 0.6 Hz: Filtered Most'); xlabel('Frequency');ylabel('Amplitude');

% 2c
% Find the max value of ouput and max value of input and the indexes at
% which those maximums occur. Then find the difference between indexes and 
% multiply by the spacing to get the time delay
[~, loc_max_y1] = max(y1(find(t1>=0)));
[~, loc_max_x1] = max(x1(find(t>=0)));
sample_difference_1 = loc_max_y1 - loc_max_x1;
time_difference_1 = sample_difference_1*T

[~, loc_max_y2] = max(y2(find(t1>=0 & t1<2)));
[~, loc_max_x2] = max(x2(find(t>=0 & t<2)));
sample_difference_2 = loc_max_y2 - loc_max_x2;
time_difference_2 = sample_difference_2*T

[~, loc_max_y3] = max(y3(find(t1>=0 & t1<1)));
[~, loc_max_x3] = max(x3(find(t>=0 & t<1)));
sample_difference_3 = loc_max_y3 - loc_max_x3;
time_difference_3 = sample_difference_3*T

% 2d
% just showing superposition of input and output
x = x1 + x2 + x3;
y = y1 + y2 + y3;
figure();
subplot(211); plot(x);title('2d: Input Superposition'); xlabel('Time');ylabel('Amplitude');
subplot(212); plot(y); title('Output Superposition'); xlabel('Time');ylabel('Amplitude');
