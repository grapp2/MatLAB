function [ v ] = is_square( mat )
%IS_SCRIPT Summary of this function goes here
%   Detailed explanation goes here
b = size(mat)
if b(1)==b(2)
    v = true
else
    v = false
end
end

