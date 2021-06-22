function [ num ] = total( v )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
num = 0;
for i = 1 : length(v)
    num = num + v(i);
end
end
