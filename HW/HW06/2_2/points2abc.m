function [ a,b,c ] = points2abc( [x1,y1],[x2,y2],[x3,y3] )
%POINTS2ABC Summary of this function goes here
%   Detailed explanation goes here
a = sqrt((x1 - x2)^2+(y1 - y2)^2);
b = sqrt((x2 - x3)^2+(y2 - y3)^2);
c = sqrt((x1 - x3)^2+(y1 - y3)^2);

end

