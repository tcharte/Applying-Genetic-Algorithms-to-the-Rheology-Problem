function x_bin = binaryDiscritization(x,l,u,N)
% x - value to be discritized
% l - lower bound
% u - upper bound
% N - number of discretization ranges

interval_seperations = [l:(u-l)/N:u];
num_bits = ceil(log2(N));

if(x<l || x>u)
    error('x is out of range');
else
    for i = 1:N
        if(x>=interval_seperations(i) && x<=interval_seperations(i+1))
            x_bin = dec2bin(i-1,num_bits); % minus one to index intervals from 0
            return;
        end
    end
end

end
