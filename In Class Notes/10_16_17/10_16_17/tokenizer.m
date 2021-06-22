x = 'the temperature is 24.5 degrees and the humidity is 45%'

i = 1; rest = x
while ~isempty(rest)
    [word,rest] = strtok(rest, ' ');
    disp(word);
    if i == 4
        temp = word;
    end
    if i == 10
        humidity = word;
    end
    i = i+1;
end
temp = str2num(temp);
humidity = str2num(humidity(1:end-1));
disp(temp)
disp(humidity)
