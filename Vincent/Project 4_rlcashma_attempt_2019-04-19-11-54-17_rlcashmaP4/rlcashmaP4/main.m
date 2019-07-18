%% ENGI 1331H Project 4 – Ray Cashman – 1796505 – rlcashman@uh.edu
clc; close; clear;
disp('ENGI 1331H Project 4 – Ray Cashman – 1796505 – rlcashman@uh.edu');
disp('');

% Section 3.1 – Programming the Arduino
disp('Section 3.1 – Programming the Arduino');
disp('');
Arty = arduino() %Linking Arduino
Pins = ["D12" "D11" "D10";"D9" "D8" "D7";"D6" "D5" "D4"]; %Setting Pins
Board = zeros(3); %Creating 3x3 matrix 

% Section 3.2 – User-Defined Function
disp('Section 3.2 – User-Defined Function');
disp('');

Answer = input('Enter 1 to test User Defined Function, Enter 2 to skip: ');
if Answer == 1
    Board = randi([0 1],3,3); %Random logical 3x3 matrix
    UpdateBoard(Arty,Pins,Board); %Updates board to random matrix
    pause(2);
end
    
% Section 3.3 – Blinking LEDs
disp('Section 3.3 – Blinking LEDs');
disp('');
x = 1;
while x < 4 %while loop runs 3 times
    x = x + 1; %x counter
    Board(:)=1; %set Board to logical of all 1's
    UpdateBoard(Arty,Pins,Board); %Update LED Board
    pause(1);
    Board(:)=0; %set board to all 0's
    UpdateBoard(Arty,Pins,Board); %Update LED Board
    pause(1);
end

% Section 3.4 – Light Sequencing
disp('Section 3.4 – Light Sequencing');
disp('');
LS = csvread('light_sequence.csv');
LS = LS(:)'; %Turning 3x3 matrix into vector
for c = 1:9
    i = find(LS==c); %Ordering the vector
    writeDigitalPin(Arty,Pins(i),1); %turning LED's on in order of excel
    pause(1);
end

% Section 3.5 – Input and Random LEDs
disp('Section 3.5 – Input and Random LEDs');
disp('');
UpdateBoard(Arty,Pins,Board);
RowIn = input('Enter a row number 1 to 3 to light up: '); %Row Input
if RowIn < 1
    RowIn = 1;
    warning('Value entered not within range, value assumed to be 1.') %Lower Limit
elseif RowIn > 3
    RowIn = 3;
    warning('Value entered not within range, value assumed to be 3.') %Upper Limit
end
ColIn = input('Enter a column number 1 to 3 to light up: '); %Column Input
if ColIn < 1
    ColIn = 1;
    warning('Value entered not within range, value assumed to be 1.') %Lower Limit
elseif ColIn > 3 %Upper Limit
    ColIn = 3;
    warning('Value entered not within range, value assumed to be 3.')
end
OneTwoNine = [1,2,3;4,5,6;7,8,9]; %Creating a 3x3 matrix from 1 to 9
Input = OneTwoNine(RowIn,ColIn); %Translating input into position
p = Input;
writeDigitalPin(Arty,Pins(p),1); %Turning on inputted LED first
pause(2);
while sum(sum(Board)) < 9 %While not all 9 lights are on
    Board(p) = 1;
    p = randi(9); %Generate random integer 1 to 9
    if Board(p) == 0 %If the light is not already on
    writeDigitalPin(Arty,Pins(p),1); %Turn the lED on
    pause(2);
    end
end

% Section 3.6 – Random LEDs User Defined Function
disp('Section 3.6 – Random LEDs User Defined Function');
disp('');
x = 1;
while x < 6
    x = x + 1;
    RandLight(Arty,Pins,Board); %User Defined Function
    pause(5);
end

% Section 3.7 – Cascading Lights
disp('Section 3.7 – Cascading Lights');
disp('');

RowIn = input('Enter a row number 1 to 3 to light up: ');
if RowIn < 1
    RowIn = 1;
    warning('Value entered not within range, value assumed to be 1.')
elseif RowIn > 3
    RowIn = 3;
    warning('Value entered not within range, value assumed to be 3.')
end
ColIn = input('Enter a colum number 1 to 3 to light up: ');
if ColIn < 1
    ColIn = 1;
    warning('Value entered not within range, value assumed to be 1.')
elseif ColIn > 3
    ColIn = 3;
    warning('Value entered not within range, value assumed to be 3.')
end
Input = OneTwoNine(RowIn,ColIn);
Board(:) = 0;
Board(Input) = 1;
UpdateBoard(Arty,Pins,Board);
pause(5);
while sum(sum(Board)) < 9
    Original = Board;
    if Original(1) == 1
        Board([2 4]) = 1;
    end
    if Original(2) == 1
        Board([1 3 5]) = 1;
    end
    if Original(3) == 1
        Board([2 6]) = 1;
    end
    if Original(4) == 1
        Board([1 5 7]) = 1;
    end
    if Original(5) == 1
        Board([2 4 6 8]) = 1;
    end
    if Original(6) == 1
        Board([3 5 9]) = 1;
    end
    if Original(7) == 1
        Board([4 8]) = 1;
    end
    if Original(8) == 1
        Board([5 7 9]) = 1;
    end
    if Original(9) == 1
        Board([6 8]) = 1;
    end
    UpdateBoard(Arty,Pins,Board);
    pause(5);
end
