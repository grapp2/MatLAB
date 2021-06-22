function simple_program(original_number)
if original_number < 0
my_number = abs(original_number);
sqr = sqrt(my_number);
else
    my_number = original_number;
    sqr = sqrt(my_number);
end
fprintf('Your Original Number was %d and your new number is %8.6f\n', ...
original_number, sqr);

