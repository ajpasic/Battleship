clc
clear all
close all


%Brian Irianto
%1764398    
%bmirianto@uh.edu

fprintf('Brian Irianto\n1764398\nbmirianto@uh.edu');
pause

%Section 3 - Programming the arduino
%Section Overview: Manipulate the LEDs of an arduino in various ways 
fprintf('\n\nSection 3 - Programming the arduino\nSection Overview: Manipulate the LEDs of an arduino in various ways.');
pause

%Task 3.1 - Create and assign an arduino object and create a 3x3 matrix
%called pins containing the labels for each LED and another matrix called
%board containing the status of the pins using 1s and 0s 
fprintf('\n\nTask 3.1 - Create and assign an arduino object and create a 3x3 matrix called pins containing the labels for each LED.');
pause

%Create and assign arduino object
a=arduino();

%Create 3x3 Matrix called pins

pins=["D12" "D11" "D10";
    "D9" "D8" "D7";
    "D6" "D5" "D4"];

%Create a 3x3 matrix called board 

board=[0,0,0;
    0,0,0;
    0,0,0];

%Task 3.2 - Create a user defined function that updates the LEDs to reflect
%the values in the board matrix.
fprintf('\n\nTask 3.2 - Create a user defined function that updates the LEDs to reflect the values in the board matrix.');
pause


%Task 3.3 - Use a loop to make all the LEDs blink simultaneously three
%times. 
fprintf('\n\nTask 3.3 - Use a loop to make all the LEDs blink simultaneously three times.')
pause

for x= 1:1:3 % repeat three times
    
    %Change the board to light up all LEDs
    board=[1,1,1;1,1,1;1,1,1];
    %Update the board with the new values using the user defined function
    UpdateBoard(a,board,pins);
    pause(1);
    %Change the board to turn off all LEDs
    board=[0,0,0;0,0,0;0,0,0];
    %Update the board with the new values using the user defined function
    UpdateBoard(a,board,pins);
    pause(1);
    
    
end

%Task 3.4 - Read in light_sequence.csv and make the LEDS light up in an
%order that follows the numbers in the matrix.
fprintf('\n\nTask 3.4 - Read in light_sequence.csv and make the LEDs light up in an order that follows the numbers in the matrix.');
pause

%read in light_sequence.csv 
LightSequence=load('Light_Sequence.csv');

%Initializing count 
c=0;

%sizing light sequence
[rs,rc]=size(LightSequence);

%Turn on LEDs 
for b=1:1:(rs*rc)+1 %Loops until the counter has run for the total number LEDs in the matrix 
    [x,y]=find(LightSequence==min(min(LightSequence)+c)); %Find the min of the matrix and add the number of times it has run 
    board(x,y)=1;
    UpdateBoard(a,board,pins);
    pause(2)
    c=c+1;
    
    %Turn off the LEDs once all are lit up.
    if c==(rs*rc)+1
        board=[0,0,0;
               0,0,0;
               0,0,0];
        UpdateBoard(a,board,pins);
    
    end
        
end


%Task 3.5 - Ask the user for a row and column number and light the selected
%LED up. Then, light up all remaining LEDs every 2 seconds until all LEDs
%are lit. 
fprintf('\n\nTask 3.5 - Ask the user for a row and column number and light the selected LED up. Then, light up all remaining LEDs every 2 seconds until all LEDs are light up.');

%Getting the user input data
SelectedRow=input('\n\nPlease enter your desired row.');
SelectedColumn=input('\n\nPlease enter your desired column');

%Lighting up the LED and the chosen coordinate 
board(SelectedRow,SelectedColumn)=1;
UpdateBoard(a,board,pins);
pause(2)

%Create and resize a random vector of values from 1 to 9 
RandomVector=randperm(9);
RandomMatrix=reshape(RandomVector,3,3);

%Size the newly created random matrix
 [RandomRow,RandomColumn]=size(RandomMatrix);
 
%Light up in random order the LEDs at random position x and random position
%y untill all remaining are lit up.
for index=1:1:(RandomRow*RandomColumn)+1
    for x=1:1:RandomRow
        for y=1:1:RandomColumn
            if RandomMatrix(x,y)== index
                board(x,y)=1;
                UpdateBoard(a,board,pins);
                pause(2)
                if board==[1,1,1;
                           1,1,1;
                           1,1,1];
                       
                    board=[0,0,0;
                           0,0,0;
                           0,0,0];
                     UpdateBoard(a,board,pins);
                end
                       
            end
        end
    end
