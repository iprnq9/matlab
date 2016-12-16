% Approximating a Fourier Transform using a Fourier Series (FFT)
close all; clear all; clc;

% I can calculate the Fourier Transform of a square pulse by hand.  So now
% I'll use Matlab and see if it comes up with the same answer

% Use a sampling frequency that will give me a large number of samples in
% the pulse
fs=100e3;

% The pulse is from -.1 to +.1 seconds.  I want to put a lot of zeros on
% either side of this.  By "a lot" I mean the time the signal is zero
% should be much longer than the time it's not zero.  In this case it is no
% zero for .2 seconds, so I'll make it zero for about 5 seconds on either
% side (5 >> .2)
t=[-5:1/fs:5];

% This is an easy way in Matlab to make a pulse
x=3*(t>-0.1).*(t<0.1);

% Check to make sure it looks like the pulse I expect
plot(t,x)

% Calculate the FFT.  This is really a fourier series calculation.  This
% means the FFT really things we have a 0.2 second square pulse that
% repeats every 10 seconds.  But I'm going to cheat, and treat it like it
% is a square pulse that never repeats.
xf=fft(x);

% I need a frequency axis in Hz.  Do this the same as you did for fourier
% series
freq=[0:length(xf)-1]*fs/length(xf);
plot(freq,abs(xf))
xlabel('Frequency (Hz)');
ylabel('Amplitude (V)');
title('Amplitude Spectrum of a Square Pulse');
xlim([0,25])
%return;

% The amplitude is way off on this.  For example at DC I was expecting an
% amplitude of 0.6, and I got 60,000.  This is a scaling factor of 100,000.
% Oddly enough, fs=100,000.  So let's change it to this by dividing xf by
% fs;
xf=fft(x)/fs;
freq=[0:length(xf)-1]*fs/length(xf);
plot(freq,abs(xf))
xlabel('Frequency (Hz)');
ylabel('Amplitude (V)');
title('Amplitude Spectrum of a Square Pulse');
xlim([0,25])
%return;

% Now let's try it with a signal read in from the outside world.
clear all; close all; clc;
[x,fs]=audioread('nineoneone.wav');

% This is the easiest way to FFT something.
xf=fft(x);

% But if you zero pad it,  you will get something closer to the Fourier
% Transform.
x=x(:);
z=x*0;
y=[x;z;z;z;z;z;z;z;z;z;z;z];
yf=fft(y);

% The zero padding I used above will work, but it takes a number of lines
% of Matlab code.  You can accomplish the same thing in Matlab like this
zf=fft(x,10*length(x));

% Make up frequency indexes for all three.  Some of them might be able to
% use the same frequency scale, but just to be safe I made up three so I
% know I won't have problems when I go to plot the spectrum
xfreq=[0:length(xf)-1]*fs/length(xf);
yfreq=[0:length(yf)-1]*fs/length(yf);
zfreq=[0:length(zf)-1]*fs/length(zf);

% Here are the three plots for comparison.  You should see that yf and zf
% are essentially identical.  The xf falls on the same line, but has a lot
% fewer samples in the frequency domain.
plot(yfreq,abs(yf),xfreq,abs(xf),'*',zfreq,abs(zf));
xlim([0 fs/2]);
xlabel('Frequency (Hz)');
ylabel('Amplitude (V)');
title('Amplitude Spectrum of 911.wav');

% The amplitude will be way off, just as it was above. But if all I care
% about is the general shape of the spectrum, then I don't need to fix
% this.
