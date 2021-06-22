function [bmi] = compute_bmi( height,weight )
%COMPUTE_BMI Summary of this function goes here
%   Detailed explanation goes here
bmi = (weight./(height.^2)) * 703
end

