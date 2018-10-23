function vRandLight(a,board,pins)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

board = zeros(3);
num = randi(9);
disp(num)
for i = 1:1:num
%     loc = randi(9);
%     if board(loc) == 0
%         board(loc)=1;
%     else
%        i=i-1;
%     end
    
     picked = 0;
     while picked ~= 1
         loc = randi(9);
         if board(loc) ==0
             board(loc) = 1;
             picked = 1;
         end
         
     end
end

vUpdateBoard(a,board,pins)


end

