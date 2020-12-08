function child = bitInversion(p,theta)
% p - Parent
% theta - Inversion Probability

for i = 1:size(p,1) %loop through every x variable
    child(i,:) = bitInversionHelper(p(i,:), theta);
end

end


function child = bitInversionHelper(p,theta)

rand_vec = rand(1,length(p));
invert_bits = rand_vec<=theta; % logical vector
p = p=='1'; % logical vector

child = xor(p, invert_bits); % invert the selected bits

child = num2str(child); % from logical to binary
child(child==' ') = []; % delete spaces from string

end