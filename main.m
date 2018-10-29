%% ENGI 1331 Project 4 - [Name] - [Cougarnet ID] - [UH Email]
clc,clear,close;
disp('ENGI 1331 Project 4 - [Name] - [Cougarnet ID] - [UH Email]')
disp(' ')
disp(' ')


%% Section 2 - Programming the Arduino
disp('Section 2 - Programming the Arduino')
disp(' ')

% Task 2.1 - Set Up Arduino Connection
disp('Task 2.1 - Set Up Arduino Connection')
a = arduino();
board = zeros(3);
pins = ["D2","D3","D4";"D7","D8","D9";"D11","D12","D13"];
disp('PAUSED')
pause
disp(' ')

% Task 2.2 - Create UpdateBoard() Function
disp('Task 2.2 - Create UpdateBoard() Function')
disp('PAUSED')
pause
disp(' ')

% Task 2.3 - Blink All LEDs
disp('Task 2.3 - Blink All LEDs')
for i=1:1:3
    for n=1:1:9
        board(n)=1;
    end
    UpdateBoard(a,board,pins)
    pause(1)
    for m=1:1:9
        board(m)=0;
    end
    UpdateBoard(a,board,pins)
    pause(1)
end
board = zeros(3);
UpdateBoard(a,board,pins)
disp('PAUSED')
pause
disp(' ')

% Task 2.4 - Blink LEDs in Patterns
disp('Task 2.4 - Blink LEDs in Patterns')
board = [1,0,1;0,1,0;1,0,1];
UpdateBoard(a,board,pins)
pause(5)
board = [0,1,0;1,1,1;0,1,0];
UpdateBoard(a,board,pins)
pause(5)
board = zeros(3);
UpdateBoard(a,board,pins)
choice = input('Choose either "x" or "+": ','s');
if choice == "x"
    board = [1,0,1;0,1,0;1,0,1];
elseif choice == "+"
    board = [0,1,0;1,1,1;0,1,0];
else
    disp("You did not input a correct value")
end
UpdateBoard(a,board,pins)
pause(5)
board = zeros(3);
UpdateBoard(a,board,pins)
disp('PAUSED')
pause
disp(' ')

% Task 2.5 - Manipulate LEDs from a Data File
disp('Task 2.5 - Manipulate LEDs from a Data File')
lightsequence = load('light_sequence.csv');
for i=1:1:9
    [r,c] = find(lightsequence==i);
    board(r,c) = 1;
    UpdateBoard(a,board,pins)
    pause(2)
end
board = zeros(3);
UpdateBoard(a,board,pins)
disp('PAUSED')
pause
disp(' ')

% Task 2.6 - Fill Up Board in Random Order
disp('Task 2.6 - Fill up Board in Random Order')
inputRow = input('Select a row: ');
inputCol = input('Select a column: ');
board(inputRow,inputCol) = 1;
UpdateBoard(a,board,pins)
pause(2)
for i=1:1:8
    picked = 0;
    while picked ~= 1
        loc = randi(9);
        if board(loc) == 0
            board(loc) = 1;
            picked = 1;
        end
    end
    UpdateBoard(a,board,pins)
    pause(2)
end
board = zeros(3);
UpdateBoard(a,board,pins)
disp('PAUSED')
pause
disp(' ')

% Task 2.7 - Create RandLight() Function
disp('Task 2.7 - Create RandLight() Function')
for i=1:1:5
    RandLight(a,board,pins)
    pause(5)
end
board = zeros(3);
UpdateBoard(a,board,pins)
disp('PAUSED')
pause
disp(' ')

% Task 2.8 - Fill Up Board in Cascading Order
disp('Task 2.8 - Fill Up Board in Cascading Order')
inputRow = input('Select a row: ');
inputCol = input('Select a column: ');
board(inputRow,inputCol) = 1;
UpdateBoard(a,board,pins)
pause(5)
while find(~board) > 0
    tempboard = board;
    for r=1:1:3
        for c=1:1:3
            if r>1
                if board(r-1,c) == 1
                    tempboard(r,c)=1;
                    %%break
                end
            end
            if r<3
                if board(r+1,c) == 1
                    tempboard(r,c)=1;
                    %%break
                end
            end
            if c>1
                if board(r,c-1) == 1
                    tempboard(r,c)=1;
                    %%break
                end
            end
            if c<3
                if board(r,c+1) == 1
                    tempboard(r,c)=1;
                    %%break
                end
            end
        end
    end
    board = tempboard;
    UpdateBoard(a,board,pins)
    pause(5)
end
board = zeros(3);
UpdateBoard(a,board,pins)
disp('PAUSED')
pause
disp(' ')
disp('Complete')