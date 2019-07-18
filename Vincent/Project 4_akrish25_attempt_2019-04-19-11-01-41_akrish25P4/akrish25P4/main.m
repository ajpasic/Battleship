%% ENGI 1331H Project 4 – Arundhati Krishna – 1767626 – arundhati.krishna@gmail.com
clc, close, clear
disp('ENGI 1331H Project 4 – Arundhati Krishna – 1767626 – arundhati.krishna@gmail.com') 
disp(' ')   
disp('To get the next answer/output at any point, press enter!')
disp(' ')
pause 

%Section 3 - Programming the Arduino
disp('Section 2 / Task 4 – Symbolic and Anonymous Functions') 
disp(' ')
pause

%% Task 3.1 - Creating Object and Labels
disp('Task 3.1 - Creating Object and Labels')
disp(' ')
a=arduino();
pins=["D12","D11","D10";"D9","D8","D7";"D6","D5","D4"];
board = randi([0, 1], [3,3]);
[nrow ncol]=size(board);

%% Task 3.2 - On/Off
disp('Task 3.2 - Board Lights On')
disp(' ')
UpdateBoard(a,pins,board) %random light ups
randi([0, 1], [3,3]);
pause

%% Task 3.3 - Blinking
disp('Task 3.3 - Blinking')
disp(' ')

onboard=[1,1,1;1,1,1;1,1,1];
offboard=[0,0,0;0,0,0;0,0,0];

for i=1:1:3 %blinking 3 times
   UpdateBoard(a,pins,onboard)
   pause(1)
   UpdateBoard(a,pins,offboard)
   pause(1)
end
       
pause

%% Task 3.4 - Light Sequence
disp('Task 3.4 - Light Sequence')
disp(' ')

matrix=load('Light_Sequence.csv');
k=reshape(matrix,[1,9]);
p=reshape(pins,[1,9]);

for t=1:9
    locations(t)=find(k==t);
end

for tt=1:9
writeDigitalPin(a,pins(locations(tt)),1)
pause(2)
writeDigitalPin(a,pins(locations(tt)),0) %given random excel sequence
end

pause

%% Task 3.5 - User Input/Random Order
disp('Task 3.5 - User Input/Random Order')
disp(' ')
board35=randperm(9);
board35f=reshape(board35,[3,3]);

row=input('Input a row number (1-3):')
column=input('Input a column number (1-3):')

for b=1:9
    locations35(b)=find(board35f==b);
end


for qq=1:9
    writeDigitalPin(a,pins(row,column),1)
    if board35f(row,column)==board35f(row,column) 
           pause(2)    
           writeDigitalPin(a,pins(locations35(qq)),1) %light up one and then the rest of the led lights
    end
end

pause

%% Task 3.6 - RandLight 5 Iterations
disp('Task 3.6 - RandLight 5 Iterations')
disp(' ')

RandLight(a,pins)
pause(5)
RandLight(a,pins) %light up 5 random pins and repeat 5 times
pause(5)
RandLight(a,pins)
pause(5)
RandLight(a,pins)
pause(5)
RandLight(a,pins)

pause

%% Task 3.7 - Adjacent Lights
disp('Task 3.7 - Adjacent Lights')
disp(' ')

writeDigitalPin(a,'D12',0)
writeDigitalPin(a,'D11',0)
writeDigitalPin(a,'D10',0)
writeDigitalPin(a,'D9',0)
writeDigitalPin(a,'D8',0)
writeDigitalPin(a,'D7',0)
writeDigitalPin(a,'D6',0)
writeDigitalPin(a,'D5',0)
writeDigitalPin(a,'D4',0)
            
row37=input('Input a row number (1-3):')
col37=input('Input a column number (1-3):')


if (row37==1) && (col37==1)
    writeDigitalPin(a,pins(row37,col37),1)
    pause(5)
    writeDigitalPin(a,pins(row37+1,col37),1)
    writeDigitalPin(a,pins(row37,col37+1),1)
    pause(5)
    writeDigitalPin(a,pins(row37,col37+2),1)
    writeDigitalPin(a,pins(row37+1,col37+1),1)
    writeDigitalPin(a,pins(row37+2,col37),1)
    pause(5)
    writeDigitalPin(a,pins(row37+1,col37+2),1)
    writeDigitalPin(a,pins(row37+2,col37+1),1)
    pause(5)
    writeDigitalPin(a,pins(row37+2,col37+2),1)
elseif (row37==1) && (col37==2)
    writeDigitalPin(a,pins(row37,col37),1)
    pause(5)
    writeDigitalPin(a,pins(row37+1,col37),1)
    writeDigitalPin(a,pins(row37,col37-1),1)
    writeDigitalPin(a,pins(row37,col37+1),1)
    pause(5)
    writeDigitalPin(a,pins(row37+1,col37-1),1)
    writeDigitalPin(a,pins(row37+2,col37),1)
    writeDigitalPin(a,pins(row37+1,col37+1),1)
    pause(5)
    writeDigitalPin(a,pins(row37+2,col37-1),1)
    writeDigitalPin(a,pins(row37+2,col37+1),1)
