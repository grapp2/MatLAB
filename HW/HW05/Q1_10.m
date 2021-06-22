function Q1_10(mat)
x = -inf;
y = -inf;
z = -inf;
a = size(mat);
for i = 1:3
    if mat(i,2)>x
        x = mat(i,2)
    end
end
for i = 1:5
    if mat(3,i)>y
        y = mat(3,i)
    end
end
for i = 1:a(1)
    for j = 1:a(2)
        if mat(i,j)>z
            z = mat(i,j)
        end
    end
end