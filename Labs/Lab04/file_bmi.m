function [ output_args ] = file_bmi( CSV )
%FILE_BMI Summary of this function goes here
%   Detailed explanation goes here
t = readtable(CSV);
A = table2array(t);
height = A(:,1);
weight = A(:,2);
a = strcat(CSV(1:end-4),'BMI','.csv');
bmi = compute_bmi(height,weight);
t2 = table(height,weight,bmi);
writetable(t2,a);

end

