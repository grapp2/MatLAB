a = input('Enter the coordinate: ','s');
[wordy,rest] = strtok(a,' ');
[x,rest] = strtok(rest,' ');
[wordx,rest] = strtok(rest,' ');
y = rest;
fprintf('The coordinate is x = %.1f, y = %.1f\n',str2num(x),str2num(y))