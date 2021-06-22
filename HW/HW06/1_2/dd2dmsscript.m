dd = input('Angle in DD: ');
[degrees, minutes, seconds] = dd2dms(dd);
disp([degrees, minutes, seconds])