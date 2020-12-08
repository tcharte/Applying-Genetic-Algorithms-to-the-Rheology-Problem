function [ranks, best_idx, best_fval] = rankFitness(f,p)
% f - function (or vector of fitness scores)
% p - population

n = size(p,2); % population count

if(isa(f,'function_handle'))
    fvals = zeros(1,n); % initialize fvals
    for i = 1:n % loop through and calculate each fval
        fvals(i) = f(p(:,i));
    end
else % Assume vector
    fvals = f;
end

[best_fval, best_idx] = min(fvals);

ranks = zeros(1,n); % initialize ranks
for i = 1:n
    ranks(i) = sum(fvals>=fvals(i));
end

end