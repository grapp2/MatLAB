function [ v ] = col_sums_equal( x, n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
a = sum(x')
if a == n
v = true
else
v = false
end
end

