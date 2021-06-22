function [  ] = retrieve_image(  )
%RETRIEVE_IMAGE Summary of this function goes here
%   Detailed explanation goes here
name = input('Enter first and last name separated by a space: ', 's');
fprintf('The image of %s is shown.\n', name)
v = isspace(name);
a = find(v,1);
name(a) = [];
b = strcat(name,'.jpg');
if exist(b)
    imshow(b)
else
    imshow('Default.jpg')
end

