function [ v ] = sequential_integers( mat )
%SEQUENTIAL_INTEGERS Summary of this function goes here
%   Detailed explanation goes here
n = size(mat);
a = unique(mat);
x = size(a);
b = n(1)*n(2);
c = min(a);
d = max(a);
if x(1) == b
   if c==1 && d==n(1)^2
        v = true
    else
    v = false
    end
else
v = false
end
end
