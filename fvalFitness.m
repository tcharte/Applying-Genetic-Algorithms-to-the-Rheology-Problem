function [scores, best_idx, best_fval] = fvalFitness(f,p)
% f - function
% p - population

n = size(p,2); % population count

if(isa(f,'function_handle'))
    fvals = zeros(1,n); % initialize fvals
    for i = 1:n % loop through and calculate each fval
        fvals(i) = f(p(:,i));
    end
else % Assume_vector
    fvals = f;
end

[best_fval, best_idx] = min(fvals);

fbar = max(fvals);
scores = zeros(1,n);
for i = 1:n
    scores(i) = -fvals(i) + fbar + 1;
end

end