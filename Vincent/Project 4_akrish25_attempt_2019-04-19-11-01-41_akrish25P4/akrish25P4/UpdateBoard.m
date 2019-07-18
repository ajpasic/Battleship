function ub=UpdateBoard(a,pins,board)
[nrow ncol]=size(board);
for r=1:nrow
     for c=1:ncol
         if board(r,c)== 0
          writeDigitalPin(a,pins(r,c),0)
         else
          writeDigitalPin(a,pins(r,c),1)
         end
     end
end
end
           