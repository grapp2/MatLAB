C = input('Enter the maximum temperature in celsius between -16 and 20: ');
F = ((9/5)*C)+32;
if C ~= (-18:20)
    disp('Invalid input! Maximum degrees should be between -18 and 20 degrees Celsius');
end
fprintf('    F      C\n');
for i = 0:5:F
    a = (5 / 9)*(F - 32);
    fprintf('%6.1f   %6.1f\n',i,a);
end