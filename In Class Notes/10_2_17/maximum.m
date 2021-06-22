function mx = maximum(v)
mx = -inf;
for i = 1 : length(v)
    if v(i) > mx
        mx = v(i)
    end
end