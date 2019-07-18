function []=UpdateBoard(a,pins,board)
% Update the LEDs on the breadboard in order to reflect the values in the board matrix
for i=1:3
    for j=1:3
        writeDigitalPin(a,pins(i,j),board(i,j));
    end
end
end

