function [randomTimes,randomMatrix] = RandLight(a,pins)
%Generates random locations on a matrix which will light up in order
%   a = arduino object
%   pins = names of the pins on the board matrix
start = 1; %Starts at 1
randomTimes = randi(9);   %Random integer 1-9 
randomrowb = randperm(9); %Random integer 1-9 vector
row1b = randomrowb(1,1:3); %first 3 integers
row2b = randomrowb(1,4:6); %second 3 integers
row3b = randomrowb(1,7:9); %last 3 integers
randomMatrix = [row1b;row2b;row3b]; %random matrix


for n = start:randomTimes   %runs the exact amont of times dictated by the random integer
    for r3 = 1:3     %increment rows
        for c3 = 1:3   %increment cols
            if randomMatrix(r3,c3) == n  %if the value in the matrix = the iteration
                writeDigitalPin(a,pins(r3,c3),1) %the random pin will light up
            end
        end
    end
    
end
fprintf('The number of LEDs illuminated is %0.0f\n',(randomTimes));  %displays number of pins that will light up
pause(5);  %waits 5 seconds

