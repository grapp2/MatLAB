x = rand(100,1);
y = rand(100,1);
color = input('Enter color: ', 's');
plotstyle = input('Enter plot style: ','s');
line_spec = strcat(color,plotstyle);
plot(x,y,line_spec)