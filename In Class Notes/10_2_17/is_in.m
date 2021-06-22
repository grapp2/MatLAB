function found_it = is_in(v, n)
found_it = false;
for i = 1:length(v)
    if v(i) == n
        found_it = true;
        break;
    end
end