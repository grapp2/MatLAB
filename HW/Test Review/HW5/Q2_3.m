mini = input('enter min value: ');
maxi = input('enter max value: ');
choice = input('enter choice in this range: ');
count = 0;
while a ~= choice
    a = randi([mini,maxi]);
    count = count + 1;
end
fprintf('It took %d tries to generate your number\n', count)