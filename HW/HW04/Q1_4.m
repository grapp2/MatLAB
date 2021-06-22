C = input('Enter the temp in degrees C: ');
K = C+273.15;
F = (9/5) * C + 32;
T = input('Do you want K or F? ');
formatspec1 = ('The temp in degrees F is %4.1f');
formatspec2 = ('The temp in degrees K is %4.1f');
if T == K
    fprintf(formatspec2,K)
    elseif T == F
        fprintf(formatspec1,F)
else
    disp('invalid input')
end
