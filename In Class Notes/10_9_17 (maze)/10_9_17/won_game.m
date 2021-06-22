function [ won ] = won_game( position, goal )
%WON_GAME Summary of this function goes here
%   Detailed explanation goes here
won = position.x == goal.x && position.y == goal.y;

end