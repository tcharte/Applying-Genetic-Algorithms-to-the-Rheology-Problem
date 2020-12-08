function child = bitShift(p)

for i = 1:size(p,1)
    k = randi(length(p(i,:))-1); % values to shift by
    child(i,:) = circshift(p(i,:),k);
end

end