end
   
%Task 3.6 - Create a function called RandLight that will light up a random
%number of LEDs five times with a five second delay. Each randomly selected
%LED should be displayed to the command window.
fprintf('\n\nTask 3.6 - Create a function called RandLight that will light up a random number of LEDs five times with a five second delay. Each randomly selected LED should be displayed in the command window.');
pause

RandLight(a,board,pins);


%Task 3.7 - Ask the user for an LED to light up then in five second
%intervals, light up all adjacent LEDs until all LEDs are lit up.
fprintf('\n\nTask 3.7 - Ask the user for an LED to light up then in five second intervals, light up all adjacent LEDs until all LEDs are lit up.');
pause

%Asking for initla row and column
FirstR=input('\n\nPlease select a row.');
FirstC=input('\n\nPlease Select a column.');

%Light up LED at specified row and column
board(FirstR,FirstC)=1;
UpdateBoard(a,board,pins);
pause(5)

%Light up adjacent LEDs 
if FirstR==1 & FirstC==1
    board(1,2)=1;
    board(2,1)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(1,3)=1;
    board(2,2)=1;
    board(3,1)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(3,2)=1;
    board(2,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)  
    board(3,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board=[0,0,0;
            0,0,0;
            0,0,0];
     UpdateBoard(a,board,pins);
     
end
            
     
if FirstR==1 & FirstC==2
    board(1,1)=1;
    board(1,3)=1;
    board(2,2)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(2,1)=1;
    board(2,3)=1;
    board(3,2)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(3,1)=1;
    board(3,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board=[0,0,0;
            0,0,0;
            0,0,0];
    UpdateBoard(a,board,pins);
    
end
    
    if FirstR==1 & FirstC==3
    board(1,2)=1;
    board(2,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(1,1)=1;
    board(2,2)=1;
    board(3,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(2,1)=1;
    board(3,1)=1;
    board(3,2)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board=[0,0,0;
           0,0,0;
           0,0,0];
     UpdateBoard(a,board,pins);
    end
     
if FirstR==2 & FirstC==1
    board(1,1)=1;
    board(2,2)=1;
    board(3,1)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(1,2)=1;
    board(3,2)=1;
    board(2,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(1,3)=1;
    board(3,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board=[0,0,0;
           0,0,0;
           0,0,0];
    UpdateBoard(a,board,pins);
end
       
if FirstR==2 & FirstC==2 
    board(1,2)=1;
    board(2,1)=1;
    board(2,3)=1;
    board(3,2)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(1,1)=1;
    board(1,3)=1;
    board(3,1)=1;
    board(3,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board=[0,0,0;
           0,0,0;
           0,0,0];
    UpdateBoard(a,board,pins);
end
       
if FirstR==2 & FirstC==3
    board(1,3)=1;
    board(2,2)=1;
    board(3,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(2,1)=1;
    board(1,2)=1;
    board(3,2)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(1,1)=1;
    board(3,1)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board=[0,0,0;
           0,0,0;
           0,0,0];
    UpdateBoard(a,board,pins);
end
       
if FirstR==3 & FirstC==1
    board(2,1)=1;
    board(3,2)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(1,1)=1;
    board(2,2)=1;
    board(3,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(1,2)=1;
    board(2,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(1,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board=[0,0,0;
           0,0,0;
           0,0,0];
    UpdateBoard(a,board,pins);
end
       
if FirstR==3 & FirstC==2
    board(3,1)=1;
    board(2,2)=1;
    board(3,3)=1;
    UpdateBoard(a,board,pins);
    pause(5);
    board(2,1)=1;
    board(1,2)=1;
    board(2,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(1,1)=1;
    board(1,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board=[0,0,0;
           0,0,0;
           0,0,0];
    UpdateBoard(a,board,pins);
end
       
if FirstR==3 & FirstC==3
    board(3,2)=1;
    board(2,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(3,1)=1;
    board(2,2)=1;
    board(1,3)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(2,1)=1;
    board(1,2)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board(1,1)=1;
    UpdateBoard(a,board,pins);
    pause(5)
    board=[0,0,0;
           0,0,0;
           0,0,0];
      
    UpdateBoard(a,board,pins);
end
        
    
    
    
    
    
    
    
    
    
