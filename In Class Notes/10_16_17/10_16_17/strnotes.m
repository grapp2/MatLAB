%strcat is used to concatenate strings
a = 'image';
b = '.jpg';
strcat(a,b)
%strcmp is used to see if a string is equal to another string
c = 'he';
strcmp(c, 'hello')
%finding spaces
d = 'hi there';
isspace(d)
%finding letters
find('e')
d == 'e'
%strfind finds where strings are - can be multiple strings
strfind(d,'er')
f = 'elelelel';
strfind(f,'el')
strfind(f,'elel')
%strtok splits strings using deliminer
g = 'cat,dog,chicken'
[word, rest] = strtok(g,',')
[word, rest] = strtok(rest,',')
[word, rest] = strtok(rest,',')
rest = g; while ~isempty(rest),[word,rest] = strtok(rest, ','); disp(word); end
%if you have g, the while loop will continue forever
%rest = x; while ~isempty(rest),[word,rest] = strtok(g, ','); disp(word); end

