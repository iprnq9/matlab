% Dish Antenna Gain

c = 3e8;

disp('INPUT');
diameter = input('Dish Diameter (m): ');
frequency = input('Frequency (Hz): ');

wavelength = c/frequency;
area_dish = pi*(diameter/2)^2;
area_isotropic = wavelength^2/(4*pi);
antenna_gain = area_dish/area_isotropic;
antenna_gain_dB = 10*log10(antenna_gain); % dBi
point_error_deg = 2/sqrt(antenna_gain) * 180/pi; % degrees
point_error_cm = sind(point_error_deg) * diameter/2 * 100; % centimeters

disp('OUTPUT');
fprintf('Antenna Gain (dBi): %f\n',antenna_gain_dB);
fprintf('Point Error (deg): %f\n',point_error_deg);
fprintf('Point Error (cm): %f\n',point_error_cm);