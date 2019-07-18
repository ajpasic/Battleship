function [] = RandLight(a,pins,board)
q = randi(9);
fprintf('%0.0f LED(s) will now be lit',q);
disp('\');
while sum(sum(board)) ~= q
    row = randi(3);
    col = randi(3);
    if board(row,col) == 0
        board(row,col) = 1;
    UpdateBoard(a,pins,board);
    end
    
    
end
pause(5)
board = zeros([3,3]);
UpdateBoard(a,pins,board);
end

