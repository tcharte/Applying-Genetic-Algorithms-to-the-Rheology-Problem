function [f_best, x_best] = latinHypercubeSampling(f,l,u,p)


n = length(l);
PI = zeros(n,p);
for i = 1:n
    PI(i,:) = randperm(p);
end
r = rand(n,p);
x = l + ((PI-r)./p).*(u-l);

switch n
    case 1
        [f_best, i] = min(f(x));
        x_best = x(i);
    case 2
        [f_best, i] = min(f(x(1,:),x(2,:)));
        x_best = [x(1,i), x(2,i)];
    case 3
        [f_best, i] = min(f(x(1,:),x(2,:),x(3,:)));
        x_best = [x(1,i), x(2,i), x(3,i)];
    otherwise
        error('n is too large')
end

end