%% ENGI 1331H Project 4 - Jose Perez - 1782908 - jlperez13@uh.edu
clc; clear all; close all;
disp('ENGI 1331H Project 4-Jose Perez-1782908-jlperez13@uh.edu')
disp(' ')
%% Section 3 - Programming the Arduino
disp('Section 3 - Programming the Arduino')
disp(' ')

% Task 3.1 - Set up Arduino connection
disp('Task 3.1 - Set up Arduino connection')
a = arduino();
pins = ["D12" "D11" "D10"
    "D9" "D8" "D7"
    "D6" "D5" "D4"];
board = randi([0 1],3);
disp(' ')

% Task 3.2 - Create UpdateBoard() Function
disp('Task 3.2 - Create UpdateBoard() Function')
UpdateBoard(a,board,pins)
disp(' ')

% Task 3.3 - Use a loop to make LEDs blink three times
disp('Task 3.3 - Use loops to make LEDs blink three times')
for l = 1:1:9
    writeDigitalPin(a,pins(l),1)
end
pause(1)
for l = 1:1:9
    writeDigitalPin(a,pins(l),0)
end
pause(1)
for l = 1:1:9
    writeDigitalPin(a,pins(l),1)
end
pause(1)
for l = 1:1:9
    writeDigitalPin(a,pins(l),0)
end
pause(1)
for l =1:1:9
    writeDigitalPin(a,pins(l),1)
end
pause(1)
for l = 1:1:9
    writeDigitalPin(a,pins(l),0)
end
pause(1)
disp(' ')

% Task 3.4-Light up LED in order of the matrix
disp('Task 3.4- Light up LEDs in order of matrix')
light_sequence = csvread('Light_Sequence.csv');
for l = 1:1:9
    writeDigitalPin(a,pins(light_sequence(l)),1)
    pause(2)
end
for l = 1:1:9
    writeDigitalPin(a,pins(l),0)
end
disp(' ')

% Task 3.5-Ask for row & column and ligth up LED & then light up rest
disp('Task 3.5-Ask for row&column and ligth up LED & then light up rest')
r = input('Input a row number within the range of the matrix:' );
c = input('Input a column number within the range of the matrix:');
while r >3 || c>3
    warning('The value exceeds the length of 3')
    r = input('Input a row number within the range of the matrix:' );
    c = input('Input a column number within the range of the matrix:');
end
writeDigitalPin(a,pins(r,c),1)
rn = randperm(9,9);
pause(2)
for l = 1:1:9
    writeDigitalPin(a,pins(rn(l)),1)
    if pins(rn(l)) == pins(r,c)
        continue
    end
    pause(2)
end
for l = 1:1:9
    writeDigitalPin(a,pins(l),0)
end
disp(' ')

% Task 3.6 - Create userdefined function RandLight()
disp('Task 3.6 - Create user-defined function RandLight()')
RandLight(a,pins)
RandLight(a,pins)
RandLight(a,pins)
RandLight(a,pins)
RandLight(a,pins)
disp(' ')

% Task 3.7 - Ask for row/col number, light it up and the adjacents
disp('Ask for row/col number, light it up and the adjacents')
rows = input('Input a row number to light up:');
cols = input('Input a column number to ligth up:');
while cols >3 || rows>3
    warning('Value exceeds the bounderies of the 3x3 matrix')
    cols  = input('Input a column number to light up:');
    rows = input('Input a row number to ligth up:');
end
writeDigitalPin(a,pins(rows,cols),1)
pause(5)
count = 1;
if rows ==1
    writeDigitalPin(a,pins(rows+1,cols),1)
    writeDigitalPin(a,pins(rows+2,cols),1)
elseif rows ==2
    writeDigitalPin(a,pins(rows+1,cols),1)
    writeDigitalPin(a,pins(rows-1,cols),1)
elseif rows == 3
    writeDigitalPin(a,pins(rows-1,cols),1)
    writeDigitalPin(a,pins(rows-2,cols),1)
end
if cols ==1
    writeDigitalPin(a,pins(rows,cols+1),1)
    writeDigitalPin(a,pins(rows,cols+2),1)
elseif cols ==2
    writeDigitalPin(a,pins(rows,cols+1),1)
    writeDigitalPin(a,pins(rows,cols-1),1)
elseif cols ==3
    writeDigitalPin(a,pins(rows,cols-1),1)
    writeDigitalPin(a,pins(rows,cols-2),1)
end
pause(5)
row = input('Input another row value:');
col = input('Input another column value:');
while pins(col,row) == pins(cols,rows)
    warning('Cannot be the same LED as before')
    col = input('Input another column value');
    row = input('Input another row value');
