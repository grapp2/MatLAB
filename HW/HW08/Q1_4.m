function [ c ] = Q1_4( a, n )
%Q1_4 Summary of this function goes here
%   Detailed explanation goes here
for i = 1:n
    c{i} = char(double(a)+i - 1);
    c = c(1:i);
end
end
    

