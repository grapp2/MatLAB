function [ sent ] = Q1_3( s, l)
%Q1_3 Summary of this function goes here
%   Detailed explanation goes here
a = iscellstr(s);
if a == 0
    sent = s;
elseif l == 'u'
    sent = upper(s);
elseif l == 'l'
    sent = lower(s);
else
    sent = s;
end
end