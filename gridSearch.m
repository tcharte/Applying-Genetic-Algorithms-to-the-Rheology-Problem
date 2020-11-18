function [f_best, x_best] = gridSearch(f,l,u,p)
%GRIDSEARCH Summary of this function goes here
%   Detailed explanation goes here

% f - function must take the form f = @(x,y,z) expression
% l - lower bound in R^n
% u - upper bound in R^n
% p - number of grid points
n = length(l);

switch n
    case 1
        X = [l:(u-l)/(p-1):u];
        [f_best, i] = min(f(X));
        x_best = X(i);
    case 2
        [X, Y] = meshgrid(l(1):(u(1)-l(1))/(p-1):u(1),l(2):(u(2)-l(2))/(p-1):u(2));
        [f_best, i] = min(f(X,Y),[],'all','linear');
        x_best = [X(i), Y(i)];
    case 3
        [X, Y,Z] = meshgrid(l(1):(u(1)-l(1))/(p-1):u(1), l(2):(u(2)-l(2))/(p-1):u(2), l(3):(u(3)-l(3))/(p-1):u(3));
        [f_best, i] = min(f(X,Y,Z),[],'all','linear');
        x_best = [X(i), Y(i), Z(i)];
    otherwise
        error('n is too large')
end

end
