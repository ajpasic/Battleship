function [] = UpdateBoard(ard,pins,board)
%Function created in order to update the LEDs on your breadboard to relect
%the values in the board matrix.
%   Name: Shereen Enan
%   Last Update: 4/19/2019
%Inputs:
%   ard: Input will be the already defined arduino() object.
%   pins: will be the pins on your breadboard you are coding to light up.
%   board: will be the matrix already created being used to match the
%   breadboard to make the pins light up
%Output:
%   No outputs will be given for this user defined function
[r,c]=size(board);
for x=1:1:r
    for y=1:1:c
        if board(x,y)==0
            writeDigitalPin(ard,pins(x,y),0)
        elseif board(x,y)==1
            writeDigitalPin(ard,pins(x,y),1)
        end
    end
end


