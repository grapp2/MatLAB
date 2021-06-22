function [  ] = Q2_3( mat )
%Q2_3 Summary of this function goes here
%   Detailed explanation goes here
persistent total
if isempty(total)
    total = 0;
end
total = sum(mat) + total;
fprintf('The sum is now %d\n',total)


end

