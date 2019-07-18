
% ENGI 1331H Project 4 - Addison Gregory - 1657235 - agregory@uh.edu
clc
close all
clear all
disp('ENGI 1331H Project 4 - Addison Gregory - 165735 - agregory@uh.edu');
fprintf('\n')
pause

% Section 3 - Programming the Arduino
disp('Section 3 - Programming the Arduino');
fprintf('\n')
pause

% Task 3.1 - Students will create an arduino object and assign it to the
% arduino, then create a pins matrix.
disp('Task 3.1-Students will create an arduino object and assign it to the arduino, then create a pins matrix');
fprintf('\n');
a = arduino;
pins = ["D12","D11","D10";"D9","D8","D7";"D6","D5","D4"];
board = [0,1,0;1,0,1;1,0,0];
fprintf('\n')
pause

% Task 3.2 - Creating the User Defined function, UpdateBoard. Will be used
% later on to turn on and off lights.
disp('Task 3.2-Creating the User-Defined function, UpdateBoard. Will be used later on to turn on and off lights.')
fprintf('\n')
pause

% Task 3.3 - Student will manipulate LEDs to blink 3 times, on for 1
% second, off for 1 second.
disp('Task 3.3-Student will manipulate LEDs to blink 3 times, on for 1 second, off for 1 second.');
for i = 1:3
    board = [1,1,1;1,1,1;1,1,1];
    UpdateBoard(a,board)
   pause(1)
    board = [0,0,0;0,0,0;0,0,0];
    UpdateBoard(a,board)
    pause(1)
end
board = [0,0,0;0,0,0;0,0,0];
UpdateBoard(a,board);
fprintf('\n')
pause

% Task 3.4 - Read in light sequence and make LEDs light up in an order that
% follows the numbers in the matrix eery 2 seconds.
disp('Task 3.4 - Read in light sequence and make LEDs light up in an order that follows the numbers in the matrix every 2 seconds.');
board = [0,0,0;0,0,0;0,0,0];
p = load('Light_Sequence.csv');
[rows,cols]=size(board);
for i = 1:9
    [ra,ca]=find(p==i);
    board(ra,ca)=1;
    UpdateBoard(a,board)
    pause(2)
    board(ra,ca)=0;
    UpdateBoard(a,board)
end
fprintf('\n')
pause

% Task 3.5 - Ask for a row number and column number from user and light LED
% up, then make other 8 light up in random order.
disp('Task 3.5 -  Ask for a row number and column number from user and light LED up, then make other 8 light up in random order.');
board = [0,0,0;0,0,0;0,0,0];
UserR = input('Choose a row value (1-3): ');
UserC = input('Choose a column value (1-3): ');
board(UserR,UserC)=1;
UpdateBoard(a,board)
pause(2)
board2 = reshape(randperm(9), 3,3);
board2(UserR,UserC)=13;
for kaiza = 1:9
    [vecta,cruizer] = find(board2==kaiza);
    board(vecta,cruizer)=1;
    UpdateBoard(a,board);
    
    if board2(vecta,cruizer)==kaiza
        pause(2)
    end
end
fprintf('\n')
pause

% Task 3.6 - Create a user defined function, RandLight() that will light up
% a random number of LEDs in random locations. Display number of light lit
% each time.
clc
disp('Task 3.6 - Create a user defined function, RandLight() that will light up a random number of LEDs in random locations, display how many are lit.');
board = [0,0,0;0,0,0;0,0,0];
UpdateBoard(a,board);
for abc = 1:5
    RandLight(a);
    pause(5)
end
board(:,:)=0;
UpdateBoard(a,board);
fprintf('\n');
pause

% Task 3.7 - Ask for user to input a row number and column number, light
% LED up, make program wait 5 seconds and then light up all LEDs adjacent
% until all LEDs lit.
disp('Task 3.7 - Ask for user values, light selected LED up, make program wait 5 seconds and light up all adjacent LEDs until full board is lit.');
R8 = input('Select a row number(1-3):  ');
C8 = input('Select a column number(1-3):  ');
[R8,C8]=size(board);
board(R8,C8)=1;
UpdateBoard(a,board);
pause(5)
newbalance = board;
for z = 1:4
    for t = 1:3
        for g = 1:3
            if board(t,g)==1
                if t-1 ~= 0
                    newbalance(t-1,g)=1;
                end
                if t +1 ~=4
                    newbalance(t+1,g)=1;
                end
                if g -1 ~=0
                    newbalance(t,g-1)=1;
                end
                if g+1 ~=4
                    newbalance(t,g+1)=1;
                end
            end
        end
    end
    UpdateBoard(a,newbalance);
    board=newbalance;
    pause(5)
    if newbalance==ones(3)
        break
    end
end
board = [0,0,0;0,0,0;0,0,0];
UpdateBoard(a,board);
fprintf('\n')
pause
disp('Now, Section 4 - Creating a Graphic User Interface');
fprintf('\n')
