prompt = 'Type y or n ';
letter = input(prompt,'s');
if letter == 'y'
    disp('OK, continuing')
if letter == 'n'
    disp('OK, halting')
else
    disp('Error')
end
end