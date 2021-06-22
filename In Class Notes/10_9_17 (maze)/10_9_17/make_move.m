function[user_position] = make_move(move, user_position, maze)
new_position = user_position;
switch move
    case 'u'
        new_position.y = new_position.y + 1;
    case 'd'
        new_position.y = new_position.y - 1;
    case 'l'
        new_position.x = new_position.x-1;
    case 'r'
        new_position.x = new_position.x+1;
    otherwise
        error(['invalid input',move]);
end
if new_position.x > 0 && new_position.y > 0 &&...
   new_position.x <= size(maze,2) && ... 
   new_position.y <= size(maze,1) && ...
   maze(new_position.y,new_position.x) ~= 1
   user_position = new_position;
end