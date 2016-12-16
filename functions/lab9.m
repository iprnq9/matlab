% Ian Roberts
% EE 3411
% Lab 9: Ideal Filters
% Deliverables: 

clc; clear; close all;

% Part 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
df = 0.01;
f  = -25:df:25;
B = 1.25; % Bandwidth
K = 1.5;  % Gain
H = K.*pie(f./(2.*B)); % LPF equation

% a
figure();
plot(f(find(f>-5 & f<5)),abs(H(find(f>-5 & f<5)))); grid on;
title('Part 1a');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

figure();
plot(f(find(f>-5 & f<5)),angle(H(find(f>-5 & f<5)))); grid on;
title('Part 1a');
xlabel('Frequency (Hz)');
ylabel('Phase');

% b
dtm = 0.02;
[t,x,N]=ctift(f,H,dtm); % find impulse response of filter, sinc for square

figure();
plot(t(find(t>-1.5 & t<2.5)),real(x(find(t>-1.5 & t<2.5)))); grid on;
title('Part 1b');
xlabel('Time (s)');
ylabel('Amplitude');

% Part 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
df = 0.01;
f  = -25:df:25;
B = 2.5;        % Bandwidth of 2.5Hz
K = 1.5;        % Gain of 1.5
fo = 6;         % 6Hz is our center freq
H = K.*(pie((f+fo)/B) + pie((f-fo)/B)); % BPF equation

% a
figure();
plot(f(find(f>-10 & f<10)),abs(H(find(f>-10 & f<10)))); grid on;
title('Part 2a');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

figure();
plot(f(find(f>-10 & f<10)),angle(H(find(f>-10 & f<10)))); grid on;
title('Part 2a');
xlabel('Frequency (Hz)');
ylabel('Phase');

% b
dtm = 0.02;
[t,x,N]=ctift(f,H,dtm); % find impulse response of filter, sinc for square

figure();
plot(t(find(t>-1.5 & t<2.5)),real(x(find(t>-1.5 & t<2.5)))); grid on;
title('Part 2b');
xlabel('Time (s)');
ylabel('Amplitude');

% Part 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('hum3hb.mat'); % hb is signal, T is spacing

% a
t= [0:1249].*T;
figure(); % plot in time
plot(t,hb); grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Part 3a');

dfm = 0.01;
[f,X,N,no]=ctft(t,hb,dfm);

figure(); % plot in frequency, if zoom in, see spike at 60Hz (noise)
plot(f(find(f>-150 & f<150)),abs(X(find(f>-150 & f<150)))); grid on;
title('Part 3a');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% b & c
B = 10;  % BW of 10 Hz should be right size
fo = 60; % center freq of 60 Hz to filter out noise
K = 1;   % gain of 1, want to keep normal levels where we aren't filtering
H = K.*(1 - pie((f+fo)/B) - pie((f-fo)/B)); % Band Reject Filter equation

figure(); % plot the band reject filter in freq
plot(f,real(H)); grid on;
title('Part 3b');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

dtm = 0.01;
[~,h,~]=ctift(f,H,dtm); % find impulse response of filter

z = conv(hb,h,'same').*T; % filtered by Band Reject

figure(); % plot filtered result in time
plot(t,real(z)); grid on;
title('Part 3c');
xlabel('Time (s)');
ylabel('Amplitude');

dfm = 0.01;
[f,X,N,no]=ctft(t,z,dfm);

figure(); % plot filtered result in frequency, see dips at 60Hz
plot(f(find(f>-150 & f<150)),abs(X(find(f>-150 & f<150)))); grid on;
title('Part 3c');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% d & e
% applying LPF to 
B = 55; % Bandwidth
K = 1;  % Gain
H = K.*pie(f/(2.*B)); % LPF equation

dtm = 0.01;
[~,h,~]=ctift(f,H,dtm); % find impulse response of filter

y = conv(z,h,'same').*T; % apply LPF to Band Reject Filtered signal

figure(); % plot filtered result in time
plot(t,real(y)); grid on;
title('Part 3d');
xlabel('Time (s)');
ylabel('Amplitude');

dfm = 0.01;
[f,X,N,no]=ctft(t,y,dfm); % get FT of final result

figure(); % plot filtered result in frequency, see cut off at 55 Hz
plot(f(find(f>-150 & f<150)),abs(X(find(f>-150 & f<150)))); grid on;
title('Part 3d');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
