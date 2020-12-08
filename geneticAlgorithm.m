function [f_best x_best] = geneticAlgorithm(f, p0)

% f - Function
p = p0; % Initial Population
gamma = 0.5; % (0,1) Mutation Probability
k = 0; % Iteration Counter


while(k < kmax)
    next_gen = []; % variable to store survivors
    %-- Fitness:
    fitness_values = fitness(f,p);

%     if(length(p)<2) %if population less than 2, algorithm stops
%         break;
%     end
    
    %-- Reproduce:
    
    % 2a) Selection: select 2 parents from Pk and proceed to 2b
    %    or select 1 survivor from Pk and proceed to 2d)
    i = 0;
    while(i < length(p)/2)
        %Select parents from pk
        if(2*i+1 ~= length(p)) % Two parents
            % Crossover: use the 2 parents to create an offspring
            parents = [p(:,2*i+1) p(:,2*i+2)];
            % 2b)
            % with probability γ mutate the offspring
            offspring = mutate(parents,gamma);
            % if the offspring is infeasible declare the offspring deceased and return to 2a)
            if offspring == no_good
                % offspring deceased
                i = i+1;
                continue; % skip this iteration and go to next
            else
                % offspring survives
                survivor = offspring;
            end
            % otherwise declare the offspring a survivor and proceed to 2d)
        else
            % only one parent left
            survivor = p(:,end);
        end
        % 2d) Update next generation: place survivor into Pk+1
        next_gen = [next_gen survivor] % add survivor to next generation
        % if |Pk+1| ≥ pbar declare population complete and proceed to 3
        % otherwise declare population incomplete and go to 2a)
        i = i+1;
    end
    % next_gen is full
    p = next_gen;
    k = k+1;
end



%2b) Crossover: use the 2 parents to create an offspring

%2c) Mutation: with probability γ mutate the offspring 
%               if the offspring is infeasible declare the offspring deceased and return to 2a)
%               otherwise declare the offspring a survivor and proceed to 2d)

%2d) Update next generation: place survivor into Pk+1 if |Pk+1| ≥ pbar declare population complete and proceed to 3
%                otherwise declare population incomplete and go to 2a)

%-- Update:
% k = k+1, stop or go to 1

end