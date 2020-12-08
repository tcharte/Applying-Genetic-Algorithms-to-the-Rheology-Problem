function child = bitShuffle(p)

for i = 1:size(p,1)
    child(i,:) = p(i,randperm(length(p(i,:))));
end

end