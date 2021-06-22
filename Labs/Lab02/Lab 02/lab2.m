[x,Fs] = audioread('speech.wav')
plot (x)
x1 = mean(x, 2)
x2 = x1 * 2

