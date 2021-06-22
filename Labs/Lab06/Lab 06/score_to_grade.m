function [ letter ] = score_to_grade( grade )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if grade < 50
    letter = 'F';
elseif grade < 65
    letter = 'D';
elseif grade < 72
    letter = 'C';
elseif grade < 85
    letter = 'B';
else
    letter = 'A';

end

