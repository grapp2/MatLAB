function [move] = get_user_move()
move = 'x';
while ~isempty(move) && ~(move == 'u' || move == 'd' ||...
    move == 'l' || move == 'r' || move == 'q')
    move = input('Enter [U]p, [D]own, [L]eft, [R]ight or [Q]uit: ', 's');
    if ~isempty(move)
        move = lower(move(1));
    else
        move = 'x';
    end
end
end