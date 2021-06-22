function [  ] = save_grade_hist( grades )
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
grades = readtable('fakegrades.csv');
xbins = (0:5:100);
f1 = figure;
hist(grades,xbins)
strcat('fakegrades','.png')
xlabel('Grade Histogram')
ylabel('Grade')
title('Student Count')
saveas(LAB, 'Histogram.png')
end

