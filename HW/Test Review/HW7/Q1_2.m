x = randi([0,30],1,30);
y = randi([0,30],1,30);
c = input('Enter color: ','s');
ps = input('Enter plot style: ','s');
linespec = strcat(c,ps);
plot(x,y,linespec)