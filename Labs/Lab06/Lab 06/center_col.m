function [ v ] = center_col( mat )
%CENTER_COL Summary of this function goes here
%   Detailed explanation goes here
siz = size(mat);
c = siz(2);
if rem(c,2) == 0
    v = mat(:,c / 2);
else
    v = mat(:,c / 2 - .5);
end
end

