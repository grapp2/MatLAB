function [ ] = my_scholarship( classification, numberOfyear )
% my_scholarship.m
% This program computes the amount of scholarship for the undergraduate and graduate students.
% The user provides the classification and the year he/she is in school.
% Input: classification - letters U or u for Undergrads and G or g for grads
% Year in school: numberOfYear
% Output: The amount of scholarship in U.S. Dollars
%
% Rahman Tashakkori - rt AT ....
% Feb 4 2010
% Mitch Parry - rmp AT ....
% Sep 23 2014
%
%Set the defaults scholarship amount to 0
scholarship = 0;
% Get the classification and year in school
if classification ~= 'g' && classification ~= 'G' && classification ~= 'u' && classification ~= 'U'
classification = 'u';
end
numberOfyear = floor(numberOfyear);
if (classification == 'u' || classification == 'U') && (numberOfyear > 4 && numberOfyear < 0)
numberOfyear = 0;
end
% compute scholarship for undergraduate students
if classification == 'u' || classification == 'U'
sClass = 'You are an undergraduate student in year ';
sScholarship = ' and your scholarship amount is: $';
if numberOfyear == 1
scholarship = 3500;
elseif numberOfyear == 2
scholarship = 3750;
elseif numberOfyear == 3
scholarship = 4000;
elseif numberOfyear == 4
scholarship = 4250;
else
scholarship = 0;
end
end
% compute scholarship for graduate students
if classification == 'g' || classification == 'G'
sClass = 'You are a graduate student in year ';
sScholarship = ' and your scholarship amount is: $';
if numberOfyear == 1
scholarship = 5500;
elseif numberOfyear == 2
scholarship = 6750;
else
scholarship = 0;
end
end
% Display the results
disp([sClass num2str(numberOfyear) sScholarship num2str(scholarship)])

