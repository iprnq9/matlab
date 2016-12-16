clc; clear; close all;

height = input('Height (m): ');
radius_earth = 6.371e6; % meters
range = sqrt(2*height*radius_earth) % meters