%% ENGI 1331H Project 4 – Andrew Hicks – ajhicks5 – a.j.hicks7777@gmail.com

clc
clear
close all
disp('ENGI 1331H Project 4 – Andrew Hicks – ajhicks5 – a.j.hicks7777@gmail.com')
%Task 3.1- Create 2 matrixes that represed the LED's and the bread board
Arduino=arduino();
p=["D12" , "D11" , "D10" ; "D9" , "D8" , "D7" ; "D6" , "D5" , "D4" ];
Board=zeros(3,3);
%%
%Task 3.3-Creat a loop that makes all the LED's blink three times.
disp('Task 3.3-Creat a loop that makes all the LEDs blink three times.')
[r,c]=size(Board);
for x=1:r
    for y=1:c
    Board(x,y)=1;
    UpdateBoard(Arduino,Board,p)
    pause(1)
    Board(x,y)=0;
    UpdateBoard(Arduino,Board,p)
    Board(x,y)=1;
    UpdateBoard(Arduino,Board,p)
    pause(1)
    Board(x,y)=0;
    UpdateBoard(Arduino,Board,p)
    Board(x,y)=1;
    UpdateBoard(Arduino,Board,p)
    pause(1)
    Board(x,y)=0;
    UpdateBoard(Arduino,Board,p)
    end
end
%%
%Task 3.4 load in light Sequence and make the LED's light up in that order.
disp('Task 3.4 load in light Sequence and make the LEDs light up in that order.')
Light=load('light_Sequence.csv');
[r,c]=size(Light);
for i=1:r
    for t=1:c
        p2=Light(i,t);
        writeDigitalPin(Arduino,p(p2),1);
        pause(2)
    end
end
%%
%Task 3.5 Ask the user to input a value and light it up, then randomly
%light up all other values
disp('Task 3.5 Ask the user to input a value and light it up, then randomly light up all other values')
for i=1:r
    for t=1:c
        p2=Light(i,t);
        writeDigitalPin(Arduino,p(p2),0);
        
    end
end
X=input('Enter A Row Number corresponding to the grid')
Y=input('Enter A Column Number corresponding to the grid')
writeDigitalPin(Arduino,p(X,Y),1);
Ty=[1 2 3 4 5 6 7 8 9];
Ty=Ty(randperm(length(Ty)));
[K,P]=size(Ty);
for TT=1:K
    for TTT=1:P 
        H=Ty(TT,TTT);
        writeDigitalPin(Arduino,p(H),1);
        pause(2)
    end
end
%%
%Task 3.6- Use the user defined fuction RandLight to randomly light up the
%board 3 times
disp('Task 3.6- Use the user defined fuction RandLight to randomly light up the board 3 times')
RandLight(Arduino,p,Board);
pause(5)
RandLight(Arduino,p,Board);

pause(5)
RandLight(Arduino,p,Board);

pause(5)
RandLight(Arduino,p,Board);

pause(5)
RandLight(Arduino,p,Board);
%%
%Task 3.7- Make the user input a led then make all adjacent LED's light up
%every 5 seconds
disp('Task 3.7- Make the user input a led then make all adjacent LEDs light up every 5 seconds')
[IP,TP]=size(Board);
for KHG=1:IP
    for KHF=1:TP
        writeDigitalPin(Arduino,p(KHG,KHF),0);
    end
end
XX=input('Enter A Row Number corresponding to the grid')
YY=input('Enter A Column Number corresponding to the grid')
writeDigitalPin(Arduino,p(XX,YY),1);
[r,c]=size(Board);
for XX=1:r
    for YY=1:c
        pause(5)
        if XX==1 && YY==1
            XX=XX+1;
            writeDigitalPin(Arduino,p(XX,YY),1);
            XX=XX-1;
            YY=YY+1;
            writeDigitalPin(Arduino,p(XX,YY),1);
        elseif XX==3 && YY==3
            XX=XX-1;
            writeDigitalPin(Arduino,p(XX,YY),1);
            XX=XX+1;
            YY=YY-1;
           writeDigitalPin(Arduino,p(XX,YY),1);
        elseif XX==3 && YY==1
            XX=XX-1;
            writeDigitalPin(Arduino,p(XX,YY),1);
            XX=XX+1;
            YY=YY+1;
            writeDigitalPin(Arduino,p(XX,YY),1);
        elseif XX==3
            XX=XX-1;
            writeDigitalPin(Arduino,p(XX,YY),1);
            XX=XX+1;
            YY=YY+1;
            writeDigitalPin(Arduino,p(XX,YY),1);
            YY=YY-2;
            writeDigitalPin(Arduino,p(XX,YY),1);
        elseif YY==3 && XX==1
            XX=XX+1;
            writeDigitalPin(Arduino,p(XX,YY),1);
            XX=XX-1;
            YY=YY-1;
            writeDigitalPin(Arduino,p(XX,YY),1);
        elseif YY==3
            YY=YY-1;
            writeDigitalPin(Arduino,p(XX,YY),1);
            YY=YY+1;
            XX=XX+1;
            writeDigitalPin(Arduino,p(XX,YY),1);
            XX=XX-2;
            writeDigitalPin(Arduino,p(XX,YY),1);
        elseif YY==1
            YY=YY+1;
            writeDigitalPin(Arduino,p(XX,YY),1);
            YY=YY-1;
            XX=XX+1;
            writeDigitalPin(Arduino,p(XX,YY),1);
            XX=XX-2;
            writeDigitalPin(Arduino,p(XX,YY),1);
        elseif XX==1
            XX=XX+1;
            writeDigitalPin(Arduino,p(XX,YY),1);
            XX=XX-1;
            YY=YY+1;
            writeDigitalPin(Arduino,p(XX,YY),1);
            YY=YY-2;
            writeDigitalPin(Arduino,p(XX,YY),1);
        end   
    end
end

        
        
        
        
        




