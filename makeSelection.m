% first we establish connection and clear all existing variables
clc, clear
a = arduino();

% define important variables
Adi_pins = ["D12", "D11", "D10";
            "D8", "D7", "D6";
            "D4", "D3", "D2"]; % Adi's configuration
    
Vincent_pins = ["D2", "D3", "D4";
                "D7", "D8", "D9";
                "D11", "D12", "D13"]; % Vincent's configuration
            
pins = Adi_pins;
            
% create a board "mask"
board = zeros(3);
board(4) = 1;

% write values to pins
UpdateBoard(a,board, pins)

z = 0;
while z ~= 13 % while enter key has not been pressed
    z = GetKey;
    [row, col] = find(board == 1); % find position of current LED
    switch z
        case 28
            % we pressed the left key
            if col - 1 < 1 
                disp('that is not a valid movement')
                continue
            else 
                board(row, col - 1) = 1;
            end
        case 29
            % we pressed the right key
            if col + 1 > 3 
                disp('that is not a valid movement')
                continue
            else 
                board(row, col + 1) = 1;
            end
        case 30
            % we pressed the up key
            if row - 1 < 1 
                disp('that is not a valid movement')
                continue
            else 
                board(row - 1, col) = 1;
            end
        case 31
            % we pressed the down key
            if row + 1 > 3 
                disp('that is not a valid movement')
                continue
            else 
                board(row + 1, col) = 1;
            end
        case 13
            % we pressed the enter key - the loop will exit
        otherwise
            % a bad key was pressed, prompt user for another key press
            disp('INCORRECT')
    end
    if z ~= 13 % prevents board from being erased on LED selection
        board(row, col) = 0; % erase old position
    end
    UpdateBoard(a, board, pins) % update the board
end

    