%ENGI 1331H Project 4
%Aamir Dassat
%1792115
%Amdassat@uh.edu

clc
clear 
close all

fprintf('ENGI 1331H Project 4\nAamir Dassat\n1792115\nAmdassat@uh.edu\n\n')
disp(' ')

%Section 3 - Programming the Arduino
disp('Section 3 - Programming the Arduino');

%Task 3.1 - LED position and Status
a = arduino();   %Initialize arduino object
disp('Task 3.1 - LED position and Status');   
pins = ["D12","D11","D10";"D9","D8","D7";"D6","D5","D4"]; %creates a matrix of strings to represent the position on the arduno board
board = [0,0,0;0,0,0;0,0,0];  %matrix for on and off values correponding to the pins

%Task 3.2 - Turning LEDs on/off from matrix
disp('Task 3.2 - Turning LEDs on/off from matrix');
UpdateBoard(a,board,pins) %testing the UpdateBoard function
pause();
disp('paused');

%Task 3.3 - Blinking LEDs
disp('Task 3.3 - Blinking LEDs')
c = 0; 
allOn = [1,1,1;1,1,1;1,1,1];
allOff = [0,0,0;0,0,0;0,0,0,];
while c < 3
    UpdateBoard(a,allOn,pins);
    pause(1);
    UpdateBoard(a,allOff,pins);
    pause(1);
    c = c + 1;
end
pause();
disp('paused');

%Task 3.4 - Turning on in order
disp('Task 3.4 - Turning on in order')
randomValues = csvread('Light_Sequence.csv');
adder = 1; %The adder/counter moves through the randomized values
while adder < 10  %Code runs just enough times to light up 9 LEDs
for r = 1:3      %Sequences from the first to the third row
    for c = 1:3  %Sequences from the first to the third column
        if randomValues(r,c) == adder %Captures the row and column of the min value which is increased by one last time
            writeDigitalPin(a,pins(r,c),1); %Turns on the pin that corresponds r and c of the min value in referece to the pins matrix
            adder = adder + 1; %add one to the adder
            pause(2) %waits 2 secs between lighting LEDs
        end
    end
end
end
pause();
disp('paused');

%Task 3.5 - User/Random Lighting
disp('Task 3.5 - User/Random Lighting')
urow = input('Enter a row for the desired LED');
ucol = input('Enter a column for the desired LED');
randomrow = randperm(9); %%Same function as the Randlight() function
row1 = randomrow(1,1:3);
row2 = randomrow(1,4:6);
row3 = randomrow(1,7:9);
randomMatrix = [row1;row2;row3];
writeDigitalPin(a,pins(urow,ucol),1);
pause(2);
adder = 1; %The adder/counter moves through the randomized values
while adder < 10 %Code runs just enough times to light up 9 LEDs
for r = 1:3      %Sequences from the first to the third row
    for c = 1:3  %Sequences from the first to the third column
        if randomMatrix(r,c) == adder %Captures the row and column of the min value which is increased by one last time
            writeDigitalPin(a,pins(r,c),1); %Turns on the pin that corresponds r and c of the min value in referece to the pins matrix
            adder = adder + 1; %add one to the adder
            pause(2) %waits 2 secs between lighting LEDs
%         else
%             adder = adder + 1;
%             disp('This executed');
        end
    end
end
end
pause();
disp('paused');

%Task 3.6 - Lighting up random number and random location
disp('Task 3.6 - Lighting up random number and random location');
pause(2);
[NumberLit,randMatrix] = RandLight(a,pins);
UpdateBoard(a,allOff,pins);
[NumberLit,randMatrix] = RandLight(a,pins);
UpdateBoard(a,allOff,pins);
[NumberLit,randMatrix] = RandLight(a,pins);
UpdateBoard(a,allOff,pins);
[NumberLit,randMatrix] = RandLight(a,pins);
UpdateBoard(a,allOff,pins);
[NumberLit,randMatrix] = RandLight(a,pins);
UpdateBoard(a,allOff,pins);
pause();
disp('paused');

%Task 3.7 - Ripple Effect Lighting
disp('Task 3.7 - Ripple Effect Lighting')
urow2 = input('Enter a row for the desired LED');
ucol2 = input('Enter a column for the desired LED');
writeDigitalPin(a,pins(urow2,ucol2),1);
newboard = board;
for index = 1:4
    for r4 = 1:3
        for c4 = 1:3
            if newboard(r4,c4) ==1 
                       
            if r4==urow2-1 && c4==ucol2 %above light
                writeDigitalPin(a,pins(r4,c4),1);
                placeholder(r4,c4) = 1;
                matrixval = sum(sum(placeholder));
            if r4==urow2+1 && c4==ucol2 %below light
                writeDigitalPin(a,pins(r4,c4),1);
                placeholder(r4,c4) = 1;
                disp('This ran');
                matrixval = sum(sum(placeholder));
            if r4==urow2 && c4==ucol2+1 %right light
                writeDigitalPin(a,pins(r4,c4),1);
                placeholder(r4,c4) = 1;
                matrixval = sum(sum(placeholder));
             if r4==urow2 && c4==ucol2-1 %left light
                writeDigitalPin(a,pins(r4,c4),1);
                placeholder(r4,c4) = 1;  
                matrixval = sum(sum(placeholder));
             end
            end
            end
            end
            end
        end
    end
end

                
                
                




 
