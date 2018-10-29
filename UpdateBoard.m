function UpdateBoard(a,board,pins)
% This function updates the LEDs on the physical breadboard
% so that they reflect the values of the digital board matrix.

for i=1:1:9
    writeDigitalPin(a,pins(i),board(i));
end

end

