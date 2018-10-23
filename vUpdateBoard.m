function vUpdateBoard(a,board,pins)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

for i=1:1:9
    writeDigitalPin(a,pins(i),board(i));
end

end

