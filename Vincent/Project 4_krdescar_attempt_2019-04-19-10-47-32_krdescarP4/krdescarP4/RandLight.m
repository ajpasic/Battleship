function RandLight(a,pins,board)
% Light up a random number of LEDs in random locations on the breadboard
number_of_LEDs = randi(9);
Itslit = randperm(9);
Itslitty = [Itslit(1:3);Itslit(4:6);Itslit(7:9)];
for i=1:number_of_LEDs
    for r = 1:3
        for c = 1:3
            if Itslitty(r,c) == i
                board(r,c) = 1;
                UpdateBoard(a,pins(:,:),board)
            end
        end
    end
end

