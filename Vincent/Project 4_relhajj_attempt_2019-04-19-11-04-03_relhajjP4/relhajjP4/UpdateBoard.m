function[] = UpdateBoard(a,pins,board)
%UNTITLED2 Summary of this function goes here
%   This user-defined function 
for i = 1:3 
    for j = 1:3
        writeDigitalPin(a,pins(i,j), board(i,j));
    end 
end

