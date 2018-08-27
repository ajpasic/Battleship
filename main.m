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
% board(1) = 1;

% write values to pins
UpdateBoard(a, pins, board)

pause
board = zeros(3);
UpdateBoard(a, pins, board)
for i=1:1:3
    board = ones(3);
    UpdateBoard(a, pins, board)
    pause(1)
    board = zeros(3);
    UpdateBoard(a, pins, board)
    pause(1)
end

% create and run RandPin function
pause
for i=1:1:10
    board = RandPin();
    UpdateBoard(a, pins, board)
    pause(2)
end

board = zeros(3);
UpdateBoard(a, pins, board)

startLoc = input('Pick a starting location for the spiral (must be a corner)');







% make ship locations array
% NumShips = 1;
% shipLoc = ShipLocations(NumShips);
% 
% [row, col] = MakeSelection(a, board, pins);
% 
% % compare selection to ship location(s)
% for i = 1:1:8
%     if shipLoc(row, col) == 1 % if we hit the ship
%         disp('Hit')
%         break
%     else
%         disp(['Miss,', num2str(8-i), ' tries remaining'])
%         [row, col] = MakeSelection(a, board, pins);
%     end
%     disp(shipLoc)
%     disp([row, col])
% end    