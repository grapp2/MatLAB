function HW5Q10(x)
z = -inf;
y = -inf;
w = -inf;
m = size(x);
for i = 1:3
    if x(i,2)>z
        z = x(i,2);
    end
end

for i = 1:5
    if x(3,i)> y
        y = x(3,i);
    end
end

for i = 1:m(1)
    for j = 1:m(2)
        if x(i,j)>w
            w = x(i,j);
        end
    end
end
fprintf('The maximum value in the second column is %d\n', z);
fprintf('The maximum value in the third row is %d\n', y);
fprintf('The maximum value in the entire maxtrix is %d\n', w);
