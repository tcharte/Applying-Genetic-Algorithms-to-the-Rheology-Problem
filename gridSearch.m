function [f_best, x_best] = gridSearch(f,l,u,p)
%GRIDSEARCH Summary of this function goes here
%   Detailed explanation goes here

% f - function f(x)
% l - lower bound in R^n
% u - upper bound in R^n
% p - number of grid points

n = length(l);
f_best = inf;
switch n
    
    case 1
        X = [l:(u-l)/(p-1):u];
        [f_best, i] = min(f(X));
        x_best = X(i);
        
    case 2
        X = l(1):(u(1)-l(1))/(p-1):u(1);
        Y = l(2):(u(2)-l(2))/(p-1):u(2);
        for i = 1:p
            for j = 1:p
                f_val = f([X(i),Y(j)]);
                if f_val < f_best
                    f_best = f_val;
                    x_best = [X(i), Y(j)]';
                end
            end
        end
        
    case 3
        X = l(1):(u(1)-l(1))/(p-1):u(1);
        Y = l(2):(u(2)-l(2))/(p-1):u(2);
        Z = l(3):(u(3)-l(3))/(p-1):u(3);
        for i = 1:p
            for j = 1:p
                for k = 1:p
                    f_val = f([X(i),Y(j),Z(k)]);
                    if f_val < f_best
                        f_best = f_val;
                        x_best = [X(i), Y(j), Z(k)]';
                    end
                end
            end
        end
        
    otherwise
        error('n is too large')
end

end
