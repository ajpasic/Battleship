function UpdateBoard(ard, pins, board)

for c = 1:9
    writeDigitalPin(ard, pins(c), board(c));
%     writeDigitalPin(ard, Vincent_pins(c), board_matrix(c));
end
end

