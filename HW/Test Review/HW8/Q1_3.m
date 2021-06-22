function [ a ] = Q1_3( s, uol )
%Q1_3 Summary of this function goes here
%   Detailed explanation goes here
b = iscellstr(s);
if b == 0
    a = s;
elseif uol == 'l'
    a = lower(s);
elseif uol == 'u'
    a = upper(s);
else
    a = s;
end

