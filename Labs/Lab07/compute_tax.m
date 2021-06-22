function [ tax ] = compute_tax( taxable_income )
%TAXINCOME Summary of this function goes here
%   Detailed explanation goes here
if taxable_income < 9275
    tax = 0.1 * taxable_income;
elseif taxable_income < 37650
    tax = 927.5+ 0.15 * (taxable_income - 9275);
elseif taxable_income < 91150
    tax = 5183.75 + 0.25 * (taxable_income - 37650);
elseif taxable_income < 190150
    tax = 18558.75 + .28 * (taxable_income - 91150);
elseif taxable_income < 413350
    tax = 46278.75 + .33 * (taxable_income -190150);
elseif taxable_income < 415050
    tax = 119934.75 + .35 * (taxable_income - 413350);
else
    tax = 120529.75 + .396 * (taxable_income - 415050);
end

