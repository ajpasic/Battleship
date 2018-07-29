function UpdateBoard(ard,board_matrix, pins)

for c = 1:9
    writeDigitalPin(ard, pins(c), board_matrix(c));
%     writeDigitalPin(ard, Vincent_pins(c), board_matrix(c));
end

