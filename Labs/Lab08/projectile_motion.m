function [  ] = projectile_motion(  )
%PROJECTILE_MOTION Summary of this function goes here
%   Detailed explanation goes here
figure(1); clf;
x = [];
y = [];
for i = 15:15:90
    for t = 0:.01:2
    Vx = 10 * cosd(i);
    Vy = 10 * sind(i);
    a = Vx*t;
    b = -0.5*9.8*t.^2 + Vy * t;
    x = [x,a];
    y = [y,b];
    end
hold on
    if i == 15
        plot(x,y,'color',[0 0 1])
    elseif i == 30
        plot(x,y,'color',[1 0 0])
    elseif i == 45
        plot(x,y,'color',[1 0 1])
    elseif i == 60
        plot(x,y,'color',[0 1 0])
    elseif i == 75
        plot(x,y,'color',[0 1 1])
    elseif i == 90
        plot(x,y,'color',[1 1 0])
    end
        x = [];
        y = [];
        
end
hold off

