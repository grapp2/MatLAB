num = randi([1,100]);
count = 0;
guess = input('Enter your guess: ');
while guess ~= num
guess = input('Enter your guess: ');
count = count + 1;
if guess < num
    disp('too low')
elseif guess > num
    disp('too high')
end
end
fprintf('Total guesses: %d\n',count)
if count > 5
    fprintf('You are trash\n')
elseif count < 5
    fprintf('You are a god\n')
end