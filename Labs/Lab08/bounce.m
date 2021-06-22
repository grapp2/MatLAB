function [ trajectory ] = bounce( theta, v0 )
%BOUNCE Summary of this function goes here
%   Detailed explanation goes here
x = [0,0];
v = [v0*cosd(theta),v0*sind(theta)];
g = 9.8;
t = 0:0.01:2;
changeoft = .01;
trajectory = x;
for i = 2:length(t)
    x = [x(1) + (v(1) * changeoft), x(2) + v(2) * changeoft + -.5 * g * changeoft ^ 2];
    v = [v(1), v(2) + (-g * changeoft)];
    if x(2) <= 0
        x(2) = -x(2);
        v(2) = -v(2)*.8;
    end
    trajectory = vertcat(trajectory,x);
    a = trajectory(:,1);
    b = trajectory(:,2);
    plot(a,b)
    pause(.01)
end

end

