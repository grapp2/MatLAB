function [ J, v1, v2, rmsd ] = enhance( I )
%ENHANCE Summary of this function goes here
%   Detailed explanation goes here
Io = I;
[r,c] = size(I);

for i = 1:r
    for j = 1:c
        if I(i,j) <=50
            I(i,j) = I(i,j) + 10;
        elseif I(i,j) <= 124
            I(i,j) = 85;
        elseif I(i,j) == 125
            I(i,j) = I(i,j);
        elseif I(i,j) <= 199
            I(i,j) = 165;
        elseif I(i,j) <= 250
            I(i,j) = I(i,j) - 10;
        else
            I(i,j) = I(i,j);
        end
    end
end

J = I;

ve2 = double(Io);
average = mean(ve2(:));
minimum = min(ve2(:));
maximum = max(ve2(:));
middle = median(ve2(:));

v1 = [average,minimum,maximum,middle];

ve2 = double(J);
average2 = mean(ve2(:));
minimum2 = min(ve2(:));
maximum2 = max(ve2(:));
middle2 = median(ve2(:));

v2 = [average2, minimum2, maximum2, middle2];

r = (double(Io) - double(I)).^2;
rmsd = sqrt(mean(r(:)));

end

