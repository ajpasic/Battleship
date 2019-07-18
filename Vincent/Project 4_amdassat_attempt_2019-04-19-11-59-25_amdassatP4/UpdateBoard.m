function [] = UpdateBoard(a,board,pins)
%Turns the 3x3 matrix of LEDs on and off based on a board matrix
    %a - arduino object
    %board - board matrix
    %pins - pins matrix (string)
for r = 1:3                              %represents the rows of board
    for c = 1:3                          %represents the columns of board
    if board(r,c) == 0                   %Cycles through all the rows ans cols, check is value is 0
        writeDigitalPin(a,pins(r,c),0);  %turns of the LED at the specified row and column
    elseif board(r,c) == 1               %Cycles through all the rows ans cols, check is value is 1
        writeDigitalPin(a,pins(r,c),1);  %turns of the LED at the specified row and column 
    end
    end
end

