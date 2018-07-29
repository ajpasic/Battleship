function Wipe(ard,board_matrix)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

writeDigitalPin(ard,'D2',0);  %wipes the board
writeDigitalPin(ard,'D3',0);
writeDigitalPin(ard,'D4',0);
writeDigitalPin(ard,'D7',0);
writeDigitalPin(ard,'D8',0);
writeDigitalPin(ard,'D9',0);
writeDigitalPin(ard,'D11',0);
writeDigitalPin(ard,'D12',0);
writeDigitalPin(ard,'D13',0);

end

