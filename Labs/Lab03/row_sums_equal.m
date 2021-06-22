function [ v ] = row_sums_equal( x, n )
%ROWSUMS_ Summary of this function goes here
%   Detailed explanation goes here
a = sum(x)
if a == n
v = true
else
v = false
end
end

