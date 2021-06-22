function [  ] = my_factorial( n )
%MY_FACTORIAL Summary of this function goes here
%   Detailed explanation goes here
if n < 0
    n = 0;
elseif n > 10
    n = 10;
elseif floor(n) ~= n
    n = floor(n);
end
m=n;
fprintf('%d! = ',n)
if n >= 2
    for j = n:-1:2
        fprintf('%d*',j)
    end
end
fprintf('1')
fprintf(' = %d\n',factorial(m))