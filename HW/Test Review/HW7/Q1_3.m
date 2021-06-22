function [  ] = Q1_3( s )
%Q1_3 Summary of this function goes here
%   Detailed explanation goes here
a = fliplr(s);
if a == s
    disp('word is palindrome')
else
    disp('word is not palindrome')
end

