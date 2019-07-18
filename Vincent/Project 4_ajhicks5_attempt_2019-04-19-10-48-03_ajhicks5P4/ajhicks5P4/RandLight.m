function [outputArg1,outputArg2] = RandLight(Arduino,p,Board)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[IP,TP]=size(Board);
for KHG=1:IP
    for KHF=1:TP
        writeDigitalPin(Arduino,p(KHG,KHF),0);
    end
end

        
        
        


OP=randi([1 9],1,1);
disp('Random Number of Lights')
disp(OP)
Ju=[1 2 3 4 5 6 7 8 9];
Ju=Ju(randperm(length(Ju)));
for Ki=1:OP
    KL=Ju(Ki);
   writeDigitalPin(Arduino,p(KL),1);
end






end

