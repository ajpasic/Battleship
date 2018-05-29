function [arr] = ShipLocations(NumShips)
% generate array of battleships
loc = randperm(9, NumShips);
arr = zeros(3);
arr(loc) = 1;
end

