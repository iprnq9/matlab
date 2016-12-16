dipole = 73; %ohms
power = 100e3;

% power = v^2 / (2*Resistance) for sine across resistor
voltage = sqrt(power * 2 * dipole)

% v = i * r
current = voltage / dipole