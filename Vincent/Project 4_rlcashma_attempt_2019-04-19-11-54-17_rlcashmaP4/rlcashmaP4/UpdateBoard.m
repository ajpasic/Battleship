%% ENGI 1331H Project 4 – Ray Cashman – 1796505 – rlcashman@uh.edu

function UpdateBoard(Arty,Pins,Board)

% Updates Board to reflect what is in the 3x3 logical matrix "Board"

for c = 1:9
    writeDigitalPin(Arty,Pins(c),Board(c));
end
end