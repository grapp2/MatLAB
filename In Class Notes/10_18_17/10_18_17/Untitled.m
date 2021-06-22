%h = plot(rand(10,1));
%h.Color = [1,0,0];
a = [];
for i = 1:10
    point = struct('x', rand(),'y',rand(),'z',rand());
%concatenate vector:
    a = [a,point];
end