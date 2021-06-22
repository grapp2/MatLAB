function [ BMI ] = bmi_from_file(CSV)
%BMI_FROM_FILE Summary of this function goes here
%   Detailed explanation goes here
t = readtable(CSV);
A = table2array(t);
height = A(:,1);
weight = A(:,2);
BMI = compute_bmi(height,weight);

end

