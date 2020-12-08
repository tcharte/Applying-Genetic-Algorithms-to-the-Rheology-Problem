function x = toReal(x_bin, l, u, N)
% toReal
% x - value to be discritized
% l - lower bound
% u - upper bound
% N - number of discretization ranges

n = size(x_bin,1); % number of x variables
x = zeros(n,1); % initialize x as a column vector

interval = (u-l)/N;
for i = 1:n
    idx = bin2dec(x_bin(i,:));
    x(i) = (idx+0.5)*interval(i); % set x to be the center of the interval
end

end