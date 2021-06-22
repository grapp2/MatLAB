function [ v ] = middle_row( image )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
siz = size(image);
r = siz(1);
if rem(r, 2) == 0
    v = image(r/2, :);
else
    v = image(r/2-.5, :);

end

