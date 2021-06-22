function [ca] = Q1_4(c,n)
ca = [];
for i = 1:n
    c = char(double(c)+1);
    ca = [ca,c];
end