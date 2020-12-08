function [f_best, x_best] = geneticAlgorithmA(f, l, u, pop_size, n_generations)

% f - Function
% l - Lower Bound
% u - Upper Bound
p = (u-l).*rand(size(l,1),pop_size); % Initial Population (first generation)
n_intervals = 256; % Intervals for Binary Discritization
n_crossovers = 3; % Number of Crossovers
k = 0; % Iteration Counter
f_best = inf;

while(k < n_generations)
    next_gen = []; % variable to store survivors
    %-- Fitness:
    [fitness_scores, best_idx, best_fval] = rankFitness(f, p);
    
    if best_fval < f_best % if better than f_best
        x_best = p(:,best_idx); 
        f_best = best_fval;
    end
    
    %-- Reproduce:
    while(next_gen < pop_size)
        
        [parent_1, index_p1] = rouletteWheelSelection(fitness_scores, p);
        [parent_2, index_p2] = rouletteWheelSelection(fitness_scores, p);
        
        parent_1 = toBin(parent_1,l,u,n_intervals);
        parent_2 = toBin(parent_2,l,u,n_intervals);
        
        child = crossover(parent_1, parent_2, n_crossovers); % crossover
        child = toReal(child,l,u,n_intervals); % Convert back from binary
        
        if((child > l) & (child < u)) % if child is a feasible point
            next_gen = [next_gen child]; % add child to new generation
        end
        
    end
    %-- Updaate
    p = next_gen;
    k = k+1;
    
end

end