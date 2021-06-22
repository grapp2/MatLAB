function [ area ] = compute_area( a,b,c )
%COMPUTE_AREA Summary of this function goes here
%   Detailed explanation goes here
s = 0.5*(a+b+c);
[a,b,c] = points2abc(x1,y1,x2,y2,x3,y3);
area = sqrt(s*(s-a)*(s-b)*(s-c));

end

