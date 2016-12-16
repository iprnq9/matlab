fs = 8000;
t  = 0:1/fs:2;

noise = randn(size(t));
noise = noise/sqrt(mean(noise.^2));

avg_power_watts = mean(noise.^2)
desired_avg_power_dBm = 0;
desired_avg_power_mwatts = 0.001*10.^(desired_avg_power_dBm/10);

gain = sqrt(desired_avg_power_mwatts);
noise = gain*noise;

power = 10*log10(1000*mean(noise.^2))

plot(t,noise);
%sound(noise,fs);