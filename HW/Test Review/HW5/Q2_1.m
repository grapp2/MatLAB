
a = 1;
for i = 1:9
    a = a * 10 + i + 1;
    b = a * 8 + i;
    fprintf('%d x 8 + %d = %d\n', a, i, b)

end