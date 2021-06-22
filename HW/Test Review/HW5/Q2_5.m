Tc = input('Enter cold reservior temp: ');
Th = input('Enter hot reservior temp: ');
n = 1 - Tc / Th;
if Tc <= 0 || Th <= 0
    disp('Error temp cannot be <= 0')
elseif Th < Tc
    n = 1 - Th / Tc;
    fprintf('eta = %.3f\n',n)
else
    fprintf('eta = %.3f\n',n)
end
