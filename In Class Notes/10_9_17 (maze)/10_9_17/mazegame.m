user_position = struct('x',1,'y',1);

%create maze
rand('seed',1);
maze = randi([0,1],10,10);
maze(:,5) = 0;
maze(end,:) = 0;
user_handle = disp_game(user_position,maze);
goal.x = 10;
goal.y = 10;
while ~won_game(user_position, goal)
    user_handle.XData = user_position.x;
    user_handle.YData = user_position.y;
    move = get_user_move();
    user_position = make_move(move, user_position, maze);
    if won_game(user_position, goal)
        disp('Winner!')
        
    end
end