function [] = RandLight(ard,pins,board)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
R = randi(70000,[3 3]);
RA = randi(9);
fprintf('\nThe amount of randomly selected LEDs is: %0.2f',RA)
for n=1:RA
    [rows2,cols2] = find(R==min(min(R)));
        board(rows2,cols2) = 1;
        UpdateBoard(ard,pins,board);
        R(rows2,cols2) = 90000;
end
end

