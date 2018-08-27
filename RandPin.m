function newboard = RandPin()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
newboard = zeros(3);
x = randsample(9,randi(9));
for i=1:1:length(x)
    newboard(x(i))=1;
end
end

