function[] = RandLight(a,pins,board)
% RandLight() will light up a random number of LED's 1-9 
%   Using a nested for loop, the RandLight function will randomly 
%   select positions to light. 
q = randperm(9);
kk = [q(1:3); q(4:6); q(7:9)];
qq = randi(9);
for i = 1:qq
    for r = 1:3
        for c = 1:3
            if kk(r,c) == i
                board(r,c) = 1;
                UpdateBoard(a,pins(:,:), board)
            end
        end
    end
end

