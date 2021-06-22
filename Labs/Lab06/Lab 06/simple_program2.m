function simple_program2(originalNumber)
if originalNumber < 0
myNumber = abs(originalNumber);
sqrtNumber = sqrt(myNumber);
fprintf('Your Original Number was %d and it was converted to: %d. The square root of your new number is: %8.6f', originalNumber, myNumber, sqrtNumber);
elseif originalNumber == 0
    disp('Your input is zero')
else
myNumber = originalNumber/2;
sqrtNumber = sqrt(myNumber);
fprintf('Your Original Number was %d and it was divided by 2 to get: %8.6f. The square root of your new number is: %8.6f', originalNumber, myNumber, sqrtNumber);
end