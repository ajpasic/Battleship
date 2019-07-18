function UpdateBoard(board,pins,arduinoboard)
%Name:  Daniel Dorali
%Last Updated: 04/10/19
%Purpose: This function will update the LEDs on the breadboard
%to reflect the values in the board matrix. A "0" signifies that
%the LED is turned off, and a "1" means that it is on.
[r,c] = size(board);
for n = 1:(r*c)
    if board(n) == 0
        selectedpin = pins(n);
        writeDigitalPin(arduinoboard,selectedpin,0);
    elseif board(n) == 1
        selectedpin = pins(n);
        writeDigitalPin(arduinoboard,selectedpin,1)
    end
end
end