% circscript.m
n = randi(4);
for i = 1:n
circ = input('Enter the circumference of a circle: ');
[rad, area] = radarea(circ);
dispra(rad, area);
end