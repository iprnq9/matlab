clear all; close all; clc;

% read in an audio file and sampling rate
[x, fs] = audioread('nineoneone.wav');

% create noise and limit it to a peak of 1V
noise = randn(size(x));
noise = noise/(max(noise));
subplot(311);plot(noise);

% declare snr in db and convert to linear scale
snr_dB = -50;
snr = 10^(snr_dB/10)

% limit x to peak of 1V
x = x ./ max(x);

% find x's rms and noise's rms to compare
x_rms = sqrt(mean(x.^2));
noise_rms = sqrt(mean(x.^2));
(x_rms / noise_rms)^2

% since snr is (xrms/noiserms)^2, the gain should be the sqrt of snr
gain = sqrt(snr);

% apply gain to x and add noise. x is now gain times larger than noise
x = x*gain + noise;

% limit the signal to peak of 1V
x = x ./ max(x);
subplot(312); plot(x);

sound(x,fs);