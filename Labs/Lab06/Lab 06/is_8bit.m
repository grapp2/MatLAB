function [ y ] = is_8bit( mat )
%IS_8BIT Summary of this function goes here
%   Detailed explanation goes here
if  isa(mat,'uint8') == 1
    y = true;
else
    y = false;
end

