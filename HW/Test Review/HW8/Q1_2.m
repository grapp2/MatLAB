names = {'Harry', 'Xavier', 'Sue'};
verbs = {'loves', 'eats'};
nouns = {'baseballs', 'rocks', 'sushi'};
L1 = length(names);
L2 = length(verbs);
L3 = length(nouns);
horzcat(names(randi([1,L1])),verbs(randi([1,L2])),nouns(randi([1,L3])))