function [row, col] = MakeSelection(a, board, pins)
z = 0;
while z ~= 13 % while enter key has not been pressed
    z = GetKey;
    [row, col] = find(board == 1); % find position of current LED
    switch z
        case 28
            % we pressed the left key
            disp('left')
            if col - 1 < 1 
                disp('that is not a valid movement')
                continue
            else 
                board(row, col - 1) = 1;
            end
        case 29
            % we pressed the right key
            disp('right')
            if col + 1 > 3 
                disp('that is not a valid movement')
                continue
            else 
                board(row, col + 1) = 1;
            end
        case 30
            % we pressed the up key
            disp('up')
            if row - 1 < 1 
                disp('that is not a valid movement')
                continue
            else 
                board(row - 1, col) = 1;
            end
        case 31
            % we pressed the down key
            disp('down')
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
end

function z = GetKey()
k = waitforbuttonpress;
z = double(get(gcf,'CurrentCharacter'));
end