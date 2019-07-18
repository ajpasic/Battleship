%ENGI 1331H Project 4 - Marcos E. Ibarra Montoya - 1587720 - meibarramontoya@uh.edu
clc
clear all
close all
disp('ENGI 1331H Project 4 - Marcos E. Ibarra Montoya - 1587720 - meibarramontoya@uh.edu')
disp(' ')
%Section 3- Programming the Arduino
disp('Section 3- Programming the Arduino')
disp(' ')
ard = arduino()
%Task 3.1: Create a 3x3 matrix
disp('Task 3.1: Create 3x3 matrix called pins')
disp(' ')
pins = ["D12" "D11" "D10";"D9" "D8" "D7"; "D6" "D5" "D4"];
board = [0 0 0; 0 0 0; 0 0 0];
disp('Task 3.2: Create UpdateBoard')
disp('Paused. Hit any key to continue')
pause
disp(' ')
%Task 3.3: Use a loop to make all the lights blink simultaneously 3 times
disp('Task 3.3: Use a loop to make all the lights blink simultaneously 3 times')
for n = 1:length(pins)
    board = [1 1 1; 1 1 1; 1 1 1];
    UpdateBoard(ard,pins,board);
    pause(1)
    board = [0 0 0;0 0 0;0 0 0];
    UpdateBoard(ard,pins,board);
    pause(1)
end
pause
disp('Paused. Hit any key to continue')
%Task 3.4: Make LED lights light up in the order of the csv file
disp(' ')
disp('Task 3.4: Make LED lights light up in the order of the csv file')
disp(' ')
lightseq = csvread('Light_Sequence.csv');

for n=1:9
    [rows,cols] = find(lightseq==min(min(lightseq)));
    board(rows,cols) = 1;
    UpdateBoard(ard,pins,board);
    lightseq(rows,cols) = 1000;
    pause(1)
end
board = [0 0 0;0 0 0;0 0 0];
UpdateBoard(ard,pins,board);
disp('Paused. Hit any key to continue')
pause
% Task 3.5
disp('Task 3.5: User input turn on LED, then light up the rest randomly') 
disp(' ')
inputrow = input('Input a value between 1-3 for rows')
inputcolm = input('Input a value between 1-3 for the column')

R = randi(80000,[3 3]);
board(inputrow,inputcolm) = 1;
    UpdateBoard(ard,pins,board);
    pause(2);
    R(inputrow,inputcolm) = 90000;   
for n=1:8
    [rows1,cols1] = find(R==min(min(R)));
        board(rows1,cols1) = 1;
        UpdateBoard(ard,pins,board);
        R(rows1,cols1) = 90000;
        pause(2)
end
board = [0 0 0;0 0 0;0 0 0];
UpdateBoard(ard,pins,board)
disp('Paused. Hit any key to continue')
pause
%Task 3.6: Create a user defined function that will light up a random number of LEDs (1-9) in random locations
disp('Task 3.6: Create a user defined function that will light up a random number of LEDs (1-9) in random locations')
disp(' ') 

for n=1:5
    RandLight(ard,pins,board);
    pause(5)
end
board = [0 0 0;0 0 0;0 0 0];
UpdateBoard(ard,pins,board);
disp(' ')
disp(' ')
disp('Paused. Hit any key to continue')
pause
%Task 3.7: User input a value. Light up adjacent 
disp('Task 3.7: User input a value. Light up adjacent')
rowsr = input('Input a value between 1-3')
colsc = input('Input a value between 1-3')

