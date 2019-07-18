function [outputArg1,outputArg2] = UpdateBoard(Arduino,Board,p)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[x,y]=size(Board);
for n=1:x
    for b=1:y
    if Board(n,b)== 1
        writeDigitalPin(Arduino,p(n,b),1);
    elseif Board(n,b)== 0
        writeDigitalPin(Arduino,p(n,b),0);
    end
    end
end

       
end

 