function [r,theta] = rec2pol( x,y )
%REC2POL Summary of this function goes here
%   Detailed explanation goes here
r = sqrt(x^2+y^2);
theta = rad2deg(atan(y/x));
end

