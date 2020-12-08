function f = sumOfSquaredError(x, viscosity, strain_rate)
% This function calculates the sum of squared errors

% Load Given Data
%load('viscosity.mat'); %this is bad --> loading on every function eval
%load('strain_rate.mat');

% Parameter Scale and assignment
eta0 = 520*x(1);
lambda = 14*x(2);
beta = 0.038*x(3);
eta = viscosity;
gamma_dot = strain_rate;


f = sum((eta0*(1+(lambda.^2).*(gamma_dot.^2)).^((beta-1)./2)-eta).^2);
end