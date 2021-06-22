thresh = input('Please enter the threshold below which samples will be considered to be invalid: ');
num = input('Please enter the number of data samples to enter: ');
a = [];
for i = 1:num
    b = input('Please enter a data sample: ');
    if b > thresh
        a = [a,b];
    end
end
mean(a)