function [ d,m,s ] = Q1_2( dd )
%Q1_2 Summary of this function goes here
%   Detailed explanation goes here
d = floor(dd);
dd = (dd - d) * 60;
m = floor(dd);
dd = (dd - m) * 60;
s = floor(dd);

end

