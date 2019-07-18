function [] = UpdateBoard(Arduino,Pins,Board)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for c = 1:1:9
    writeDigitalPin(Arduino,Pins(c),Board(c));
end

