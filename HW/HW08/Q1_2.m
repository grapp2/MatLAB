names = {'Harry','Xavier','Sue'};
verbs = {'loves','eats'};
nouns = {'baseballs','rocks','sushi'};

L1 = length(names);
L2 = length(verbs);
L3 = length(nouns);


for i = 1:100
    vec = horzcat(names(randi(L1)),verbs(randi(L2)),nouns(randi(L3)));
    disp(vec)
end