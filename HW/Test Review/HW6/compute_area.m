function [ area ] = compute_area( p_1,p_2,p_3 )
%COMPUTE_AREA Summary of this function goes here
%   Detailed explanation goes here
a = sqrt((p_1(1) - p_2(1))^2 + (p_1(2) - p_2(2))^2);
b = sqrt((p_2(1) - p_3(1))^2 + (p_2(2) - p_3(2))^2);
c = sqrt((p_3(1) - p_1(1))^2 + (p_3(2) - p_1(2))^2);
s = 0.5 * (a + b + c);
area = sqrt(s * (s - a) * (s - b) * (s - c));
end

