%ENGI 1331H Project 4 - Daniel Dorali , ddorali, ddorali@uh.edu
clc
clear all
close all
disp('ENGI 1331H Project 4 - Daniel Dorali , ddorali, ddorali@uh.edu')
disp(' ')
%% Section 3 - Programming the Arduino
disp('Section 3 - Programming the Arduino')
disp(' ')
clc;clear all;close all
%Task 3.1 - Create a 3x3 matrix for the arduino.
disp('Task 3.1 - Create a 3x3 matrix for the arduino.')
pins = ["D12","D11","D10";"D9","D8","D7";"D6","D5","D4"];
board = zeros(3);
disp(' ')
pause


%Task 3.2 - Create a user defined function named UpdateBoard
disp('Task 3.2 - Create a user defined function named UpdateBoard')
disp(' ')
pause

%Task 3.3 -  Make all of the LEDs blink three times.
ard = arduino;
disp('Task 3.3 - Make all of the LEDs blink three times.')
disp(' ')
[rows,cols] = size(pins);

for c = 1:3
    for n = 1:(rows*cols)
        writeDigitalPin(ard,pins(n),1);
    end
    pause(1)
    for n = 1:(rows*cols)
        writeDigitalPin(ard,pins(n),0);
    end
    pause(1)
end
pause

%Task 3.4 - Read in light_sequence and make the LEDs light up in that order.
disp('Task 3.4 - Read in light_sequence and make the LEDs light up in that order.')
lightsequence = csvread('Light_Sequence.csv');
[lrow,lcol] = size(lightsequence);

for n = 1:(lrow*lcol)
    % find the overall min's col location
    [~,mincol] = min(min(lightsequence));
    %in that row, find the mins row location
    [~,minrow] = min(lightsequence(:,mincol));
    %[minrow,mincol] = location of the lowest number

    selectedpin = pins(minrow,mincol);
    writeDigitalPin(ard,selectedpin,1);
    lightsequence(minrow,mincol) = 100;
    pause(2)
end
board = zeros(3);
UpdateBoard(board,pins,ard);
disp(' ')

%Task 3.5 - Make the LEDs light up randomly after selecting one.
disp('Task 3.5 - Make the LEDs light up randomly after selecting one.')
disp(' ')

selectrow = input('What row number would you like to choose?  ');
selectcol = input('What column number would you like to choose?  ');
while selectrow < 0 || selectrow > 3
    selectrow = input('Choose a valid row number from 1-3.  ');
end
while selectcol < 0 || selectcol > 3
    selectcol = input('Choose a valid column number from 1-3.  ');
end

sequence = rand(3);
sequence(selectrow,selectcol) = 0;
for n = 1:(rows*cols)
    [~,colseq] = min(min(sequence));
    [~,rowseq] = min(sequence(:,colseq));
        %[rowseq, colseq] = the location of the next smallest #.
    pinseq = pins(rowseq,colseq);
    writeDigitalPin(ard,pinseq,1)
    sequence(rowseq,colseq) = 100;
    pause(2)
end
pause
board = zeros(3);
UpdateBoard(board,pins,ard);

%Task 3.6 - Call the user-defined function RandLight 5 times.
disp('Task 3.6 - Call the user-defined function RandLight 5 times.')
disp(' ')

c = 0;
for n = 1:5
    RandLight(pins,ard);
    c = c+1;
    if c == 5
        break
    end
    pause(5)
    UpdateBoard(board,pins,ard)
end
pause
board = zeros(3);
UpdateBoard(board,pins,ard);

%Task 3.7 - Using inputs, light adjacent lights until all are lit up.
disp('Task 3.7 - Using inputs, light adjacent lights until all are lit up.')
disp(' ')

rowselect = input('What row number would you like to use?  ');
colselect = input('What column number would you like to use?  ');
pinselect = pins(rowselect,colselect);
while selectrow < 0 || selectrow > 3
    selectrow = input('Choose a valid row number from 1-3.  ');
end
while selectcol < 0 || selectcol > 3
    selectcol = input('Choose a valid column number from 1-3.  ');
end
board(rowselect,colselect) = 1;
writeDigitalPin(ard,pinselect,board(rowselect,colselect));
pause(5)

checksum = sum(sum(board));

while checksum ~= 9
    %row wise
    a = board(1,:);
    b = board(2,:);
    c = board(3,:);
    
    if sum(a) > 0
        loc = find(a == 1);
            if loc == 1
                a(2) = 0.5;
            elseif loc == 2
                a(1) = 0.5;
                a(3) = 0.5;
            elseif loc == 3
                a(2) = 0.5;
            elseif sum(loc) == 3
                a(3) = 0.5;
            elseif sum(loc) == 5
                a(1) = 0.5;
            end
    end
    if sum(b) > 0
        loc = find(b == 1);
            if loc == 1
                b(2) = 0.5;
            elseif loc == 2
                b(1) = 0.5;
                b(3) = 0.5;
            elseif loc == 3
                b(2) = 0.5;
            elseif sum(loc) == 3
                b(3) = 0.5;
            elseif sum(loc) == 5
                b(1) = 0.5;
            end
    end
    if sum(c) > 0
        loc = find(c == 1);
            if loc == 1
                c(2) = 0.5;
            elseif loc == 2
                c(1) = 0.5;
                c(3) = 0.5;
            elseif loc == 3
                c(2) = 0.5;
            elseif sum(loc) == 3
                c(3) = 0.5;
            elseif sum(loc) == 5
                c(1) = 0.5;
            end
    end
    board = [a;b;c];
    clear a b c 
    %repeat it column wise
    a = board(:,1);
    b = board(:,2);
    c = board(:,3);
    if sum(a) > 0
        loc = find(a == 1);
            if loc == 1
                a(2) = 0.5;
            elseif loc == 2
                a(1) = 0.5;
                a(3) = 0.5;
            elseif loc == 3
                a(2) = 0.5;
            elseif sum(loc) == 3
                a(3) = 0.5;
            elseif sum(loc) == 5
                a(1) = 0.5;
            end
    end
    if sum(b) > 0
            loc = find(b == 1);
            if loc == 1
                b(2) = 0.5;
            elseif loc == 2
                b(1) = 0.5;
                b(3) = 0.5;
            elseif loc == 3
                b(2) = 0.5;
            elseif sum(loc) == 3
                b(3) = 0.5;
            elseif sum(loc) == 5
                b(1) = 0.5;
            end
    end
    if sum(c) > 0
            loc = find(c == 1);
            if loc == 1
                c(2) = 0.5;
            elseif loc == 2
                c(1) = 0.5;
                c(3) = 0.5;
            elseif loc == 3
                c(2) = 0.5;
            elseif sum(loc) == 3
                c(3) = 0.5;
            elseif sum(loc) == 5
                c(1) = 0.5;
            end
    end
    board = [a,b,c];
    
    for n = 1:9
        if board(n) == 0.5
            board(n) = board(n)+0.5;
        end
    end
    
    UpdateBoard(board,pins,ard)
    pause(5)
    checksum = sum(sum(board));
end
pause
board = zeros(3);
UpdateBoard(board,pins,ard)

    




