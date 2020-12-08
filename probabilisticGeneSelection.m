function child = probabilisticGeneSelection(p, q, theta)
% p - parent 1
% q - parent 2
% theta - probability of gene coming from parent 1

for i = 1:size(p,1)
    child(i,:) = probabilisticGeneSelectionHelper(p(i,:), q(i,:), theta);
end

end

function child = probabilisticGeneSelectionHelper(p, q, theta)
% p - parent 1
% q - parent 2
% theta - probability of gene coming from parent 1

rand_vec = rand(1,length(p));
from_p = p.*(rand_vec <= theta); % values taken from p
from_q = q.*(rand_vec > theta); % values taken from q

child = char(from_p + from_q);

end