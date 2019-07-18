%% ENGI 1331H Project 4 – Keenan Descartin – krdescar – krdescartin@uh.edu
clc; close; clear;
disp('ENGI 1331H Project 4 – Keenan Descartin – krdescar – krdescartin@uh.edu');
disp(' ')
%% Section 3 – Programming the Arduino					
disp('Section 3 – Programming the Arduino');
disp(' ')
% Task 3.1 – Set Up Arduino Connection
disp('Task 3.1 – Set Up Arduino Connection')
a = arduino();
pins = ["D12", "D11", "D10"; "D9", "D8", "D7"; "D6", "D5", "D4"]

board = [0, 0, 1; 1, 0, 1; 1, 0, 0]

pause

% Task 3.2 - Create User-Defined Function UpdateBoard()
disp('Task 3.2 - Create User-Defined Function UpdateBoard()')
disp(' ')
pause
% Task 3.3 - LED Manipulation
disp('Task 3.3 - LED Manipulation')
disp(' ')
counter = 0;
for i = 1:1:3
      board(:,:) = 1;
      UpdateBoard(a,pins,board);
      pause(1)
      board(:,:) = 0;
      UpdateBoard(a,pins,board);
      pause(1)
      counter = counter + 1;
end
pause
% Task 3.4 - Light Sequence
disp('Task 3.4 - Light Sequence')
disp(' ')
Light_Sequence = xlsread('Light_Sequence.csv');
board(:,:) = 0;
for i = 1:9
    for r = 1:3
        for c = 1:3
            if Light_Sequence(r,c) == i
                board(r,c) = 1;
                UpdateBoard(a,pins(:,:),board)
                pause(2)
            end
        end
    end
end
pause
% Task 3.5 - User Input/Make the LEDs light up in a random order
disp('Task 3.5 - User Input/Make the LEDs light up in a random order')
disp(' ')
board(:,:) = 0;
UpdateBoard(a,pins,board)
input_r = input('Enter a row number between 1 and 3.   ')
input_c = input('Enter a column number between 1 and 3.   ')
board(input_r,input_c) = 1;
UpdateBoard(a,pins,board)
pause(2)
LS = randperm(9);
LS2 = [LS(1:3);LS(4:6);LS(7:9)];
for i = 1:9
    for r = 1:3
        for c = 1:3
            if LS2(r,c) == i
                if board(r,c) == 0
                    board(r,c) = 1;
                    UpdateBoard(a,pins(:,:),board)
                    pause(2)
                end
            end
        end
    end
end
pause
% Task 3.6 - Create User-Defined Function RandLight()
disp('Task 3.6 - Create User-Defined Function RandLight()')
disp(' ')
board(:,:) = 0;
UpdateBoard(a,pins,board)
RandLight(a,pins,board)
pause(5)
RandLight(a,pins,board)
pause(5)
RandLight(a,pins,board)
pause(5)
RandLight(a,pins,board)
pause(5)
RandLight(a,pins,board)
pause(5)
% Task 3.7 - User Input/Light up directly adjacent LEDs
disp('Task 3.7 - User Input/Light up directly adjacent LEDs')
disp(' ')
board(:,:) = 0;
UpdateBoard(a,pins,board)
input_r = input('Enter a row number between 1 and 3.   ')
input_c = input('Enter a column number between 1 and 3.   ')
board(input_r,input_c) = 1;
UpdateBoard(a,pins,board)
pause(5)
newboard = board;
for i=1:1:4
    for r = 1:3
        for c = 1:3
            if board(r,c) == 1
                if (r-1) ~= 0
                    newboard(r-1,c) = 1;
                end
                if (c-1) ~= 0
                    newboard(r,c-1) = 1;
                end
                if (r+1) ~= 4
                    newboard(r+1,c) = 1;
                end
                if (c+1) ~= 4
                    newboard(r,c+1) = 1;
                end
            end
        end
    end
    UpdateBoard(a,pins,newboard);
    board = newboard;
    pause(5)
    if newboard == ones(3)
        break
    end
end
board(:,:) = 0
UpdateBoard(a,pins,board)
