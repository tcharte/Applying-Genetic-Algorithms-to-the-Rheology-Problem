function [f_best, x_best] = latinHypercubeSampling(f,l,u,p)


n = length(l);
PI = zeros(n,p);
for i = 1:n
    PI(i,:) = randperm(p);
end
r = rand(n,p);
x = l + ((PI-r)./p).*(u-l);
f_best = inf;

switch n
    case 1
        for i = 1:length(x)
            f_val = f(x(1,i));
            if f_val < f_best
                f_best = f_val;
                x_best = x(1,i);
            end
        end
    case 2
        for i = 1:length(x)
            f_val = f([x(1,i),x(2,i)]);
            if f_val < f_best
                f_best = f_val;
                x_best = [x(1,i),x(2,i)]';
            end
        end
    case 3
        for i = 1:length(x)
            f_val = f([x(1,i),x(2,i),x(3,i)]);
            if f_val < f_best
                f_best = f_val;
                x_best = [[x(1,i),x(2,i),x(3,i)]]';
            end
        end
    otherwise
        error('n is too large')
end

end