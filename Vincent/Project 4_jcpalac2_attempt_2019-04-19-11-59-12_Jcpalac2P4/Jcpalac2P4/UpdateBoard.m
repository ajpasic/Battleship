function [] = UpdateBoard(a,pins,Board)
%UpdateBoard Updates the Arduino based on matrix
% A for loop that assigns the values of the Board Matrix to physical
% lights.

for c = 1:1:9
writeDigitalPin(a,pins(c),Board(c));
end
end

