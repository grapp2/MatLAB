actual = 1/exp(1);
n = 1;
appx = (1 - 1/n)^n;

while .0001 < abs(actual - appx) 
    n = n + 1;
    appx = (1 - 1/n)^n;
end
fprintf('1/e = %.4f, approx = %.4f, n = %d\n',actual,appx,n)