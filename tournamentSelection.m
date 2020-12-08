function [selected, index_selected] = tournamentSelection(fitness_scores, p, selectionFunction, N)
selection = @(fscores,pop) selectionFunction(fscores, pop); % Selection Strategy
%N = 3; % Tournament Size
nt = nchoosek(length(p),N); % Number of Tournaments

tournaments = nchoosek(1:length(p),N); % all possible tournement indexes (nt by N)

t = randi(nt); % select one tournament with equal probability
t_indexes = tournaments(t,:); % indexes corresponding to tounament t
t_fscores = fitness_scores(t_indexes); % fitness scores of tournament t
t_p = p(:,t_indexes); % population of tournament t

[selected, i] = selection(t_fscores,t_p);
index_selected = t_indexes(i);
end