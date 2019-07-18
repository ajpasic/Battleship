function [] = UpdateBoard(ard,pins,board)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

for rows = 1:3
    for cols = 1:3     
        writeDigitalPin(ard,pins(rows,cols),board(rows,cols))
    end

end

