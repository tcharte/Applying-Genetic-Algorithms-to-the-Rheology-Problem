function [f_best, x_best] = geneticAlgorithmB(f, l, u, pop_size, n_generations)

% f - Function
% l - Lower Bound
% u - Upper Bound
p = (u-l).*rand(size(l,1),pop_size); % Initial Population (first generation)
n_intervals = 256; % Intervals for Binary Discritization
theta = 0.7; % probability of gene from parent 1 (probabilisticGeneSelection)
gamma = 0.2; % Probability of BitInversion
k = 0; % Iteration Counter
f_best = inf;

while(k < n_generations)
    next_gen = []; % variable to store survivors
    
    %-- Fitness:
    [fitness_scores, best_idx, best_fval] = rankFitness(f,p);
    
    if best_fval < f_best % if better than f_best
        x_best = p(:,best_idx); 
        f_best = best_fval;
    end
    
    
    %-- Reproduce:
    while(next_gen < pop_size)
        
        if(rand()<0.5)
            % Select two parents
            idxs = randperm(pop_size); % get randomized population indexes
            [parent_1, index_p1] = elitismSelection(fitness_scores(:,idx(1:pop_size/2)), p(:,idx(1:pop_size/2)));
            [parent_2, index_p2] = elitismSelection(fitness_scores(:,idx(pop_size/2+1:end)), p(:,idx(pop_size/2+1:end)));
            
            parent_1 = toBin(parent_1,l,u,n_intervals);
            parent_2 = toBin(parent_2,l,u,n_intervals);
            
            child = probabilisticGeneSelection(parent_1, parent_2, theta);
            child = toReal(child,l,u,n_intervals);
            
            if((child > l) & (child < u)) % if child is a feasible point
                next_gen = [next_gen child]; % add child to new generation
            end
        else
            % Select a survivor
            survivor = p(:,randi(pop_size));
            survivor = toBin(survivor,l,u,n_intervals);
            survivor = bitInversion(survivor,gamma); % Mutate Survivor
            survivor = toReal(survivor,l,u,n_intervals);
            
            if((survivor > l) & (survivor < u)) % if child is a feasible point
                next_gen = [next_gen survivor]; % add child to new generation
            end
            
        end
        
    end
    %-- Update:
    p = next_gen;
    k = k+1;
end

end