end
    writeDigitalPin(a,pins(row,col),1)
    pause(5)
    if row ==1
        writeDigitalPin(a,pins(row+1,col),1)
        writeDigitalPin(a,pins(row+2,col),1)
    elseif row ==2
        writeDigitalPin(a,pins(row+1,col),1)
        writeDigitalPin(a,pins(row-1,col),1)
    elseif row == 3
        writeDigitalPin(a,pins(row-1,col),1)
        writeDigitalPin(a,pins(row-2,col),1)
    end
    if col ==1
        writeDigitalPin(a,pins(row,col+1),1)
        writeDigitalPin(a,pins(row,col+2),1)
    elseif col ==2
        writeDigitalPin(a,pins(row,col+1),1)
        writeDigitalPin(a,pins(row,col-1),1)
    elseif col ==3
        writeDigitalPin(a,pins(row,col-1),1)
        writeDigitalPin(a,pins(row,col-2),1)
        pause(5)
    end
rr = input('Input another row value:');
cc = input('Input another column valeu:');
while pins(rr,cc) == pins(rows,cols) || pins(rr,cc) == pins(row,col)
    warning('Cannot be same value as before')
    rr = input('Input another row value:');
    cc = input('Input another column value:');
end
writeDigitalPin(a,pins(rr,cc),1)
pause(5)
if rr ==1
    writeDigitalPin(a,pins(rr+1,cc),1)
    writeDigitalPin(a,pins(rr+2,cc),1)
elseif rr ==2
    writeDigitalPin(a,pins(rr+1,cc),1)
    writeDigitalPin(a,pins(rr-1,cc),1)
elseif rr == 3
    writeDigitalPin(a,pins(rr-1,cc),1)
    writeDigitalPin(a,pins(rr-2,cc),1)
end
if cc ==1
    writeDigitalPin(a,pins(rr,cc+1),1)
    writeDigitalPin(a,pins(rr,cc+2),1)
elseif cc ==2
    writeDigitalPin(a,pins(rr,cc+1),1)
    writeDigitalPin(a,pins(rr,cc-1),1)
elseif cc ==3
    writeDigitalPin(a,pins(rr,cc-1),1)
    writeDigitalPin(a,pins(rr,cc-2),1)
    pause(5)
end
if (rr == rows == row) ||(col==cols==cc)
    disp(' ')
else
    rrr = input('Input another row value');
    ccc = input('Input another column value');
    while pins(rrr,ccc) == pins(rr, cc)
        warning('Cannot be same as last values')
        rrr = input('Input another row value');
        ccc = input('Input another column value');
    end
    pause(5)
    if rrr ==1
        writeDigitalPin(a,pins(rrr+1,ccc),1)
        writeDigitalPin(a,pins(rrr+2,ccc),1)
    elseif rrr ==2
        writeDigitalPin(a,pins(rrr+1,ccc),1)
        writeDigitalPin(a,pins(rrr-1,ccc),1)
    elseif rrr == 3
        writeDigitalPin(a,pins(rrr-1,ccc),1)
        writeDigitalPin(a,pins(rrr-2,ccc),1)
    end
    if ccc ==1
        writeDigitalPin(a,pins(rrr,ccc+1),1)
        writeDigitalPin(a,pins(rrr,ccc+2),1)
    elseif ccc ==2
        writeDigitalPin(a,pins(rrr,ccc+1),1)
        writeDigitalPin(a,pins(rrr,ccc-1),1)
    elseif ccc ==3
        writeDigitalPin(a,pins(rrr,ccc-1),1)
        writeDigitalPin(a,pins(rrr,ccc-2),1)
        pause(5)
    end
    
    rrrr = input('Input another row value');
    cccc = input('Input another column value');
    while pins(rrrr,cccc) == pins(rrr, ccc)
        warning('Cannot be same as last values')
        rrrr = input('Input another row value');
        cccc= input('Input another column value');
    end
    pause(5)
    if rrrr ==1
        writeDigitalPin(a,pins(rrrr+1,cccc),1)
        writeDigitalPin(a,pins(rrrr+2,cccc),1)
    elseif rrrr ==2
        writeDigitalPin(a,pins(rrrr+1,cccc),1)
        writeDigitalPin(a,pins(rrrr-1,cccc),1)
    elseif rrrr == 3
        writeDigitalPin(a,pins(rrrr-1,cccc),1)
        writeDigitalPin(a,pins(rrrr-2,cccc),1)
    end
    if cccc ==1
        writeDigitalPin(a,pins(rrrr,cccc+1),1)
        writeDigitalPin(a,pins(rrrr,cccc+2),1)
    elseif cccc ==2
        writeDigitalPin(a,pins(rrrr,cccc+1),1)
        writeDigitalPin(a,pins(rrrr,cccc-1),1)
    elseif cccc ==3
        writeDigitalPin(a,pins(rrrr,cccc-1),1)
        writeDigitalPin(a,pins(rrrr,cccc-2),1)
        pause(5)
    end

end

