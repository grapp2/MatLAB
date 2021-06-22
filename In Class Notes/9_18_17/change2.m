val = input('enter the command: ', 's');
val = lower(val);
val = val(1);
switch val
    case 'r'
        disp('Move right');
    case 'l'
        disp('Move left');
    case 'u'
        disp('Move up');
    case 'd'
        disp('Move down');
    case 'q'
        disp('Quit');
    otherwise
        disp('Invalid input');
end

if val == 'r'
    disp('Move right');
elseif val == 'l'
    disp('Move left');
elseif val == 'u'
    disp('Move up');
elseif val == 'd'
    disp('Move down');
elseif val == 'q'
    disp('Quit');
else
    disp('Invalid input');
end
