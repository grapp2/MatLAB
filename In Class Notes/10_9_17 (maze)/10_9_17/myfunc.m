function[s] = myfunc(x)
persistent count
if isempty(count) || (nargin>0 && x == 0)
    count = 0;
end
count = count+1;
s = randi(10);
disp(count);