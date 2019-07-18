%% ENGI 1331H Project 4 – Ray Cashman – 1796505 – rlcashman@uh.edu

function RandLight(Arty,Pins,~)

% Function Generates a random 3x3 logical matrix and then
% uses matrix to light LED's where there is a 1
% Also displays amount of LED's randomly turned on

Board = randi([0 1],3,3);
Number_of_Lights = sum(sum(Board))
for c = 1:9
    writeDigitalPin(Arty,Pins(c),Board(c));
end
end