%% ENGI 1331H - Project 4 - Section 3: Programming the Arduino
% Shereen Enan
% 1771428
% shereenenan@gmail.com

clc
clear 
close all

disp('ENGI 1331H - Project 4 - Section 3: Programming the Arduino')
disp('Shereen Enan')
disp('1771428')
disp('shereenenan@gmail.com')
disp('   ')

% Task 3.1- In your main.m file, create an Arduino object 
% and assign it to your Arduino. Create a 3x3 matrix called 
% pins containing the pin labels for each LED. The position 
% of these labels in the array should correspond to where the 
% LEDs are on your breadboard. 
disp('Task 3.1- In your main.m file, create an Arduino object ')
disp('and assign it to your Arduino. Create a 3x3 matrix called ')
disp('pins containing the pin labels for each LED. The position ')
disp('of these labels in the array should correspond to where the ')
disp('LEDs are on your breadboard.')
disp('  ')

ard=arduino();

pins=["D12","D11","D10";"D9","D8","D7";"D6","D05","D04"];

board=[0,0,0;0,0,0;0,0,0];

disp('pause')
disp('  ')
pause

% Task 3.2- Create a user defined function UpdateBoard() that “updates” 
% the LEDs on your breadboard in order to reflect the values in the board 
% matrix. This function should only require a single for loop and should 
% have no output. Make sure that this function is working properly, as you 
% will use it in almost every other task. For this task, you need to make 
% sure that an LED will turn off if its corresponding element in board is 
% set to 0, and on if that element is set to 1.
disp('Task 3.2- Create a user defined function UpdateBoard() that “updates”')
disp('the LEDs on your breadboard in order to reflect the values in the board') 
disp('matrix. This function should only require a single for loop and should ')
disp('have no output. Make sure that this function is working properly, as you') 
disp('will use it in almost every other task. For this task, you need to make') 
disp('sure that an LED will turn off if its corresponding element in board is') 
disp('set to 0, and on if that element is set to 1.')
disp('  ')

UpdateBoard(ard,pins,board);

disp('pause')
disp('  ')
pause

% Task 3.3- Now that you have all required code, you should be able to manipulate 
% the LEDs of your Arduino easily. Use a loop to make all of the LEDs blink 
% simultaneously three times (turn on for 1 second, then turn off for 1 second). 
disp('Task 3.3- Now that you have all required code, you should be able to manipulate') 
disp('the LEDs of your Arduino easily. Use a loop to make all of the LEDs blink ')
disp('simultaneously three times (turn on for 1 second, then turn off for 1 second).')
disp('  ')

counter=0;
for k=1:1:3
    board(:,:)=1;
    UpdateBoard(ard,pins,board)
    counter=counter+1;
    pause(1)
    board(:,:)=0;
    UpdateBoard(ard,pins,board)
    pause(1)
end
    
disp('pause')
disp('  ')
pause

% Task 3.4- Read in light_sequence.csv 
% to your main.m file. This file contains 
% a 3x3 matrix of the integers 1-9 positioned 
% randomly. Make your LEDs light up in an order 
% that follows the numbers in the matrix. 
disp('Task 3.4- Read in light_sequence.csv ')
disp('to your main.m file. This file contains ')
disp('a 3x3 matrix of the integers 1-9 positioned') 
disp('randomly. Make your LEDs light up in an order ')
disp('that follows the numbers in the matrix.')
disp('  ')

light_sequence=csvread('Light_Sequence.csv');

for o=1:9
    for r=1:3
        for c=1:3
            if light_sequence(r,c)==o
                board(r,c)=1;
                UpdateBoard(ard,pins(:,:),board)
                pause(2)
            end
        end
    end
end

board(:,:)=0;
UpdateBoard(ard,pins,board);

disp('pause')
disp('  ')
pause

