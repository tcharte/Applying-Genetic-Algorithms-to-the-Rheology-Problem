function child = crossover(p, q, n)
% p - parent 1
% q - parent 2
% n - number of crossovers

for i = 1:size(p,1) %loop through every x variable
    child(i,:) = crossoverHelper(p(i,:), q(i,:), n);
end

end

function child = crossoverHelper(p, q, n)
% p - parent 1
% q - parent 2
% n - number of crossovers

d = length(p);

if(n <= 0 || n > d-1)
    error('Invalid number of crossovers')
end

x = randi(length(p)-n);

first_portion = p(1:x);

n = n-1; % number of remaining crossovers
if(n==0)
    second_portion = q(x+1:end);
else
    second_portion = crossoverHelper(q(x+1:end),p(x+1:end),n); % recursive call
end

child = [first_portion second_portion];
    
end