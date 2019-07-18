%% ENGI 1331H Project 4 – Joseph Palacios – jcpalac2 – jcpalacios2@cougarnet.uh.edu
clc; close all; clear all;
disp('ENGI 1331H Project 4 – Joseph Palacios – jcpalac2 – jcpalacios2@cougarnet.uh.edu');
disp('')
%% Section 3 – Programming the Arduino					
disp('Section 3 – Programming the Arduino');

%Task 3.1: Setting Variables  
disp('Task 3.1: Setting Variables')

a = arduino();
pins = ["D12","D11","D10";"D9","D8","D7";"D6","D5","D4"];
board = zeros([3,3]);
%Setting "a" as arduino object, "pins" and "board" as LED and LED status.
pause 

%Task 3.2: UpdateBoard
disp('Task 3.2: UpdateBoard')
UpdateBoard(a,pins,board);
pause 
%Task 3.3: Blinkey
disp('Task 3.3: Blinkey')

for c = 1:1:3
    board = ones([3,3]);
    UpdateBoard(a,pins,board)
    pause(1)
    board = zeros([3,3]); 
    UpdateBoard(a,pins,board)
end

board = zeros([3,3]);
UpdateBoard(a,pins,board);
pause
%Task 3.4: Assigned Lights
disp('Task 3.4: Assigned Lights')


Lights = csvread('Light_Sequence.csv');

for c = 1:1:9
    Min = min(Lights,[],'all');
    Loc = find(Lights==Min);
    board(Loc) = 1;
    UpdateBoard(a,pins,board)
    Lights(Loc) = 10;
    pause(2)
end

board = zeros([3,3]);
UpdateBoard(a,pins,board);
pause 

% Task 3.5: First User Light
disp('Task 3.5: First User Light')
Index = input('Please select a light position. [Row,Column]:  ');
while Index(1) < 1 || Index(1) > 3 || Index(2) < 1 || Index(2) >3
        warning('Please place number between Rows 1-3 or Columns 1-3')
        Index = input('Please enter a position for an LED. Ex:[row,col]');
end
board(Index(1),Index(2)) = 1;
UpdateBoard(a,pins,board)
pause(2)
while sum(sum(board)) < 9
    I = randi([1 9]);
    while board(I) == 1
        I = randi([1 9]);
    end
    board(I) = 1;
    UpdateBoard(a,pins,board)
    pause(2)
end
%Turn off lights 
board = zeros([3,3]);
UpdateBoard(a,pins,board);
pause 

% Task 3.6: RandLight
disp('Task 3.6: RandLight')
%Using function to randomly assign a random number of lights to board
for c = 1:1:5 
    RandLight(a,pins) 
    pause(5)
    board = zeros([3,3]);
    UpdateBoard(a,pins,board)
end
%Turn off Lights
board = zeros([3,3]);
UpdateBoard(a,pins,board);
pause 

%Task 3.7: Adjecent Light
disp('Task 3.7: Adjecent Lights')

    %While loop repeats until the whole board is lit
while sum(board,'all') < 9  
        %User Input 
    Index = input('Please enter a position for an LED. Ex:[row,col]');
        %Checks that user's input matches a 3X3 Matrix
    while Index(1) < 1 || Index(1) > 3 || Index(2) < 1 || Index(2) >3 
        warning('Please place number between Rows 1-3 or Columns 1-3')
        Index = input('Please enter a position for an LED. Ex:[row,col]');
    end
        %Sets User Selected Light
    board(Index(1),Index(2)) = 1; 
    UpdateBoard(a,pins,board)
    pause(5)
        %This creates an vector of all the possible adjacent lights: Left,Right,Up,Down
    L = Index(2)-1;
    R = Index(2)+1;
    U =Index(1)-1;
    D =Index(1)+1;
    Test = [L,R,U,D]; 
        %This for loop travels through the vector Test 
    for x = 1:1:4 
        %This if statement checks if all parts of the vector are within a 3X3 matrix, and ignores any outside of it 
        if Test(x) >= 1 && Test(x) <= 3 
            %Changes made for going Left or Right
            if x <= 2  
                r = Index(1);
                c = Test(x);
                board(r,c) = 1;
            %Changes made for going up or down
            else 
                c = Index(2);
                r = Test(x);
                board(r,c) = 1;
            end
        end
    end
            %Turns on adjacent lights in 3X3 Matrix
            UpdateBoard(a,pins,board)  
            pause(5)
end
%Turn off Lights
board = zeros([3,3]); 
UpdateBoard(a,pins,board);
pause 
