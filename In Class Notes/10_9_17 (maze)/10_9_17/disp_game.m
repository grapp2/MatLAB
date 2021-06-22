function [h] = disp_game(user_position,maze)

figure (1);
clf;
imagesc(maze);
hold on;
colorbar;
h = plot(user_position.x, user_position.y, '+c');
plot(size(maze, 2), size(maze,1), 'or', 'markersize', 20);
axis xy
hold off;
title('solve the maze by navigating to the red circle')
end