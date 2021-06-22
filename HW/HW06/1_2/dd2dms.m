function [ d,m,s ] = dd2dms( dd )
%DD2DMS Summary of this function goes here
%   Detailed explanation goes here
d = fix(dd);
dd = dd - d;
m = floor(60*dd);
dd = 60 * dd - m;
s = floor(60 * dd);
end