% Task 3.5- Ask for the user to input a row number and column number 
% corresponding to a position on the grid. Light the selected LED up. 
% Then make the 8 remaining LEDs light up in a random order, with a new 
% LED lighting up every 2 second until all the LEDs are lit. This random 
% order should be different each time the program is run.Ask for the user 
% to input a row number and column number corresponding to a position on 
% the grid. Light the selected LED up. Then make the 8 remaining LEDs light 
% up in a random order, with a new LED lighting up every 2 second until all 
% the LEDs are lit. This random order should be different each time the program 
%is run.
disp('Task 3.5- Ask for the user to input a row number and column number') 
disp('corresponding to a position on the grid. Light the selected LED up. ')
disp('Then make the 8 remaining LEDs light up in a random order, with a new ')
disp('LED lighting up every 2 second until all the LEDs are lit. This random ')
disp('order should be different each time the program is run.Ask for the user ')
disp('to input a row number and column number corresponding to a position on ')
disp('the grid. Light the selected LED up. Then make the 8 remaining LEDs light') 
disp('up in a random order, with a new LED lighting up every 2 second until all ')
disp('the LEDs are lit. This random order should be different each time the program ')
disp('is run.')
disp('  ')

user_row=input('Please enter a specified row number between 1 and 3= ');
disp('  ')
user_column=input('Please enter a specified column number betweek 1 and 3= ');

board(user_row,user_column)=1;
UpdateBoard(ard,pins,board);
pause(2)

rand_vector=randperm(9);
rand_matrix=[rand_vector(1:3);rand_vector(4:6);rand_vector(7:9)];

for u=1:9
    for r=1:3
        for c=1:3
            if rand_matrix(r,c)==u
                if board(r,c)==0
                   board(r,c)=1;
                   UpdateBoard(ard,pins(:,:),board)
                   pause(2)
                end
            end
        end
    end
end

board(:,:)=0;
UpdateBoard(ard,pins,board);

disp('  ')
disp('pause')
disp('  ')
pause

% Task 3.6- Create a user defined function RandLight() 
% that will light up a random number of LEDs (1-9) in 
% random locations on your breadboard. Your function should 
% display the randomly selected number of LEDs each time it 
% runs to the command window. Call the function 5 times, 
% a 5 second delay between each iteration.
disp('Task 3.6- Create a user defined function RandLight() ')
disp('that will light up a random number of LEDs (1-9) in ')
disp('random locations on your breadboard. Your function should ')
disp('display the randomly selected number of LEDs each time it ')
disp('runs to the command window. Call the function 5 times, ')
disp('a 5 second delay between each iteration.')
disp('  ')

RandLight(ard,pins,board);
pause(5);
disp('  ')
RandLight(ard,pins,board);
pause(5);
disp('  ')
RandLight(ard,pins,board);
pause(5);
disp('  ')
RandLight(ard,pins,board);
pause(5);
disp('  ')
RandLight(ard,pins,board);
pause(5);
disp('  ')

board(:,:)=0;
UpdateBoard(ard,pins,board);

disp('  ')
disp('pause')
disp('  ')
pause

% Task 3.7- Ask for the user to input a row number and column number 
% corresponding to a position on the grid. Light the selected LED up. 
% Make the program wait 5 seconds and then simultaneously light up all 
% LEDs directly adjacent (diagonals don’t count) to a currently lit LED. 
% Repeat this process until all the LEDs are lit, with a 5 second delay 
% between each iteration.
disp('Task 3.7- Ask for the user to input a row number and column number ')
disp('corresponding to a position on the grid. Light the selected LED up. ')
disp('Make the program wait 5 seconds and then simultaneously light up all ')
disp('LEDs directly adjacent (diagonals don’t count) to a currently lit LED. ')
disp('Repeat this process until all the LEDs are lit, with a 5 second delay ')
disp('between each iteration.')
disp('  ')

user_row_light=input('Please enter a specified row number between 1 and 3 to light up= ');
disp('  ')
user_column_light=input('Please enter a specified column number betweek 1 and 3 to light up= ');

board(user_row_light,user_column_light)=1;
UpdateBoard(ard,pins,board);
pause(5)

modified_board=board;

for h=1:1:4
    for r=1:3
        for c=1:3
            if board(r,c)==1;
                if (r+1) ~=4;
                    modified_board(r+1,c)=1;
                end
                if (c+1) ~=4;
                    modified_board(r,c+1)=1;
                end
                if (r-1) ~=0;
                    modified_board(r-1,c)=1;
                end
                if (c-1) ~=0;
                    modified_board(r,c-1)=1;
                end
            end
        end
    end
    UpdateBoard(ard,pins,modified_board);
    board=modified_board;
    pause(5)
    if modified_board==ones(3);
        break
    end
end

board(:,:)=0;
UpdateBoard(ard,pins,board);

disp('  ')
disp('Done with section 3!!!:-)')
disp('  ')
