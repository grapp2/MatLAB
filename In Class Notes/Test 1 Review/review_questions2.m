%3.1.9
F = input('enter F:');
x = linspace(0,50,100)

%Ethyl
a = .246
b = .806
y_1 = F*exp(-a*x).*sin(b*x)

%Water
a = .250
b = 1
y_2 = F*exp(-a*x).*sin(b*x)

%Oil
a = .643
b = 1.213
y_3 = F*exp(-a*x).*sin(b*x)

plot(x, y_1)
hold on
plot(x, y_2)
plot(x, y_3)
hold off
legend('Ethyl','Water','oil')