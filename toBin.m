function x_bin = toBin(x, l, u, N)
% toBin - Uses binaryDiscritization()
% This function works with vector inputs for x, l, u
% returns a char array length(x) by log2(N)

% x - value to be discritized
% l - lower bound
% u - upper bound
% N - number of discretization ranges


for i = 1:length(x)
    x_bin(i,:) = binaryDiscritization(x(i),l(i),u(i),N);
end

end