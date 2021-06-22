function[r,theta] = rec2pol(x,y)
r = sqrt(x^2+y^2);
theta = atan(y/x);
atan2(x,y)