function [f] = total(v)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
f = 0;
for i = 1:length(v)
    f = f + v(i);
end
disp(f);
%sum will do the exact same thing but in one line