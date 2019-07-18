function [] = RandLight(a,pins)

%Get Random number of Lights and assigns them randomly, Ensuring they don't
%Overlap
board = zeros([3 3]);
LEDNUM = randi([1 9]);
while sum(sum(board)) < LEDNUM
I = randi([1 9]);
while board(I) == 1 
    I = randi([1 9]);
end
board(I) = 1;
UpdateBoard(a,pins,board)
pause(0.5)
end
end