if 4>rowsr>0 && 4>colsc>0
    board(rowsr,colsc) = 1;
    UpdateBoard(ard,pins,board)
    pause(5)
    if rowsr == 1 && colsc == 1
        board(rowsr+1,colsc) = 1;
        board(rowsr,colsc+1) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr,colsc+2) = 1;
        board(rowsr+1,colsc+1) = 1;
        board(rowsr+2,colsc) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr+2,colsc+1) = 1;
        board(rowsr+1,colsc+2) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr+2,colsc+2) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
    end
    if rowsr ==1 && colsc ==2
        board(rowsr,colsc-1) = 1;
        board(rowsr,colsc+1) = 1;
        board(rowsr+1,colsc) = 1;
        UpdateBoard(ard,pins,board) 
        pause(5)
        board(rowsr+1,colsc-1) = 1;
        board(rowsr+1,colsc+1) = 1;
        board(rowsr+2,colsc) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr+2,colsc-1)=1;
        board(rowsr+2,colsc+1)=1;
        UpdateBoard(ard,pins,board)
        pause(5)
    end
    if rowsr ==1 && colsc ==3
        board(rowsr,colsc-1) = 1;
        board(rowsr+1,colsc) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr,colsc-2) = 1;
        board(rowsr+2,colsc) = 1;
        board(rowsr+1,colsc-1) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr+1,colsc-2) = 1;
        board(rowsr+2,colsc-1) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr+2,colsc-2) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
    end
    if rowsr==2 && colsc==1
        board(rowsr-1,colsc) = 1;
        board(rowsr+1,colsc) = 1;
        board(rowsr,colsc+1) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr-1,colsc+1) = 1;
        board(rowsr+1,colsc+1) = 1;
        board(rowsr,colsc+2) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr-1,colsc+2) = 1;
        board(rowsr+1,colsc+2) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
    end
    if rowsr==2 && colsc==2
        board(rowsr-1,colsc) = 1;
        board(rowsr,colsc+1) = 1;
        board(rowsr,colsc-1) = 1;
        board(rowsr+1,colsc) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr-1,colsc-1) = 1;
        board(rowsr+1,colsc+1) = 1;
        board(rowsr-1,colsc+1) = 1;
        board(rowsr+1,colsc-1) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
    end
    if rowsr==2 && colsc==3
        board(rowsr-1,colsc) = 1
        board(rowsr+1,colsc) = 1
        board(rowsr,colsc-1) = 1
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr-1,colsc-1) = 1
        board(rowsr+1,colsc-1) = 1
        board(rowsr,colsc-2) = 1
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr-1,colsc-2) = 1
        board(rowsr+1,colsc-2) = 1
        UpdateBoard(ard,pins,board)
        pause(5)
    end  
    if rowsr==3 && colsc==1
        board(rowsr-1,colsc) = 1;
        board(rowsr,colsc+1) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr-2,colsc) = 1;
        board(rowsr,colsc+2) = 1;
        board(rowsr-1,colsc+1) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr-2,colsc+1) = 1;
        board(rowsr-1,colsc+2) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr-2,colsc+2) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
    end
    if rowsr==3 && colsc==2
        board(rowsr,colsc-1) = 1;
        board(rowsr,colsc+1) = 1;
        board(rowsr-1,colsc) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr-1,colsc-1) = 1;
        board(rowsr-1,colsc+1) = 1;
        board(rowsr-2,colsc) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
        board(rowsr-2,colsc-1) = 1;
        board(rowsr-2,colsc+1) = 1;
        UpdateBoard(ard,pins,board)
        pause(5)
    end
    if rowsr==3 && colsc==3
       board(rowsr,colsc-1) = 1;
       board(rowsr-1,colsc) = 1;
       UpdateBoard(ard,pins,board)
       pause(5)
       board(rowsr-1,colsc-1) = 1;
       board(rowsr-2,colsc) = 1;
       board(rowsr,colsc-2) = 1;
       UpdateBoard(ard,pins,board)
       pause(5)
       board(rowsr-2,colsc-1) = 1;
       board(rowsr-1,colsc-2) = 1;
       UpdateBoard(ard,pins,board)
       pause(5)
       board(rowsr-2,colsc-2) = 1;
       UpdateBoard(ard,pins,board)
       pause(5)
    end
end

board = [0 0 0;0 0 0;0 0 0];
UpdateBoard(ard,pins,board)

    




    
    
    
    



