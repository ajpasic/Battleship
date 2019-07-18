% ENGI 1331H Project 4 
% Rasem Elhajj 
% 1788521 relhajj@uh.edu
% Dr. Burleson T/TH 10:00 AM - 11:30 AM

% Section 3 - Programming The Arduino
disp('Section 3: Programming The Arduino')
disp('This section will program the arduino to control the lights using Matlab')
disp('Press any key to continue')
pause
fprintf('\n') 

% Section 3.1: Creating Matricies for pins and board 
disp('Section 3.1: Creating Matricies for pins and board')
a = arduino ();
pins = ["D12","D11","D10"; "D9", "D8", "D7"; "D6", "D5", "D4"];
board = [1, 0, 1; 0, 0, 1; 1, 1 0];
disp('Press any key to continue')
pause
fprintf('\n') 


% Section 3.2: User-defined function that updates the lights on board
disp('Section 3.2: User-defined function that updates the lights on board')
disp("Please see function 'UpdateBoard'")
disp('Press any key to continue')
pause
fprintf('\n') 

% Section 3.3: Using a for loop to light up LED's three times in a row 
disp("Section 3.3: Using a for loop to light up LED's three times in a row")
counter = 0;
for i= 1:1:3
    board(:,:) = 1; 
    UpdateBoard(a,pins,board)
    pause(1)
    board(:,:) = 0; 
    UpdateBoard(a,pins,board)
    pause(1)
    counter = counter+1; 
end 

disp('Please see board, then press any key to continue')
pause

fprintf('\n') 


% Section 3.4 Using a Matrix to light up LED's 
disp("Section 3.4: Using a Matrix to light up LED's")
LED = xlsread('Light_Sequence.csv');
for i = 1:1:9
    for r = 1:3
        for c = 1:3
            if LED(r,c) == i
                board(r,c) = 1;
                UpdateBoard(a,pins(:,:),board(:,:))
                pause(2)
            end 
        end 
    end 
end 
disp('Press any key to continue')
pause
fprintf('\n') 

% Section 3.5: Lighting LED's using User Input, then randomly lighting the
% rest of the LED's
disp("Section 3.5: Light LED's using User input, then randomly lighting the rest of the LED's")
board(:,:) = 0;
UpdateBoard(a,pins,board)
var1 = input('Please input a row number between 1 and 3    ');
fprintf('\n') 
var2= input('Please input a column number 1 and 3    ');
board(var1,var2) = 1;
UpdateBoard(a,pins,board);
pause(2)

p = randperm(9);
r1 = [p(1:3); p(4:6); p(7:9)];
for i = 1:9
    for r = 1:3
        for c = 1:3
            if r1(r,c) == i
                if board(r,c) == 0
                    board(r,c) = 1;
                    UpdateBoard(a,pins(:,:), board)
                    pause(2)
                end
            end
        end
    end
end

disp('Press any key to continue!')
pause

fprintf('\n') 


% Section 3.6 
disp("Section 3.6: User defined function to randomly light up LED's")
board(:,:) = 0;
UpdateBoard(a,pins,board)
RandLight(a, pins, board)
pause(5)
RandLight(a, pins, board)
pause(5)
RandLight(a, pins, board)
pause(5)
RandLight(a, pins, board)
pause(5)
RandLight(a, pins, board)
pause(5)

disp('Press any key to continue')
pause
fprintf('\n') 

%Section 3.7 Section 3.7: User input, lighting up all the lights
disp("Section 3.7: User input to light up all the lights")
board(:,:) = 0;
UpdateBoard(a,pins,board)
var3 = input('Please input a row number between 1 and 3 ');
fprintf('\n') 
var4= input('Please input a column number 1 and 3  ');
board(var3,var4) = 1;
newboard = board; 
for i = 1:1:4
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
    UpdateBoard(a,pins,newboard)
    board = newboard;
    pause(5)
    if newboard == ones(3)
        break
    end
end
pause
disp('End of Section 3!')