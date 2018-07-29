function UpdateBoard(ard,board_matrix)
%UNTITLED Summary of this function goes here
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


writeDigitalPin(ard,'D2',board_matrix(1,1));
writeDigitalPin(ard,'D3',board_matrix(1,2));
writeDigitalPin(ard,'D4',board_matrix(1,3));
writeDigitalPin(ard,'D7',board_matrix(2,1));
writeDigitalPin(ard,'D8',board_matrix(2,2));
writeDigitalPin(ard,'D9',board_matrix(2,3));
writeDigitalPin(ard,'D11',board_matrix(3,1));
writeDigitalPin(ard,'D12',board_matrix(3,2));
writeDigitalPin(ard,'D13',board_matrix(3,3));

end

