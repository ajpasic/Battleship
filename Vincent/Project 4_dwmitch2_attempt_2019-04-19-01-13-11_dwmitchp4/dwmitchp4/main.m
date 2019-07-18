%% ENGI 1331H Project 4 - David Mitchell - 1769172 - dwmitch2@uh.edu
clc;
clear;
close all;
disp('ENGI 1331H Project 4 - David Mitchell - 1769172 - dwmitch2@uh.edu');
disp('')

%% Section 3 - Programming the Arduino
disp('Section 3 - Programming the Arduino');
disp('')
% Task 3.1 - Set up Arduino Connection
disp('Task 3.1 - Set Up Arduino Connection');
a = arduino();
pins =["D12" "D11" "D10";"D9" "D8" "D7";"D6" "D5" "D4"];
board = [0,0,0;0,0,0;0,0,0];
disp('')

% Task 3.2 - Create UpdateBoard() Function
disp('Task 3.2 - Create UpdateBoard() Function');
UpdateBoard(a,board);

% Task 3.3 - Use a loop to make all of the LEDs blink three times
disp('Task 3.3 - Use a loop to make all of the LEDs blink three times')
for x = 1:3
    board = [1,1,1;1,1,1;1,1,1];
    UpdateBoard(a,board)
    pause(1)
    board = [0,0,0;0,0,0;0,0,0];
    UpdateBoard(a,board)
    pause(1)
end
disp('Press any key to continue');
pause
fprintf('\n')
% Task 3.4 - Make your LEDs light up in an order that follows the numbers
% in the light_sequence.csv matrix
disp('Task 3.4 - Make your LEDs light up in an order that follows the numbers')
disp('in the light_sequence.csv matrix')
board = [0,0,0;0,0,0;0,0,0];
p = load('Light_Sequence.csv');

[rows1,cols1] = size(p);
for i = 1:9
    [rows1,cols1] = find(p==i);
    board(rows1,cols1) = 1;
    UpdateBoard(a,board)
    pause(2)
    board(rows1,cols1) = 0;
    UpdateBoard(a,board)
end
disp('Press any key to continue');
fprintf('\n')
pause


% Task 3.5 - Make a user selected input LED to light up, 
% and then randomly light up the 8 remaining LEDs 
disp('Task 3.5 - Make a user selected input to light up,')
disp('and then randomly light up the 8 remaining LEDs')

RowInput = input('Input a row number:   ');
ColInput = input('Input a column number:   ');
board(RowInput,ColInput) = 1;
UpdateBoard(a,board);
pause(2)


R = reshape(randperm(9),3,3);
[rows2,cols2] = size(R);
for j = 1:9
    [rows2,cols2] = find(R==j);
    while board(rows2,cols2) == 0
    board(rows2,cols2) = 1;
    UpdateBoard(a,board)
    pause(2)
    end
    
end
board = [0,0,0;0,0,0;0,0,0];
UpdateBoard(a,board)   
disp('Press any key to continue');
fprintf('\n')
pause
 

% Task 3.6 - Create a user defined function RandLight() that will light 
% up a random number of LEDs in random locations on your breadboard.
disp('Task 3.6 - Create a user defined function RandLight() that will')
disp('light up a random number of LEDs in random locations on your breadboard.')
for g = 1:5
    [light]=RandLight(a);
    pause(5)
end
board = [0,0,0;0,0,0;0,0,0];
UpdateBoard(a,board) 
disp('Press any key to continue');
fprintf('\n')
pause
% Task 3.7 - Make a user selected input LED to light up,
% and then after 5 sec simultaneously light up all directly adjacent LEDs.
disp('Task 3.7 Make a user selected input LED to light up,')
disp('and then after 5 sec simultaneously light up all directly adjacent')
disp('LEDs.')

RowInput2 = input('Input a row number:   ');
ColInput2 = input('Input a column number:   ');
[rows,cols] = size(board);
board(RowInput2,ColInput2) = 1;
UpdateBoard(a,board);
pause(5)
newboard = board;
for i = 1:4
    for r = 1:3
        for c = 1:3
            if board(r,c) == 1
                if r-1 ~= 0
                    newboard(r-1,c)=1;
                end
                if r+1 ~= 4
                    newboard(r+1,c)=1;
                end
                if c-1 ~= 0
                    newboard(r,c-1)=1;
                end
                if c+1 ~= 4
                    newboard(r,c+1)=1;
                end
            end
        end
    end
    UpdateBoard(a,newboard);
    board=newboard;
    pause(5)
    if newboard==ones(3)
        break
    end
end
board = [0,0,0;0,0,0;0,0,0];
UpdateBoard(a,board) 