elseif (row37==1) && (col37==3)
    writeDigitalPin(a,pins(row37,col37),1)
    pause(5)
    writeDigitalPin(a,pins(row37+1,col37),1)
    writeDigitalPin(a,pins(row37,col37-1),1)
    pause(5)
    writeDigitalPin(a,pins(row37+2,col37),1)
    writeDigitalPin(a,pins(row37+1,col37-1),1)
    writeDigitalPin(a,pins(row37,col37-2),1)
    pause(5)
    writeDigitalPin(a,pins(row37+1,col37-2),1)
    writeDigitalPin(a,pins(row37+2,col37-1),1)
    pause(5)
    writeDigitalPin(a,pins(row37+2,col37-2),1)
elseif (row37==2) && (col37==1)
    writeDigitalPin(a,pins(row37,col37),1)
    pause(5)
    writeDigitalPin(a,pins(row37-1,col37),1)
    writeDigitalPin(a,pins(row37,col37+1),1)
    writeDigitalPin(a,pins(row37+1,col37),1)
    pause(5)
    writeDigitalPin(a,pins(row37-1,col37+1),1)
    writeDigitalPin(a,pins(row37,col37+2),1)
    writeDigitalPin(a,pins(row37+1,col37+1),1)
    pause(5)
    writeDigitalPin(a,pins(row37-1,col37+2),1)
    writeDigitalPin(a,pins(row37+1,col37+2),1)
elseif (row37==2) && (col37==2)
    writeDigitalPin(a,pins(row37,col37),1)
    pause(5)
    writeDigitalPin(a,pins(row37-1,col37),1)
    writeDigitalPin(a,pins(row37,col37+1),1)
    writeDigitalPin(a,pins(row37+1,col37),1)
    writeDigitalPin(a,pins(row37,col37-1),1)
    pause(5)
    writeDigitalPin(a,pins(row37-1,col37-1),1)
    writeDigitalPin(a,pins(row37-1,col37+1),1)
    writeDigitalPin(a,pins(row37+1,col37-1),1)
    writeDigitalPin(a,pins(row37+1,col37+1),1)
elseif (row37==2) && (col37==3)
    writeDigitalPin(a,pins(row37,col37),1)
    pause(5)
    writeDigitalPin(a,pins(row37-1,col37),1)
    writeDigitalPin(a,pins(row37,col37-1),1)
    writeDigitalPin(a,pins(row37+1,col37),1)
    pause(5)
    writeDigitalPin(a,pins(row37+1,col37-1),1)
    writeDigitalPin(a,pins(row37,col37-2),1)
    writeDigitalPin(a,pins(row37-1,col37-1),1)
    pause(5)
    writeDigitalPin(a,pins(row37-1,col37-2),1)
    writeDigitalPin(a,pins(row37+1,col37-2),1)
elseif (row37==3) && (col37==1)
    writeDigitalPin(a,pins(row37,col37),1)
    pause(5)
    writeDigitalPin(a,pins(row37-1,col37),1)
    writeDigitalPin(a,pins(row37,col37+1),1)
    pause(5)
    writeDigitalPin(a,pins(row37-2,col37),1)
    writeDigitalPin(a,pins(row37-1,col37+1),1)
    writeDigitalPin(a,pins(row37,col37+2),1)
    pause(5)
    writeDigitalPin(a,pins(row37-2,col37+1),1)
    writeDigitalPin(a,pins(row37-1,col37+2),1)
    pause(5)
    writeDigitalPin(a,pins(row37-2,col37+2),1)
elseif (row37==3) && (col37==2)
    writeDigitalPin(a,pins(row37,col37),1)
    pause(5)
    writeDigitalPin(a,pins(row37,col37-1),1)
    writeDigitalPin(a,pins(row37-1,col37),1)
    writeDigitalPin(a,pins(row37,col37+1),1)
    pause(5)
    writeDigitalPin(a,pins(row37-2,col37),1)
    writeDigitalPin(a,pins(row37-1,col37+1),1)
    writeDigitalPin(a,pins(row37-1,col37-1),1)
    pause(5)
    writeDigitalPin(a,pins(row37-2,col37+1),1)
    writeDigitalPin(a,pins(row37-2,col37-1),1)
elseif (row37==3) && (col37==3)
    writeDigitalPin(a,pins(row37,col37),1)
    pause(5)
    writeDigitalPin(a,pins(row37-1,col37),1)
    writeDigitalPin(a,pins(row37,col37-1),1)
    pause(5)
    writeDigitalPin(a,pins(row37-2,col37),1)
    writeDigitalPin(a,pins(row37-1,col37-1),1)
    writeDigitalPin(a,pins(row37,col37-2),1)
    pause(5)
    writeDigitalPin(a,pins(row37-2,col37-1),1)
    writeDigitalPin(a,pins(row37-1,col37-2),1)
    pause(5)
    writeDigitalPin(a,pins(row37-2,col37-2),1)
end





