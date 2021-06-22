function [ s ] = random_number_string(  )
%RANDOM_NUMBER_STRING Summary of this function goes here
%   Detailed explanation goes here
a = randi([10,30],1,1);
b = randi([10,30],1,1);
c = num2str(a);
d = num2str(b);
s = strcat(c,d);
end

