function [ y ] = pie( t )
%pie rectangular pulse
%   Detailed explanation goes here
    y = us(t+0.5) - us(t-0.5);
end

