% Link Budget
% Performs a link budget for antennas a certain distance apart
% HW 2, #11

% Isotropic Gain: 1
% Dipole Gain: 2.1 dB
% Dish Gain: must be given or determined

disp('INPUT');
distance = input('Distance (m): ');
c = 3e8;
frequency = input('Frequency (Hz): ');
wavelength = c/frequency;
tx_watts = input('Transmit Power (Watts): ');

tx_power = 10*log10(tx_watts); % dBW
tx_ant_gain = input('Tx Antenna Gain (dB): ');
path_loss = 20*log10(4*pi*distance/wavelength);
rx_ant_gain = input('Rx Antenna Gain (dB): ');
rx_power = tx_power + tx_ant_gain - path_loss + rx_ant_gain;

temp = input('Temperature Interference (K): ');
%cosmic background radiation
bw = input('BW (Hz): ');
ktb = 10*log10(1.4e-23 * temp * bw); % dBW for each 1Hz of bandwidth at 3degK

%SNR in 1 Hz is:
snr = rx_power - ktb; % dB

bw = 10^(snr/10); % Hz; where SNR = 1;

disp('OUTPUT');
fprintf('Receive Power (dBW): %f\n',rx_power);
fprintf('Background Radiation (dBW/Hz): %f\n',ktb);
fprintf('SNR (@ 1 Hz): %f\n',snr);
fprintf('Bandwidth (Hz): %d\n',bw);