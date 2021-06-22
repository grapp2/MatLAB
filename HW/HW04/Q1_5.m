WS = input('Wind Speed ');
if WS < 38
    disp('Tropical Depression')
elseif WS >= 74
    disp('Hurricane')
else
    disp('Tropical Storm')
end