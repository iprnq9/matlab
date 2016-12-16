% Ian Roberts
% EE 3411
% Lab 5: Spectra of Periodic Signals
% Deliverables: All parts
clc; clear; close all;

% Part 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%a
T = 0.0001;
t = -.75:T:.75;
x = 10.*cos(24.*pi.*t - 1.2) - 8.*cos(28.*pi.*t + 1) + 4.*sin(36.*pi.*t + 2.5);

figure();
plot(t,x);
title('Part 1a');
xlabel('Time');
ylabel('Amplitude');

%c
T = 0.0005;
t = -.25:T:(.25-T);
x = 10.*cos(24.*pi.*t - 1.2) - 8.*cos(28.*pi.*t + 1) + 4.*sin(36.*pi.*t + 2.5);
[Xn,f,ang,No,Fo] = ctfsc(t,x);

figure();
stem(f,abs(Xn));
title('Part 1c');
xlabel('Frequency');
ylabel('Amplitude');

figure();
stem(f,ang);
title('Part 1c');
xlabel('Frequency');
ylabel('Phase');

%d
T = 0.0005;
t = 0:T:(.5-T);
x = 10.*cos(24.*pi.*t - 1.2) - 8.*cos(28.*pi.*t + 1) + 4.*sin(36.*pi.*t + 2.5);
[Xn,f,ang,No,Fo] = ctfsc(t,x);

figure();
stem(f,abs(Xn));
title('Part 1d');
xlabel('Frequency');
ylabel('Amplitude');

figure();
stem(f,ang);
title('Part 1d');
xlabel('Frequency');
ylabel('Phase');

%e
T = 0.0005;
t = -0.2:T:(0.2-T);
x = 10.*cos(24.*pi.*t - 1.2) - 8.*cos(28.*pi.*t + 1) + 4.*sin(36.*pi.*t + 2.5);
[Xn,f,ang,No,Fo] = ctfsc(t,x);

figure();
stem(f,abs(Xn));
title('Part 1e');
xlabel('Frequency');
ylabel('Amplitude');

figure();
stem(f,ang);
title('Part 1e');
xlabel('Frequency');
ylabel('Phase');

%f
% N = round(length(No)/2+1);
% [xfs,Xnn] = ctfs(t,Xn,No,Fo,N);
% 
% figure();
% stem(f,xfs);
% title('Part 1f');
% xlabel('Frequency');
% ylabel('Amplitude');

% Part 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = 0.0001;
t = -.75:T:.75;
x = 10.*cos(24.*pi.*t - 1.2) - 8.*cos(28.*pi.*t + 1) + 4.*sin(36.*pi.*t + 2.5);

[Xn,f,ang,No,Fo] = ctfsc(t,x);
Xn(find(Xn<(0.2*max(abs(Xn))))) = 0; % set all under threshold to zero

figure();
stem(f,abs(Xn));
title('Part 2');
xlabel('Frequency');
ylabel('Amplitude');

% Part 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%a
T = 0.002;
t = -6:T:6; % 3 periods
%x = 0.*(t>=-2 && t<-1.2) + (0.1 + 2.*cos(2.*pi.*t)).*(t>=-1.2 && t<1.2) + 0.*(t>=1.2 && t<2);
x = 0 + (0.1 + 2.*cos(2.*pi.*t)).*(t>=-1.2 & t<1.2);

%email him if we can't do this...

figure();
plot(t,x);
title('Part 3a');
xlabel('Time');
ylabel('Amplitude');

%b
[Xn,f,ang,No,Fo] = ctfsc(t,x);

f = -32*Fo:T:32*Fo;
figure();
return;
stem(f,abs(Xn));
title('Part 3b');
xlabel('Frequency');
ylabel('Amplitude');

figure();
stem(f,ang);
title('Part 3b');
xlabel('Frequency');
ylabel('Phase');

%c
%don't need to do!