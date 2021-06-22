weight = input('Enter your height in inches: ');
height = input('Enter your weight in pounds: ');
bmi = (weight/(height^2))*703;
fprintf('Your BMI is %.1f\n',bmi)