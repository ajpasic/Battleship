%% ENGI 1331H Project 4 - Kyle Funston - kafunsto - kafunston@uh.edu
clc
clear all
close all
disp('ENGI 1331H Project 4 - Kyle Funston - kafunsto - kafunston@uh.edu');


%% Section 3 - Programming the Arduino

% Task 3.1 - Creating Matrices
disp('Task 3.1 - Create Matrices');
a = arduino;
pins = ["D12","D11","D10"; "D9","D8","D7"; "D6","D5","D4"];
board = zeros([3,3]);

pause

% Task 3.2 - Creating a User-Defined Function 
disp('Task 3.2 - Creating a User-Defined Function');
pause

% Task 3.3 - Blink (182) Loop
disp('Task 3.3 - Blink (182) Loop');

for q = 1:1:3
    board = ones([3,3]);
    UpdateBoard(a,pins,board);
    pause(1);
    board = zeros([3,3]);
    UpdateBoard(a,pins,board);
    pause(1);
end

pause

% Task 3.4 - Prescribed LED Sequencing
disp('Task 3.4 - Prescribed LED Sequencing');
Seq = csvread('Light_Sequence.csv');

for v = 1:1:9
    b = find(Seq == min(min(Seq)));
    Seq(b) = 100;
    board(b) = 1;
    UpdateBoard(a,pins,board);
    pause(2);
end
board = zeros([3,3]);
UpdateBoard(a,pins,board);

pause

% Task 3.5 - User Input and Random Order
disp('Task 3.5 -User Input and Random Order');
r = input('Please input a row # between 1 and 3');
c = input('Please input a column # between 1 and 3');
board(r,c) = 1;
UpdateBoard(a,pins,board);
pause(2);

while sum(sum(board)) ~= 9
    row = randi(3);
    col = randi(3);
    if board(row,col) == 0
        board(row,col) = 1;
    UpdateBoard(a,pins,board);
    pause(2);
    end
    
    
end
board = zeros([3,3]);
UpdateBoard(a,pins,board);

pause

% Task 3.6 - Random User-Defined Function
disp('Task 3.6 - Random User-Defined Function');
for g = 1:1:5
RandLight(a,pins,board);
end

pause

% Task 3.7 - Lighting Adjacent LEDs
disp('Task 3.7 -Lighting Adjacent LEDs');
while sum(sum(board)) < 9
r = input('Please input a row # between 1 and 3');
c = input('Please input a column # between 1 and 3');
board(r,c) = 1;
UpdateBoard(a,pins,board);
pause(5);
if r+1 <4 
 board(r+1,c) = 1;
end
if r-1 > 0
board(r-1,c) = 1;
end
if c+1 < 4
board(r,c+1) = 1;
end
if c-1 > 0
board(r,c-1) = 1;
end
UpdateBoard(a,pins,board);
end


pause(5);
board = zeros([3,3]);
UpdateBoard(a,pins,board);