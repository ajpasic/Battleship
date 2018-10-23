clc,clear,close;

% Task 2.1
a = arduino();
board = zeros(3);
pins = ["D2","D3","D4";"D7","D8","D9";"D11","D12","D13"];


% Task 2.2


% Task 2.3
for i=1:1:3
    for n=1:1:9
        board(n)=1;
    end
    vUpdateBoard(a,board,pins)
    pause(1)
    for m=1:1:9
        board(m)=0;
    end
    vUpdateBoard(a,board,pins)
    pause(1)
end

% Task 2.4
board = [1,0,1;0,1,0;1,0,1];
vUpdateBoard(a,board,pins)
pause(3)
board = [0,1,0;1,1,1;0,1,0];
vUpdateBoard(a,board,pins)
pause(3)
board = zeros(3);
vUpdateBoard(a,board,pins)
choice = input('Choose either "x" or "+": ','s');
if choice == "x"
    board = [1,0,1;0,1,0;1,0,1];
elseif choice == "+"
    board = [0,1,0;1,1,1;0,1,0];
else
    disp("You did not input a correct value")
end
vUpdateBoard(a,board,pins)
pause(3)
board = zeros(3);
vUpdateBoard(a,board,pins)

% Task 2.7
for i=1:1:5
    vRandLight(a,board,pins)
    pause(4)
end
board = zeros(3);
vUpdateBoard(a,board,pins)

% Task 2.6


% Task 2.5
inputRow = input('Select a row: ');
inputCol = input('Select a column: ');
board(inputRow,inputCol) = 1;
vUpdateBoard(a,board,pins)
pause(2)
for i=1:1:8
    picked = 0;
    while picked ~= 1
        loc = randi(9);
        if board(loc) == 0
            board(loc) = 1;
            picked = 1;
        end
    end
    vUpdateBoard(a,board,pins)
    pause(2)
end
board = zeros(3);
vUpdateBoard(a,board,pins)

% Task 2.8
inputRow = input('Select a row: ');
inputCol = input('Select a column: ');
board(inputRow,inputCol) = 1;
vUpdateBoard(a,board,pins)
pause(5)
while find(~board) > 0
    tempboard = board;
    for r=1:1:3
        for c=1:1:3
            if r>1
                if board(r-1,c) == 1
                    tempboard(r,c)=1;
                    %%break
                end
            end
            if r<3
                if board(r+1,c) == 1
                    tempboard(r,c)=1;
                    %%break
                end
            end
            if c>1
                if board(r,c-1) == 1
                    tempboard(r,c)=1;
                    %%break
                end
            end
            if c<3
                if board(r,c+1) == 1
                    tempboard(r,c)=1;
                    %%break
                end
            end
        end
    end
    board = tempboard;
    vUpdateBoard(a,board,pins)
    pause(5)
end
board = zeros(3);
vUpdateBoard(a,board,pins)