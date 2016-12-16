clc; clear all; close all;
j = sqrt(-1);

m = [0 1 0 1 1 0];

for k=1:100
    m = [m m];
end;

Y = fskmod(m,2,5,30,1000);

plot(Y);