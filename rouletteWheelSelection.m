function [selected, index_selected] = rouletteWheelSelection(fitness_scores, p)
total_fitness = sum(fitness_scores);
probabilities = fitness_scores/total_fitness
index_selected = randsample([1:length(p)],1,true,probabilities);
selected = p(:,index_selected);
end