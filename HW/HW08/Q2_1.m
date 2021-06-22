function [] = Q2_1 ()

structure.solution = ['Lemon juice ', 'Liquid drain cleaner ', 'Black coffee ', 'Sea water ', 'Pure water '];
structure.pH = [2, 14, 5, 8, 7];
for i = 1:length(structure.pH)
if structure.pH < 7
    structure.acidity(i) = 'acid';
elseif structure.pH > 7
    structure.acidity(i) = 'basic';
elseif structure.pH == 7
    structure.acidity(i) = 'neutral';
end
end
disp(structure.acidity)
