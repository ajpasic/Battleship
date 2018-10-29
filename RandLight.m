function RandLight(a,board,pins)
% This function picks a random number 1-9 and lights up that many
% LEDs. The lit LEDs are also chosen randomly.

board = zeros(3);
num = randi(9);
disp(num)
for i = 1:1:num
     picked = 0;
     while picked ~= 1
         loc = randi(9);
         if board(loc) ==0
             board(loc) = 1;
             picked = 1;
         end
         
     end
end

UpdateBoard(a,board,pins)


end

