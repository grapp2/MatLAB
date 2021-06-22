function [ x,y ] = find_xy( Vo, t, theta )
%FIND_XY Summary of this function goes here
%   Detailed explanation goes here
x = Vo * cosd(theta) * t;
y = Vo * sind(theta) * t - .5 * 9.8 * t^2;

end

