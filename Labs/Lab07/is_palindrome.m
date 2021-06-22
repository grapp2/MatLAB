function [ p ] = is_palindrome( word )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if fliplr(word) == word
    p = true;
else
    p = false;
end
disp(p)
    

end

