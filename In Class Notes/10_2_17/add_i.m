function f = add_i(v)
f = zeros(size(v));
for i = 1 : length(v)
    f(i) = v(i) + i;
end