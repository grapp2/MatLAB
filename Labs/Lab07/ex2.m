function [ lv ] = ex2(  )
%EX2 Summary of this function goes here
%   Detailed explanation goes here
count = 0;
limit = 10;
x = -4;
y = x;
a = count == 0 & limit < 20;
b = limit < 20 | count == 0;
c = limit > 12 | count < 5;
d = ~(count == 5);
e = count == 1 & x < y;
f = count < 10 | x < y;
g = ~((count < 10) | x < y) & (count >= 0);
h = limit/count > 7 | limit < 20;
i = (limit < 20) | limit/count > 7;
j = limit/count > 7 & limit < 0;
k = limit < 0 & limit/count > 7;
l = 5 && 7 + ~6;
lv = [a,b,c,d,e,f,g,h,i,j,k,l];
end

