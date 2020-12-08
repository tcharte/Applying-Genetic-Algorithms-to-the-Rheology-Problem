function [selected, i] = elitismSelection(fitness_scores, p)

m = max(fitness_scores);
i = find(fitness_scores == m); % use find incase more than one max

if length(i)>1 % if more than one max
    i = randsample(i,1); % randomly pick one
end
selected = p(:,i);

end